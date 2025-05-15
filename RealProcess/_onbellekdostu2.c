#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <immintrin.h> // AVX i�in

#define N 1024       // Matris boyutu
#define BLOCK_SIZE 32 // Blo�un boyutu

// Zaman �l��m fonksiyonu
double get_time_in_seconds() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

// Matris �arp�m� (�nbellek dostu, bloklama ile)
void matrix_multiply_cache_friendly(double **A, double **B, double **C, int n) {
    int i0, j0, k0, i, j, k;

    // A ve B matrislerinin �arp�m� sonucu C matrisini olu�turur
    for (i0 = 0; i0 < n; i0 += BLOCK_SIZE) {
        for (j0 = 0; j0 < n; j0 += BLOCK_SIZE) {
            for (k0 = 0; k0 < n; k0 += BLOCK_SIZE) {
                for (i = i0; i < i0 + BLOCK_SIZE && i < n; i++) {
                    for (j = j0; j < j0 + BLOCK_SIZE && j < n; j++) {
                        double sum = 0.0;
                        for (k = k0; k < k0 + BLOCK_SIZE && k < n; k++) {
                            sum += A[i][k] * B[k][j];
                        }
                        C[i][j] += sum;
                    }
                }
            }
        }
    }
}

// Matris �arp�m� (�nbellek dostu olmayan, referans kod)
void matrix_multiply_non_cache_friendly(double **A, double **B, double **C, int n) {
    int i, j, k;

    // A ve B matrislerinin �arp�m� sonucu C matrisini olu�turur
    for (i = 0; i < n; i++) {
        for (k = 0; k < n; k++) {
            for (j = 0; j < n; j++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int main() {
    // Matrisler i�in bellek ay�rma ve hizalama
    double **A = (double **)_mm_malloc(N * sizeof(double *), 32);
    double **B = (double **)_mm_malloc(N * sizeof(double *), 32);
    double **C = (double **)_mm_malloc(N * sizeof(double *), 32);
    double **D = (double **)_mm_malloc(N * sizeof(double *), 32);
    int i, j;

    for (i = 0; i < N; i++) {
        A[i] = (double *)_mm_malloc(N * sizeof(double), 32);
        B[i] = (double *)_mm_malloc(N * sizeof(double), 32);
        C[i] = (double *)_mm_malloc(N * sizeof(double), 32);
        D[i] = (double *)_mm_malloc(N * sizeof(double), 32);
    }

    // Matrisleri rastgele verilerle doldurma
    srand(time(NULL));
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = rand() % 100; // A matrisine rastgele de�erler ata
            B[i][j] = rand() % 100; // B matrisine rastgele de�erler ata
            C[i][j] = 0.0;          // C ve D matrislerini s�f�rla
            D[i][j] = 0.0;
        }
    }

    // �nbellek dostu matris �arp�m�n� ger�ekle�tir ve zaman� �l�
    double start_time = get_time_in_seconds();
    matrix_multiply_cache_friendly(A, B, C, N);
    double end_time = get_time_in_seconds();
    printf("Cache-friendly matrix multiplication: %f seconds\n", end_time - start_time);

    // �nbellek dostu olmayan matris �arp�m�n� ger�ekle�tir ve zaman� �l�
    start_time = get_time_in_seconds();
    matrix_multiply_non_cache_friendly(A, B, D, N);
    end_time = get_time_in_seconds();
    printf("Non-cache-friendly matrix multiplication: %f seconds\n", end_time - start_time);

    // Haf�zay� temizle
    for (i = 0; i < N; i++) {
        _mm_free(A[i]);
        _mm_free(B[i]);
        _mm_free(C[i]);
        _mm_free(D[i]);
    }
    _mm_free(A);
    _mm_free(B);
    _mm_free(C);
    _mm_free(D);

    return 0;
}

