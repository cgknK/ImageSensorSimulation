#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#pragma comment(linker, "/STACK:134217728")  // 128 MB stack

#define WIDTH 5000
#define HEIGHT 5000

// Stack üzerinde sabit boyutlu dizi
void create_stack_data(int data[HEIGHT][WIDTH]) {
	int i, j;
    for (i = 0; i < HEIGHT; i++) {
        for (j = 0; j < WIDTH; j++) {
            data[i][j] = i * j;
        }
    }
}

// Heap üzerinde dinamik dizi
void create_heap_data(int ***data) {
    *data = (int **)malloc(HEIGHT * sizeof(int *));
    int i, j;
    for (i = 0; i < HEIGHT; i++) {
        (*data)[i] = (int *)malloc(WIDTH * sizeof(int));
    }
    for (i = 0; i < HEIGHT; i++) {
        for (j = 0; j < WIDTH; j++) {
            (*data)[i][j] = i * j;
        }
    }
}

int main() {
    clock_t start, end;

    // Stack kullaným
    int stack_data[HEIGHT][WIDTH];
    start = clock();
    create_stack_data(stack_data);
    end = clock();
    printf("Stack kullanarak süre: %f saniye\n", (double)(end - start) / CLOCKS_PER_SEC);

    // Heap kullaným
    int **heap_data;
    start = clock();
    create_heap_data(&heap_data);
    end = clock();
    printf("Heap kullanarak süre: %f saniye\n", (double)(end - start) / CLOCKS_PER_SEC);

    // Heap belleði serbest býrakma
    int i;
    for (i = 0; i < HEIGHT; i++) {
        free(heap_data[i]);
    }
    free(heap_data);

    return 0;
}

