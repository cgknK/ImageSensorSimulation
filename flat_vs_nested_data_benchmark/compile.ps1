gcc -O0 .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o0.exe
gcc -O0 -march=native .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o0_marchnative.exe
gcc -O1 .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o1.exe
gcc -O1 -march=native .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o1_marchnative.exe
gcc -O2 .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o2.exe
gcc -O2 -march=native .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o2_marchnative.exe
gcc -O3 .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o3.exe
gcc -O3 -march=native .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o3_marchnative.exe
gcc -O3 -S -fverbose-asm -o flat-data_vs_nested_7.s flat-data_vs_nested_7.c
gcc -O3 -march=native -fopt-info-vec .\flat-data_vs_nested_7.c -o flat-data_vs_nested_7_o3_marchnative_info.exe
