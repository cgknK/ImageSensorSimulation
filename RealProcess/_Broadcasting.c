#include <stdio.h>

#define ROWS 3
#define COLS 4

int main() {
    // Büyük dizi (matris)
    int matrix[ROWS][COLS] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12}
    };

    // Küçük dizi (vektör)
    int vector[COLS] = {10, 20, 30, 40};

    // Sonuç matrisini oluþtur
    int result[ROWS][COLS];

    // Broadcasting iþlemi: her satýrdaki her elemaný küçük dizinin karþýlýk gelen elemanýyla toplama
    int i;
    int j;
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            result[i][j] = matrix[i][j] + vector[j];
        }
    }

    // Sonuçlarý yazdýr
    printf("Resultant Matrix:\n");
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            printf("%d ", result[i][j]);
        }
        printf("\n");
    }

    return 0;
}

