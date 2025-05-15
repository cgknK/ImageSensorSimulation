#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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
	//printf("malloc baþarýlý: %zu byte (%f MB)\n", bytes, bytes / (1024.0 * 1024.0));
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

double get_time_diff(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
}

int main() {
    srand(time(NULL));

    int width = WIDTH;
    int height = HEIGHT;

    Pixel *flat_data = create_flat_data(width, height);
    if (flat_data == NULL) {
	    fprintf(stderr, "flat_data malloc baþarýsýz!\n");
	    exit(1);
	}
    Pixel **nested_data = create_nested_data(flat_data, width, height);
	if (!nested_data) {
	    fprintf(stderr, "nested_data malloc baþarýsýz!\n");
	    free(flat_data);
	    exit(EXIT_FAILURE);
	}
	
    clock_t start, end;
    double cpu_time_used;
    
    struct timespec start, end;
    double flat_total_time = 0.0, nested_total_time = 0.0;
    
    for (int i = 0; i < ITERATIONS; i++) {
        clock_gettime(CLOCK_MONOTONIC, &start);
        volatile unsigned long long flat_sum = test_flat(flat_data, width, height);
        clock_gettime(CLOCK_MONOTONIC, &end);
        flat_total_time += get_time_diff(start, end);
    }

    for (int i = 0; i < ITERATIONS; i++) {
        clock_gettime(CLOCK_MONOTONIC, &start);
        volatile unsigned long long nested_sum = test_nested(nested_data, width, height);
        clock_gettime(CLOCK_MONOTONIC, &end);
        nested_total_time += get_time_diff(start, end);
    }

    printf("Flat eriþim ortalama süresi:   %f saniye\n", flat_total_time / ITERATIONS);
    printf("Nested eriþim ortalama süresi: %f saniye\n", nested_total_time / ITERATIONS);

    free(flat_data);
    free(nested_data);

    return 0;
}

