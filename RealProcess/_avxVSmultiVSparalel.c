/*
gcc -std=c99 -mavx2 -fopenmp -o _avxVS_parallel_benchmark _avxVSmultiVSparalel.c
gcc -std=c11 -mavx2 -fopenmp -o _avxVS_parallel_benchmark _avxVSmultiVSparalel.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <omp.h>
#include <time.h>

#define ARRAY_SIZE 10000000

// Zaman ölçüm fonksiyonu
double get_time_in_seconds() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

// Normal dizi iþlemi
void add_arrays_normal(const int *a, const int *b, int *result, size_t length) {
	size_t i;
    for (i = 0; i < length; i++) {
        result[i] = a[i] + b[i];
    }
}

// AVX ile vektörleþtirilmiþ dizi iþlemi
void add_arrays_avx(const int *a, const int *b, int *result, size_t length) {
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
}

// OpenMP kullanarak normal dizi iþlemi (çok çekirdekli)
void add_arrays_parallel(const int *a, const int *b, int *result, size_t length) {
    size_t i;
	#pragma omp parallel for
    for (i = 0; i < length; i++) {
        result[i] = a[i] + b[i];
    }
}

// AVX ile vektörleþtirilmiþ dizi iþlemi (çok çekirdekli)
void add_arrays_avx_parallel(const int *a, const int *b, int *result, size_t length) {
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
}

int main() {
    int *a = (int*)aligned_alloc(32, ARRAY_SIZE * sizeof(int));
    int *b = (int*)aligned_alloc(32, ARRAY_SIZE * sizeof(int));
    int *result = (int*)aligned_alloc(32, ARRAY_SIZE * sizeof(int));

    // Rastgele verilerle dizileri doldur
    size_t i;
    for (i = 0; i < ARRAY_SIZE; i++) {
        a[i] = rand() % 100;
        b[i] = rand() % 100;
    }

    // Normal dizi iþlemi
    double start_time = get_time_in_seconds();
    add_arrays_normal(a, b, result, ARRAY_SIZE);
    double end_time = get_time_in_seconds();
    printf("Normal: %f seconds\n", end_time - start_time);

    // AVX ile vektörleþtirilmiþ dizi iþlemi
    start_time = get_time_in_seconds();
    add_arrays_avx(a, b, result, ARRAY_SIZE);
    end_time = get_time_in_seconds();
    printf("AVX: %f seconds\n", end_time - start_time);

    // OpenMP ile çok çekirdekli normal dizi iþlemi
    start_time = get_time_in_seconds();
    add_arrays_parallel(a, b, result, ARRAY_SIZE);
    end_time = get_time_in_seconds();
    printf("Parallel Normal: %f seconds\n", end_time - start_time);

    // OpenMP ile çok çekirdekli AVX dizi iþlemi
    start_time = get_time_in_seconds();
    add_arrays_avx_parallel(a, b, result, ARRAY_SIZE);
    end_time = get_time_in_seconds();
    printf("Parallel AVX: %f seconds\n", end_time - start_time);

    // Hafýzayý temizle
    free(a);
    free(b);
    free(result);

    return 0;
}

