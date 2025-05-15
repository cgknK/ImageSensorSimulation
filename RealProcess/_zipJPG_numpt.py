import math
import numpy as np

# 1. RGB'den YCbCr Renk Uzayına Dönüşüm
def rgb_to_ycbcr(rgb_image):
    # R, G, B bileşenlerini ayırma
    R = rgb_image[:, :, 0]
    G = rgb_image[:, :, 1]
    B = rgb_image[:, :, 2]

    # Y, Cb, Cr bileşenlerini hesaplama
    Y  =  0.299 * R + 0.587 * G + 0.114 * B
    Cb = -0.1687 * R - 0.3313 * G + 0.5 * B + 128
    Cr =  0.5 * R - 0.4187 * G - 0.0813 * B + 128

    # YCbCr olarak birleştirme
    ycbcr_image = np.stack((Y, Cb, Cr), axis=-1)
    return ycbcr_image

# 2. Bloklara Bölme
def split_into_blocks(image, block_size=8):
    h, w = image.shape[:2]
    blocks = []
    for i in range(0, h, block_size):
        for j in range(0, w, block_size):
            block = image[i:i+block_size, j:j+block_size]
            blocks.append(block)
    return blocks

# 3. Discrete Cosine Transform (DCT) - Basit bir 2D DCT
def dct_2d(block):
    return np.round(np.fft.dct(np.fft.dct(block.T, norm='ortho').T, norm='ortho'))

# 4. Kuantizasyon (Basit bir kuantizasyon matrisi ile)
def quantize(block, q_matrix):
    return np.round(block / q_matrix)

# 5. Huffman Kodlama (Örnek olarak basit bir Run-Length Encoding)
def rle_encoding(block):
    flat_block = block.flatten()
    encoded = []
    prev = flat_block[0]
    count = 1
    for value in flat_block[1:]:
        if value == prev:
            count += 1
        else:
            encoded.append((prev, count))
            prev = value
            count = 1
    encoded.append((prev, count))
    return encoded

# Örnek RGB görüntü (rastgele oluşturulmuş)
rgb_image = np.random.randint(0, 256, (16, 16, 3))

# Adım 1: RGB -> YCbCr dönüşümü
ycbcr_image = rgb_to_ycbcr(rgb_image)

# Adım 2: 8x8 bloklara bölme
blocks = split_into_blocks(ycbcr_image[:, :, 0])  # Sadece Y bileşeniyle devam ediyoruz

# Adım 3: Her blok için DCT uygulama
dct_blocks = [dct_2d(block) for block in blocks]

# Adım 4: Kuantizasyon matrisi
q_matrix = np.array([
    [16, 11, 10, 16, 24, 40, 51, 61],
    [12, 12, 14, 19, 26, 58, 60, 55],
    [14, 13, 16, 24, 40, 57, 69, 56],
    [14, 17, 22, 29, 51, 87, 80, 62],
    [18, 22, 37, 56, 68, 109, 103, 77],
    [24, 35, 55, 64, 81, 104, 113, 92],
    [49, 64, 78, 87, 103, 121, 120, 101],
    [72, 92, 95, 98, 112, 100, 103, 99]
])

# Kuantizasyon işlemi
quantized_blocks = [quantize(block, q_matrix) for block in dct_blocks]

# Adım 5: Huffman kodlama yerine basit RLE kullanıyoruz
encoded_blocks = [rle_encoding(block) for block in quantized_blocks]

# Sonuç
for i, encoded in enumerate(encoded_blocks):
    print(f"Block {i+1} Encoded Data: {encoded}")
