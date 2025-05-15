#!/bin/bash

rm -f results.csv

echo "Compiling with -O0..."
gcc -O0 -mavx2 benchmark_simd.c -o bench_O0
echo "Running -O0..."
./bench_O0

echo "Compiling with -O3..."
gcc -O3 -mavx2 benchmark_simd.c -o bench_O3
echo "Running -O3..."
./bench_O3

echo "Done. Results in results.csv"
