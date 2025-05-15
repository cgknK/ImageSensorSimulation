/* gcc -O3 -fopenmp benchmark.c -o benchmark_omp */

#include <omp.h> // baþa eklenmeli

unsigned long long test_flat_omp(Pixel *data, int width, int height) {
    unsigned long long total = 0;
    #pragma omp parallel for reduction(+:total)
    for (int i = 0; i < height; i++) {
        int row_start = i * width;
        for (int j = 0; j < width; j++) {
            total += data[row_start + j].r;
        }
    }
    return total;
}

