/*
gcc -O0 benchmark.c -o benchmark_O0
gcc -O3 benchmark.c -o benchmark_O3
*/

#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>

#define WIDTH 4000
#define HEIGHT 4000
#define REPEAT 5

typedef struct {
    unsigned char r, g, b;
} Pixel;

Pixel *create_flat_data(int width, int height) {
    Pixel *data = malloc(sizeof(Pixel) * width * height);
    if (!data) {
        fprintf(stderr, "malloc failed!\n");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < width * height; i++) {
        data[i].r = rand() % 256;
        data[i].g = rand() % 256;
        data[i].b = rand() % 256;
    }
    return data;
}

Pixel **create_nested_data(Pixel *flat, int width, int height) {
    Pixel **nested = malloc(sizeof(Pixel *) * height);
    if (!nested) {
        fprintf(stderr, "nested malloc failed!\n");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < height; i++) {
        nested[i] = &flat[i * width];
    }
    return nested;
}

unsigned long long test_flat(Pixel *data, int width, int height) {
    unsigned long long total = 0;
    for (int i = 0; i < height; i++) {
        int row_start = i * width;
        for (int j = 0; j < width; j++) {
            total += data[row_start + j].r;
        }
    }
    return total;
}

unsigned long long test_nested(Pixel **data, int width, int height) {
    unsigned long long total = 0;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            total += data[i][j].r;
        }
    }
    return total;
}

double timediff_sec(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
}

int main() {
    srand(time(NULL));
    Pixel *flat_data = create_flat_data(WIDTH, HEIGHT);
    Pixel **nested_data = create_nested_data(flat_data, WIDTH, HEIGHT);

    struct timespec start, end;
    double flat_total_time = 0, nested_total_time = 0;

    for (int k = 0; k < REPEAT; k++) {
        clock_gettime(CLOCK_MONOTONIC, &start);
        unsigned long long flat_sum = test_flat(flat_data, WIDTH, HEIGHT);
        clock_gettime(CLOCK_MONOTONIC, &end);
        flat_total_time += timediff_sec(start, end);

        clock_gettime(CLOCK_MONOTONIC, &start);
        unsigned long long nested_sum = test_nested(nested_data, WIDTH, HEIGHT);
        clock_gettime(CLOCK_MONOTONIC, &end);
        nested_total_time += timediff_sec(start, end);
    }

    printf("Flat avg: %f seconds\n", flat_total_time / REPEAT);
    printf("Nested avg: %f seconds\n", nested_total_time / REPEAT);

    FILE *out = fopen("results.csv", "a");
    fprintf(out, "%d,%d,%.6f,%.6f\n", WIDTH, HEIGHT, flat_total_time / REPEAT, nested_total_time / REPEAT);
    fclose(out);

    free(nested_data);
    free(flat_data);
    return 0;
}

