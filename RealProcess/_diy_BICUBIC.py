from PIL import Image

def cubic_interpolate(p0, p1, p2, p3, t):
    """
    Cubic interpolation for a single dimension.
    """
    return (
        p1
        + 0.5 * t * (p2 - p0)
        + 0.5 * t**2 * (2 * p0 - 5 * p1 + 4 * p2 - p3)
        + 0.5 * t**3 * (3 * (p1 - p2) + p3 - p0)
    )

def bicubic_interpolation(image, new_width, new_height):
    # Orijinal görüntü boyutları
    original_width, original_height = len(image[0]), len(image)
    
    # Ölçek oranlarını hesapla
    x_ratio = original_width / new_width
    y_ratio = original_height / new_height
    
    # Yeni görüntü matrisini oluştur
    resized_image = []
    
    for i in range(new_height):
        row = []
        for j in range(new_width):
            # Yeni pikselin orijinal görüntüdeki pozisyonunu hesapla
            x = j * x_ratio
            y = i * y_ratio
            
            # Piksel etrafındaki 16 komşuyu bul
            x1 = int(x) - 1
            y1 = int(y) - 1
            x2 = x1 + 1
            y2 = y1 + 1
            x3 = x2 + 1
            y3 = y2 + 1
            x4 = x3 + 1
            y4 = y3 + 1
            
            # Piksellerin sınırları kontrol edilir
            x1 = max(0, min(x1, original_width - 1))
            x2 = max(0, min(x2, original_width - 1))
            x3 = max(0, min(x3, original_width - 1))
            x4 = max(0, min(x4, original_width - 1))
            y1 = max(0, min(y1, original_height - 1))
            y2 = max(0, min(y2, original_height - 1))
            y3 = max(0, min(y3, original_height - 1))
            y4 = max(0, min(y4, original_height - 1))
            
            # 4x4 piksel matrisini al
            px = [image[y][x1:x4+1] for y in (y1, y2, y3, y4)]
            
            # Her kanal için cubic interpolation
            interpolated_value = []
            for channel in range(3):
                col0 = cubic_interpolate(px[0][0][channel], px[1][0][channel], px[2][0][channel], px[3][0][channel], y - int(y))
                col1 = cubic_interpolate(px[0][1][channel], px[1][1][channel], px[2][1][channel], px[3][1][channel], y - int(y))
                col2 = cubic_interpolate(px[0][2][channel], px[1][2][channel], px[2][2][channel], px[3][2][channel], y - int(y))
                col3 = cubic_interpolate(px[0][3][channel], px[1][3][channel], px[2][3][channel], px[3][3][channel], y - int(y))
                
                value = cubic_interpolate(col0, col1, col2, col3, x - int(x))
                interpolated_value.append(int(value))
            
            row.append(tuple(interpolated_value))
        resized_image.append(row)
    
    return resized_image

# Örnek kullanım
# Orijinal görüntüyü yüklüyoruz
original_image = Image.open("example.jpg")
original_image = list(original_image.getdata())
original_image = [original_image[i:i+original_image.width] for i in range(0, len(original_image), original_image.width)]

# Bicubic interpolasyon yöntemiyle yeniden boyutlandır
new_width, new_height = 75, 75
resized_image = bicubic_interpolation(original_image, new_width, new_height)

# Yeniden boyutlandırılmış görüntüyü kaydetme
resized_pillow_image = Image.new("RGB", (new_width, new_height))
for i in range(new_height):
    for j in range(new_width):
        resized_pillow_image.putpixel((j, i), tuple(resized_image[i][j]))
resized_pillow_image.save("resized_bicubic.jpg")
