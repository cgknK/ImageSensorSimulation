#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1024 // Matris boyutu

// Zaman ölçüm fonksiyonu
double get_time_in_seconds() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

// Matris çarpýmý (önbellek dostu)
void matrix_multiply_cache_friendly(double **A, double **B, double **C, int n) {
    int i, j, k;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            double sum = 0.0;
            for (k = 0; k < n; k++) {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }
}

// Matris çarpýmý (önbellek dostu olmayan)
void matrix_multiply_non_cache_friendly(double **A, double **B, double **C, int n) {
    int i, j, k;
    for (i = 0; i < n; i++) {
        for (k = 0; k < n; k++) {
            for (j = 0; j < n; j++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int main() {
    // Matrisleri oluþtur
    double **A = (double **)malloc(N * sizeof(double *));
    double **B = (double **)malloc(N * sizeof(double *));
    double **C = (double **)malloc(N * sizeof(double *));
    double **D = (double **)malloc(N * sizeof(double *));
    int i, j;
    for (i = 0; i < N; i++) {
        A[i] = (double *)malloc(N * sizeof(double));
        B[i] = (double *)malloc(N * sizeof(double));
        C[i] = (double *)malloc(N * sizeof(double));
        D[i] = (double *)malloc(N * sizeof(double));
    }

    // Matrisleri rastgele verilerle doldur
    srand(time(NULL));
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = rand() % 100;
            B[i][j] = rand() % 100;
            C[i][j] = 0.0;
            D[i][j] = 0.0;
        }
    }

    // Önbellek dostu matris çarpýmýný gerçekleþtir ve zamaný ölç
    double start_time = get_time_in_seconds();
    matrix_multiply_cache_friendly(A, B, C, N);
    double end_time = get_time_in_seconds();
    printf("Cache-friendly matrix multiplication: %f seconds\n", end_time - start_time);

    // Önbellek dostu olmayan matris çarpýmýný gerçekleþtir ve zamaný ölç
    start_time = get_time_in_seconds();
    matrix_multiply_non_cache_friendly(A, B, D, N);
    end_time = get_time_in_seconds();
    printf("Non-cache-friendly matrix multiplication: %f seconds\n", end_time - start_time);

    // Hafýzayý temizle
    for (i = 0; i < N; i++) {
        free(A[i]);
        free(B[i]);
        free(C[i]);
        free(D[i]);
    }
    free(A);
    free(B);
    free(C);
    free(D);

    return 0;
}

