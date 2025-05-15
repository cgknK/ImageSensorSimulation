#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

#define WIDTH 40000
#define HEIGHT 40000
#define ITERATIONS 5

typedef struct {
    unsigned char r, g, b;
} Pixel;

Pixel *create_flat_data(int width, int height) {
    Pixel *data = malloc(sizeof(Pixel) * width * height);
    if (!data) {
        fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * width * height);
        exit(EXIT_FAILURE);
    }
    printf("%s", "malloc baþarýlý: ... byte (... MB)\n");
    int i;
    for (i = 0; i < width * height; i++) {
        data[i].r = rand() % 256;
        data[i].g = rand() % 256;
        data[i].b = rand() % 256;
    }
    return data;
}

Pixel **create_nested_data(Pixel *flat_data, int width, int height) {
    Pixel **data = malloc(sizeof(Pixel *) * height);
    if (!data) return NULL;
    int i;
    for (i = 0; i < height; i++) {
        data[i] = &flat_data[i * width];
    }
    return data;
}

unsigned long long test_flat(Pixel *flat_data, int width, int height) {
    unsigned long long total = 0;
    int i, j;
    for (i = 0; i < height; i++) {
        int row_start = i * width;
        for (j = 0; j < width; j++) {
            total += flat_data[row_start + j].r;
        }
    }
    return total;
}

unsigned long long test_nested(Pixel **nested_data, int width, int height) {
    unsigned long long total = 0;
    int i, j;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            total += nested_data[i][j].r;
        }
    }
    return total;
}

double get_time_diff(LARGE_INTEGER start, LARGE_INTEGER end, LARGE_INTEGER frequency) {
    return (double)(end.QuadPart - start.QuadPart) / frequency.QuadPart;
}

int main() {
    srand((unsigned int)time(NULL));

    int width = WIDTH;
    int height = HEIGHT;

    Pixel *flat_data = create_flat_data(width, height);
    if (!flat_data) {
        fprintf(stderr, "flat_data malloc baþarýsýz!\n");
        exit(1);
    }

    Pixel **nested_data = create_nested_data(flat_data, width, height);
    if (!nested_data) {
        fprintf(stderr, "nested_data malloc baþarýsýz!\n");
        free(flat_data);
        exit(1);
    }

    LARGE_INTEGER freq, start, end;
    QueryPerformanceFrequency(&freq);

    double flat_total_time = 0.0, nested_total_time = 0.0;
    
    int i;

    for (i = 0; i < ITERATIONS; i++) {
        QueryPerformanceCounter(&start);
        volatile unsigned long long flat_sum = test_flat(flat_data, width, height);
        QueryPerformanceCounter(&end);
        flat_total_time += get_time_diff(start, end, freq);
    }

    for (i = 0; i < ITERATIONS; i++) {
        QueryPerformanceCounter(&start);
        volatile unsigned long long nested_sum = test_nested(nested_data, width, height);
        QueryPerformanceCounter(&end);
        nested_total_time += get_time_diff(start, end, freq);
    }

    printf("Flat eriþim ortalama süresi:   %f saniye\n", flat_total_time / ITERATIONS);
    printf("Nested eriþim ortalama süresi: %f saniye\n", nested_total_time / ITERATIONS);

    free(flat_data);
    free(nested_data);

    return 0;
}

