from PIL import Image

def bilinear_interpolation(image, new_width, new_height):
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
            
            # Komşu piksel koordinatlarını hesapla
            x1 = int(x)
            y1 = int(y)
            x2 = min(x1 + 1, original_width - 1)
            y2 = min(y1 + 1, original_height - 1)
            
            # Piksel değerlerini al
            Q11 = image[y1][x1]
            Q21 = image[y1][x2]
            Q12 = image[y2][x1]
            Q22 = image[y2][x2]
            
            # Ağırlıkları hesapla
            fxy1 = ((x2 - x) * Q11) + ((x - x1) * Q21)
            fxy2 = ((x2 - x) * Q12) + ((x - x1) * Q22)
            fxy = ((y2 - y) * fxy1) + ((y - y1) * fxy2)
            
            # Yeni piksel değerini ekle
            row.append(tuple(map(int, fxy)))
        resized_image.append(row)
    
    return resized_image

# Örnek kullanım
# Orijinal görüntüyü yüklüyoruz
original_image = Image.open("example.jpg")
original_image = list(original_image.getdata())
original_image = [original_image[i:i+original_image.width] for i in range(0, len(original_image), original_image.width)]

# Bilinear interpolasyon yöntemiyle yeniden boyutlandır
new_width, new_height = 75, 75
resized_image = bilinear_interpolation(original_image, new_width, new_height)

# Yeniden boyutlandırılmış görüntüyü kaydetme
resized_pillow_image = Image.new("RGB", (new_width, new_height))
for i in range(new_height):
    for j in range(new_width):
        resized_pillow_image.putpixel((j, i), tuple(resized_image[i][j]))
resized_pillow_image.save("resized_bilinear.jpg")
