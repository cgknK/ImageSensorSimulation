#include <stdio.h>
#include <stdlib.h>
#include <omp.h>  // OpenMP k�t�phanesini kullanarak paralel i�leme

#define ROWS 3
#define COLS 4

int main() {
    // B�y�k dizi (matris)
    int matrix[ROWS][COLS] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12}
    };

    // K���k dizi (vekt�r)
    int vector[COLS] = {10, 20, 30, 40};

    // Sonu� matrisini olu�tur
    int result[ROWS][COLS];

    // Paralel b�lge olu�tur ve OpenMP ile d�ng�leri h�zland�r
    #pragma omp parallel for collapse(2)
    int i, j;
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            result[i][j] = matrix[i][j] + vector[j];
        }
    }

    // Sonu�lar� yazd�r
    printf("Resultant Matrix:\n");
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            printf("%d ", result[i][j]);
        }
        printf("\n");
    }

    return 0;
}

