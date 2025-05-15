/* gcc -O2 portable_benchmark.c -o benchmark.exe */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#ifdef _WIN32
    #include <windows.h>
#else
    #include <sys/time.h>
#endif

#define WIDTH 15000
#define HEIGHT 15000
#define ITERATIONS 5

typedef struct {
    unsigned char r, g, b, alpha;
} __attribute__((aligned(4))) Pixel;

Pixel *create_flat_data(int width, int height) {
    Pixel *data = malloc(sizeof(Pixel) * width * height);
    if (!data) {
        fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * (size_t)width * height);
        exit(EXIT_FAILURE);
    }
    printf("%s", "malloc baþarýlý: ... byte (... MB)\n");
    for (int i = 0; i < width * height; i++) {
        data[i].r = rand() % 256;
        data[i].g = rand() % 256;
        data[i].b = rand() % 256;
    }
    return data;
}

Pixel **create_nested_data(Pixel *flat_data, int width, int height) {
    Pixel **data = malloc(sizeof(Pixel *) * height);
    if (!data) return NULL;
    for (int i = 0; i < height; i++) {
        data[i] = &flat_data[i * width];
    }
    return data;
}

unsigned long long test_flat(Pixel *flat_data, int width, int height) {
    unsigned long long total = 0;
    for (int i = 0; i < height; i++) {
        int row_start = i * width;
        Pixel *row = &flat_data[row_start];
        for (int j = 0; j < width; j++) {
            //total += flat_data[row_start + j].r;
            total += row[j].r;
        }
    }
    return total;
}

unsigned long long test_flat_pt_aritm(Pixel *flat_data, int width, int height) {
    unsigned long long total = 0;
    //#pragma omp simd reduction(+:total)
    #pragma GCC ivdep
    for (int i = 0; i < height; i++) {
        Pixel *row = &flat_data[i * width]; // Satýr baþlangýcý
        Pixel *row_end = row + width;       // Satýr sonu
        for (Pixel *ptr = row; ptr < row_end; ptr++) {
            total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
        }
    }
    return total;
}

unsigned long long test_nested(Pixel **nested_data, int width, int height) {
    unsigned long long total = 0;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            total += nested_data[i][j].r;
        }
    }
    return total;
}

unsigned long long test_nested_ptr(Pixel **nested_data, int width, int height) {
    unsigned long long total = 0;
    //#pragma omp simd reduction(+:total)
    #pragma GCC ivdep
    for (int i = 0; i < height; i++) {
        Pixel *row = nested_data[i];      // Satýr baþlangýcý
        Pixel *row_end = row + width;     // Satýr sonu
        for (Pixel *ptr = row; ptr < row_end; ptr++) {
            total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
        }
    }
    return total;
}

double get_time_seconds() {
#ifdef _WIN32
    static LARGE_INTEGER frequency;
    static int initialized = 0;
    LARGE_INTEGER now;

    if (!initialized) {
        QueryPerformanceFrequency(&frequency);
        initialized = 1;
    }

    QueryPerformanceCounter(&now);
    return (double)now.QuadPart / frequency.QuadPart;

#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + ts.tv_nsec / 1e9;
#endif
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

    double flat_total_time = 0.0, nested_total_time = 0.0;
    double flat_ptr_total_time = 0.0, nested_ptr_total_time = 0.0;
	
	for (int i = 0; i < ITERATIONS; i++) {
        double start = get_time_seconds();
        volatile unsigned long long nested_sum = test_nested(nested_data, width, height);
        double end = get_time_seconds();
        nested_total_time += (end - start);
    }
    
    for (int i = 0; i < ITERATIONS; i++) {
        double start = get_time_seconds();
        volatile unsigned long long flat_sum = test_flat(flat_data, width, height);
        double end = get_time_seconds();
        flat_total_time += (end - start);
    }
    
    for (int i = 0; i < ITERATIONS; i++) {
        double start = get_time_seconds();
        volatile unsigned long long nested_sum = test_nested_ptr(nested_data, width, height);
        double end = get_time_seconds();
        nested_ptr_total_time += (end - start);
    }
    
    for (int i = 0; i < ITERATIONS; i++) {
        double start = get_time_seconds();
        volatile unsigned long long nested_sum = test_flat_pt_aritm(flat_data, width, height);
        double end = get_time_seconds();
        flat_ptr_total_time += (end - start);
    }
    
    printf("Nested eriþim ortalama süresi: %.6f saniye\n", nested_total_time / ITERATIONS);
    printf("Flat eriþim ortalama süresi:   %.6f saniye\n", flat_total_time / ITERATIONS);
    printf("Nested_ptr eriþim ortalama süresi: %.6f saniye\n", nested_ptr_total_time / ITERATIONS);
    printf("Flat_ptr eriþim ortalama süresi:   %.6f saniye\n", flat_ptr_total_time / ITERATIONS);
    


    free(flat_data);
    free(nested_data);

    return 0;
}

