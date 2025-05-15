#include <stdio.h>

#define N 3

int main() {
    int A[N][N]; // NxN matris tanýmlamasý
    int i, j, k;

    // Matrisin baþlatýlmasý
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = i * N + j; // Örnek deðer atama
        }
    }

    // Tek bir döngü kullanarak matris elemanlarýna eriþim
    for (k = 0; k < N * N; k++) {
        i = k / N; // Satýr indeksi
        j = k % N; // Sütun indeksi

        // Matris elemanýný yazdýrma
        printf("A[%d][%d] = %d\n", i, j, A[i][j]);
    }

    return 0;
}

