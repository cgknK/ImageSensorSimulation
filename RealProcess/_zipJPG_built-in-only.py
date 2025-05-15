import math
import itertools

# 1. RGB'den YCbCr Renk Uzayına Dönüşüm
def rgb_to_ycbcr(rgb_image):
    ycbcr_image = []
    for row in rgb_image:
        ycbcr_row = []
        for pixel in row:
            R, G, B = pixel
            Y  =  0.299 * R + 0.587 * G + 0.114 * B
            Cb = -0.1687 * R - 0.3313 * G + 0.5 * B + 128
            Cr =  0.5 * R - 0.4187 * G - 0.0813 * B + 128
            ycbcr_row.append([Y, Cb, Cr])
        ycbcr_image.append(ycbcr_row)
    return ycbcr_image

# 2. Bloklara Bölme
def split_into_blocks(image, block_size=8):
    h, w = len(image), len(image[0])
    blocks = []
    for i in range(0, h, block_size):
        for j in range(0, w, block_size):
            block = [row[j:j+block_size] for row in image[i:i+block_size]]
            blocks.append(block)
    return blocks

# 3. Discrete Cosine Transform (DCT) - 2D DCT (Basit)
def dct_2d(block):
    n = len(block)
    m = len(block[0])
    dct_block = [[0] * m for _ in range(n)]
    for u in range(n):
        for v in range(m):
            sum_val = 0
            for x in range(n):
                for y in range(m):
                    sum_val += block[x][y] * math.cos((2 * x + 1) * u * math.pi / (2 * n)) * math.cos((2 * y + 1) * v * math.pi / (2 * m))
            sum_val *= (1 / math.sqrt(2 * n)) * (1 / math.sqrt(2 * m))
            if u == 0:
                sum_val *= 1 / math.sqrt(2)
            if v == 0:
                sum_val *= 1 / math.sqrt(2)
            dct_block[u][v] = round(sum_val)
    return dct_block

# 4. Kuantizasyon
def quantize(block, q_matrix):
    quantized_block = []
    for i in range(len(block)):
        quantized_row = []
        for j in range(len(block[i])):
            quantized_row.append(round(block[i][j] / q_matrix[i][j]))
        quantized_block.append(quantized_row)
    return quantized_block

# 5. Huffman Kodlama yerine Basit RLE
def rle_encoding(block):
    flat_block = list(itertools.chain.from_iterable(block))
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
rgb_image = [[[int(x) for x in list(f"{row*16 + col:03}")] for col in range(16)] for row in range(16)]

# Adım 1: RGB -> YCbCr dönüşümü
ycbcr_image = rgb_to_ycbcr(rgb_image)

# Adım 2: 8x8 bloklara bölme
blocks = split_into_blocks([row[0] for row in ycbcr_image])  # Sadece Y bileşeniyle devam ediyoruz

# Adım 3: Her blok için DCT uygulama
dct_blocks = [dct_2d(block) for block in blocks]

# Adım 4: Kuantizasyon matrisi
q_matrix = [
    [16, 11, 10, 16, 24, 40, 51, 61],
    [12, 12, 14, 19, 26, 58, 60, 55],
    [14, 13, 16, 24, 40, 57, 69, 56],
    [14, 17, 22, 29, 51, 87, 80, 62],
    [18, 22, 37, 56, 68, 109, 103, 77],
    [24, 35, 55, 64, 81, 104, 113, 92],
    [49, 64, 78, 87, 103, 121, 120, 101],
    [72, 92, 95, 98, 112, 100, 103, 99]
]

# Kuantizasyon işlemi
quantized_blocks = [quantize(block, q_matrix) for block in dct_blocks]

# Adım 5: Huffman kodlama yerine basit RLE kullanıyoruz
encoded_blocks = [rle_encoding(block) for block in quantized_blocks]

# Sonuç
for i, encoded in enumerate(encoded_blocks):
    print(f"Block {i+1} Encoded Data: {encoded}")
