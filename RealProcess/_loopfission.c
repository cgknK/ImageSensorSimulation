#include <stdio.h>

#define SIZE 1000

void original_loop(int *a, int *b, int *c) {
	int i;
    for (i = 0; i < SIZE; i++) {
        a[i] = b[i] + 1;
        c[i] = b[i] * 2;
    }
}

void fission_loop(int *a, int *b, int *c) {
	int i;
    for (i = 0; i < SIZE; i++) {
        a[i] = b[i] + 1;
    }

    for (i = 0; i < SIZE; i++) {
        c[i] = b[i] * 2;
    }
}

int main() {
    int a[SIZE], b[SIZE], c[SIZE];

    // Rastgele deðerlerle doldurma
    int i;
    for (i = 0; i < SIZE; i++) {
        b[i] = i;
    }

    original_loop(a, b, c);
    fission_loop(a, b, c);

    return 0;
}

