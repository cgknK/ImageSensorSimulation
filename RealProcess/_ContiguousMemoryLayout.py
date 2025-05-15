"""
Contiguous Memory Layout, veri bloklarının bellekte kesintisiz bir şekilde 
yerleştirilmesini sağlar, bu da bellek erişimini hızlandırır ve işlemcinin önbellek 
kullanımını optimize eder. NumPy dizileri, bu düzeni varsayılan olarak kullanır ve 
bu nedenle performansı artırır
"""
import numpy as np

# 2x3 boyutlarında bir NumPy dizisi oluşturuyoruz
matrix = np.array([[1, 2, 3], [4, 5, 6]])

# Dizinin sürekli bellek düzeninde olup olmadığını kontrol ediyoruz
print("C_CONTIGUOUS flag:", matrix.flags['C_CONTIGUOUS'])

# Diziyi kesintisiz bellek düzeni ile yeniden şekillendiriyoruz
reshaped_matrix = matrix.reshape((3, 2))
print("Reshaped matrix:")
print(reshaped_matrix)

# Dizinin sürekli bellek düzeninde olup olmadığını tekrar kontrol ediyoruz
print("C_CONTIGUOUS flag after reshape:", reshaped_matrix.flags['C_CONTIGUOUS'])
