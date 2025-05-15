#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define N 1000 // Matris boyutu
#define NUM_THREADS 4 // Kullanýlacak iþ parçacýðý sayýsý

// Matris tanýmlamalarý global olarak yapýlýr
int **A, **B, **C;

void* matrix_addition(void* thread_id) {
    int tid = (int)(size_t)thread_id; // Ýþ parçacýðý kimliði
    int i, j;

    // Ýþ parçacýðýna atanacak aralýklarý hesapla
    int chunk_size = N / NUM_THREADS;
    int start_row = tid * chunk_size;
    int end_row = (tid == NUM_THREADS - 1) ? N : start_row + chunk_size; // Son iþ parçacýðýna kalan kýsmý ver

    for (i = start_row; i < end_row; i++) {
        for (j = 0; j < N; j++) {
            C[i][j] = A[i][j] + B[i][j];
        }
    }

    pthread_exit(NULL);
}

int main() {
    int i, j;
    pthread_t threads[NUM_THREADS];
    double start_time, end_time;

    // Matrislerin bellekten yer ayrýlmasý
    A = (int**)malloc(N * sizeof(int*));
    B = (int**)malloc(N * sizeof(int*));
    C = (int**)malloc(N * sizeof(int*));

    for (i = 0; i < N; i++) {
        A[i] = (int*)malloc(N * sizeof(int));
        B[i] = (int*)malloc(N * sizeof(int));
        C[i] = (int*)malloc(N * sizeof(int));
    }

    // Matris A ve B'nin baþlatýlmasý
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = i + j;
            B[i][j] = i - j;
        }
    }

    // Zaman ölçüm baþlangýcý
    start_time = omp_get_wtime();

    // Ýþ parçacýklarýnýn oluþturulmasý
    for (i = 0; i < NUM_THREADS; i++) {
        pthread_create(&threads[i], NULL, matrix_addition, (void*)(size_t)i);
    }

    // Tüm iþ parçacýklarýnýn tamamlanmasýný bekle
    for (i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Zaman ölçüm sonu
    end_time = omp_get_wtime();

    // Sonuçlarýn gösterilmesi
    printf("Matris toplama tamamlandý. Süre: %f saniye\n", end_time - start_time);

    // Belleðin serbest býrakýlmasý
    for (i = 0; i < N; i++) {
        free(A[i]);
        free(B[i]);
        free(C[i]);
    }
    free(A);
    free(B);
    free(C);

    return 0;
}

