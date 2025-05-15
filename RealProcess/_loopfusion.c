#include <stdio.h>

#define SIZE 1000

void separate_loops(int *a, int *b, int *c) {
    for (int i = 0; i < SIZE; i++) {
        a[i] = b[i] + 1;
    }

    for (int i = 0; i < SIZE; i++) {
        c[i] = b[i] * 2;
    }
}

void fused_loop(int *a, int *b, int *c) {
    for (int i = 0; i < SIZE; i++) {
        a[i] = b[i] + 1;
        c[i] = b[i] * 2;
    }
}

int main() {
    int a[SIZE], b[SIZE], c[SIZE];

    // Rastgele deðerlerle doldurma
    for (int i = 0; i < SIZE; i++) {
        b[i] = i;
    }

    separate_loops(a, b, c);
    fused_loop(a, b, c);

    return 0;
}

