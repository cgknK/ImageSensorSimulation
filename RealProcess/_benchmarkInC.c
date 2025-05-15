/*
Belleði sýfýrlamak için bir döngü kullanmak 
(örneðin, memset(a, 0, length * sizeof(int)); gibi) yalnýzca güvenlik veya 
veri gizliliði gibi özel nedenlerle gerekli olabilir.

gcc -std=c11 -O3 -mavx2 -fopenmp -o _benchmark _benchmarkInC.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <omp.h>
#include <time.h>

#define ARRAY_SIZE 10321321

// Zaman ölçüm fonksiyonu
double get_time_in_seconds() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

// Bellek ayýrma ve temizleme fonksiyonu
void allocate_and_initialize(int **a, int **b, int **result, size_t length, int alignment) {
    if (alignment == 0) {
        *a = (int*)malloc(length * sizeof(int));
        *b = (int*)malloc(length * sizeof(int));
        *result = (int*)malloc(length * sizeof(int));
    } else {
        *a = (int*)_aligned_malloc(length * sizeof(int), alignment);
        *b = (int*)_aligned_malloc(length * sizeof(int), alignment);
        *result = (int*)_aligned_malloc(length * sizeof(int), alignment);
    }

    for (size_t i = 0; i < length; i++) {
        (*a)[i] = rand() % 100;
        (*b)[i] = rand() % 100;
    }
}

// Bellek temizleme fonksiyonu
void cleanup(int *a, int *b, int *result, int alignment) {
    if (alignment == 0) {
        free(a);
        free(b);
        free(result);
    } else {
        _aligned_free(a);
        _aligned_free(b);
        _aligned_free(result);
    }
}

// Normal dizi iþlemi
void add_arrays_normal(size_t length) {
    int *a, *b, *result;
    double total_start_time = get_time_in_seconds();

    allocate_and_initialize(&a, &b, &result, length, 0);

    double start_time = get_time_in_seconds();
    for (size_t i = 0; i < length; i++) {
        result[i] = a[i] + b[i];
    }
    double end_time = get_time_in_seconds();
    printf("Normal: %f seconds\n", end_time - start_time);

    cleanup(a, b, result, 0);

    double total_end_time = get_time_in_seconds();
    printf("Normal Total Time (Including Memory Operations): %f seconds\n", total_end_time - total_start_time);
}

// AVX ile vektörleþtirilmiþ dizi iþlemi
void add_arrays_avx(size_t length) {
    int *a, *b, *result;
    double total_start_time = get_time_in_seconds();

    allocate_and_initialize(&a, &b, &result, length, 32);

    double start_time = get_time_in_seconds();
    size_t i;
    for (i = 0; i <= length - 8; i += 8) {
        __m256i vec_a = _mm256_loadu_si256((__m256i*)(a + i));
        __m256i vec_b = _mm256_loadu_si256((__m256i*)(b + i));
        __m256i vec_result = _mm256_add_epi32(vec_a, vec_b);
        _mm256_storeu_si256((__m256i*)(result + i), vec_result);
    }
    for (; i < length; i++) {
        result[i] = a[i] + b[i];
    }
    double end_time = get_time_in_seconds();
    printf("AVX: %f seconds\n", end_time - start_time);

    cleanup(a, b, result, 32);

    double total_end_time = get_time_in_seconds();
    printf("AVX Total Time (Including Memory Operations): %f seconds\n", total_end_time - total_start_time);
}

// OpenMP kullanarak normal dizi iþlemi (çok çekirdekli)
void add_arrays_parallel(size_t length) {
    int *a, *b, *result;
    double total_start_time = get_time_in_seconds();

    allocate_and_initialize(&a, &b, &result, length, 0);

    double start_time = get_time_in_seconds();
    #pragma omp parallel for
    for (size_t i = 0; i < length; i++) {
        result[i] = a[i] + b[i];
    }
    double end_time = get_time_in_seconds();
    printf("Parallel Normal: %f seconds\n", end_time - start_time);

    cleanup(a, b, result, 0);

    double total_end_time = get_time_in_seconds();
    printf("Parallel Normal Total Time (Including Memory Operations): %f seconds\n", total_end_time - total_start_time);
}

// AVX ile vektörleþtirilmiþ dizi iþlemi (çok çekirdekli)
void add_arrays_avx_parallel(size_t length) {
    int *a, *b, *result;
    double total_start_time = get_time_in_seconds();

    allocate_and_initialize(&a, &b, &result, length, 32);

    double start_time = get_time_in_seconds();
    size_t i;
    #pragma omp parallel for
    for (i = 0; i <= length - 8; i += 8) {
        __m256i vec_a = _mm256_loadu_si256((__m256i*)(a + i));
        __m256i vec_b = _mm256_loadu_si256((__m256i*)(b + i));
        __m256i vec_result = _mm256_add_epi32(vec_a, vec_b);
        _mm256_storeu_si256((__m256i*)(result + i), vec_result);
    }
    #pragma omp parallel for
    for (i = length - (length % 8); i < length; i++) {
        result[i] = a[i] + b[i];
    }
    double end_time = get_time_in_seconds();
    printf("Parallel AVX: %f seconds\n", end_time - start_time);

    cleanup(a, b, result, 32);

    double total_end_time = get_time_in_seconds();
    printf("Parallel AVX Total Time (Including Memory Operations): %f seconds\n", total_end_time - total_start_time);
}

int main() {
    // Normal dizi iþlemi
    add_arrays_normal(ARRAY_SIZE);

    // AVX ile vektörleþtirilmiþ dizi iþlemi
    add_arrays_avx(ARRAY_SIZE);

    // OpenMP ile çok çekirdekli normal dizi iþlemi
    add_arrays_parallel(ARRAY_SIZE);

    // OpenMP ile çok çekirdekli AVX dizi iþlemi
    add_arrays_avx_parallel(ARRAY_SIZE);

    return 0;
}

