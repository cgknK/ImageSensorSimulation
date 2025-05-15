#include <stdio.h>

#define N 3

int main() {
    int A[N][N]; // NxN matris tan�mlamas�
    int i, j, k;

    // Matrisin ba�lat�lmas�
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = i * N + j; // �rnek de�er atama
        }
    }

    // Tek bir d�ng� kullanarak matris elemanlar�na eri�im
    for (k = 0; k < N * N; k++) {
        i = k / N; // Sat�r indeksi
        j = k % N; // S�tun indeksi

        // Matris eleman�n� yazd�rma
        printf("A[%d][%d] = %d\n", i, j, A[i][j]);
    }

    return 0;
}

