#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE 1000000000

// Normal döngü ile dizi elemanlarýný toplama
void sum_array_normal(const int *array, int *result, size_t length) {
    *result = 0;
    size_t i;
    for (i = 0; i < length; i++) {
        *result += array[i];
    }
}

// Döngü unrolling ile dizi elemanlarýný toplama
void sum_array_unrolled(const int *array, int *result, size_t length) {
    *result = 0;
    size_t i;
    for (i = 0; i <= length - 4; i += 4) {
        *result += array[i] + array[i + 1] + array[i + 2] + array[i + 3];
    }
    for (; i < length; i++) {
        *result += array[i];
    }
}

// Döngü unrolling ile 8'er 8'er dizi elemanlarýný toplama
void sum_array_unrolled_8(const int *array, int *result, size_t length) {
    *result = 0;
    size_t i;
    for (i = 0; i <= length - 8; i += 8) {
        *result += array[i] + array[i + 1] + array[i + 2] + array[i + 3] +
                   array[i + 4] + array[i + 5] + array[i + 6] + array[i + 7];
    }
    for (; i < length; i++) {
        *result += array[i];
    }
}

int main() {
    int *array = (int*)malloc(ARRAY_SIZE * sizeof(int));
    int result;

    // Rastgele verilerle diziyi doldur
    srand(time(NULL));
    size_t i;
    for (i = 0; i < ARRAY_SIZE; i++) {
        array[i] = rand() % 100;
    }

    // Normal döngü ile toplama ve zamaný ölçme
    double start_time = clock();
    sum_array_normal(array, &result, ARRAY_SIZE);
    double end_time = clock();
    printf("Normal: %f seconds, Result: %d\n", (end_time - start_time) / CLOCKS_PER_SEC, result);

    // Döngü unrolling ile toplama ve zamaný ölçme
    start_time = clock();
    sum_array_unrolled(array, &result, ARRAY_SIZE);
    end_time = clock();
    printf("Unrolled: %f seconds, Result: %d\n", (end_time - start_time) / CLOCKS_PER_SEC, result);
	
	start_time = clock();
	sum_array_unrolled_8(array, &result, ARRAY_SIZE);
	end_time = clock();
	printf("Unrolled8: %f seconds, Result: %d\n", (end_time - start_time) / CLOCKS_PER_SEC, result);
	
    // Hafýzayý temizle
    free(array);

    return 0;
}

