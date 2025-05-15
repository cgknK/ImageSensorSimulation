/*
x@DESKTOP-MTSTRTP MINGW64 ~/Desktop/esp32/RealProcess
$ gcc -std=c11 -mavx2 -o _AVXprogram _AVXvektorlestirme.c

x@DESKTOP-MTSTRTP MINGW64 ~/Desktop/esp32/RealProcess
$ ./_AVXprogram.exe
11 22 33 44 55 66 77 88 99 110
*/

#include <stdio.h>
#include <immintrin.h>  // AVX intrinsics i�in

void add_arrays_avx(const int *a, const int *b, int *result, size_t length) {
    size_t i;
    
    // Vekt�rle�tirilmi� i�lem i�in d�ng�
    for (i = 0; i <= length - 8; i += 8) {
        // a ve b dizilerinden 256-bit'lik (8 x 32-bit) veriyi y�kle
        __m256i vec_a = _mm256_loadu_si256((__m256i*)(a + i));
        __m256i vec_b = _mm256_loadu_si256((__m256i*)(b + i));
        
        // �ki vekt�r� topla
        __m256i vec_result = _mm256_add_epi32(vec_a, vec_b);
        
        // Sonu�lar� result dizisine yaz
        _mm256_storeu_si256((__m256i*)(result + i), vec_result);
    }
    
    // Kalan elemanlar� s�radan d�ng� ile i�le
    for (; i < length; i++) {
        result[i] = a[i] + b[i];
    }
}

int main() {
    // �rnek veriler
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int b[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    size_t length = sizeof(a) / sizeof(a[0]);
    int result[length];

    // Toplama i�lemi
    add_arrays_avx(a, b, result, length);

    // Sonu�lar� yazd�r
    size_t i;
    for (i = 0; i < length; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");  // ��kt�: 11 22 33 44 55 66 77 88 99 110

    return 0;
}

