"""
https://stackoverflow.com/questions/58676546/i-m-confused-with-how-to-convert-rgb-to-ycrcb
"""

# RGB'den YCbCr'ye dönüşüm
def rgb_to_ycbcr(r, g, b):
    # Y, Cb ve Cr değerlerini hesapla
    y = 0.299 * r + 0.587 * g + 0.114 * b
    cb = 128 - 0.168736 * r - 0.331264 * g + 0.5 * b
    cr = 128 + 0.5 * r - 0.418688 * g - 0.081312 * b
    return y, cb, cr

# YCbCr'den RGB'ye dönüşüm
def ycbcr_to_rgb(y, cb, cr):
    # R, G ve B değerlerini hesapla
    r = y + 1.402 * (cr - 128)
    g = y - 0.344136 * (cb - 128) - 0.714136 * (cr - 128)
    b = y + 1.772 * (cb - 128)
    return int(r), int(g), int(b)

# Örnek RGB ve dönüşüm
rgb_color = (255, 0, 0)  # Kırmızı renk
y, cb, cr = rgb_to_ycbcr(*rgb_color)
print(f"YCbCr: Y = {y}, Cb = {cb}, Cr = {cr}")

r, g, b = ycbcr_to_rgb(y, cb, cr)
print(f"RGB: R = {r}, G = {g}, B = {b}")


# RGB'den YCbCr'ye dönüşüm
def rgb_to_ycbcr(r, g, b):
    # Y, Cb ve Cr değerlerini hesapla
    y = 0.299 * r + 0.587 * g + 0.114 * b
    cb = 128 - 0.168736 * r - 0.331264 * g + 0.5 * b
    cr = 128 + 0.5 * r - 0.418688 * g - 0.081312 * b
    
    # Cb ve Cr değerlerini sınırla (clamping)
    cb = max(min(cb, 255), 0)
    cr = max(min(cr, 255), 0)
    
    return y, cb, cr

# YCbCr'den RGB'ye dönüşüm
def ycbcr_to_rgb(y, cb, cr):
    # R, G ve B değerlerini hesapla
    r = y + 1.402 * (cr - 128)
    g = y - 0.344136 * (cb - 128) - 0.714136 * (cr - 128)
    b = y + 1.772 * (cb - 128)
    
    # R, G ve B değerlerini sınırla (clamping)
    r = max(min(r, 255), 0)
    g = max(min(g, 255), 0)
    b = max(min(b, 255), 0)
    
    return r, g, b

# Örnek RGB ve dönüşüm
rgb_color = (255, 0, 0)  # Kırmızı renk
y, cb, cr = rgb_to_ycbcr(*rgb_color)
print(f"YCbCr: Y = {y}, Cb = {cb}, Cr = {cr}")

r, g, b = ycbcr_to_rgb(y, cb, cr)
print(f"RGB: R = {r}, G = {g}, B = {b}")
