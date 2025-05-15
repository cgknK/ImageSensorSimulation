from PIL import Image
import math

def sinc(x):
    if x == 0:
        return 1
    return math.sin(math.pi * x) / (math.pi * x)

def lanczos_kernel(x, a):
    if -a < x < a:
        return sinc(x) * sinc(x / a)
    return 0

def lanczos_interpolation(image, new_width, new_height, a=3):
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
            
            # Lanczos çekirdeği ile çevresel pikselleri ağırlıklandır
            pixel_value = [0, 0, 0]  # R, G, B kanalları
            total_weight = 0
            
            for m in range(-a+1, a):
                for n in range(-a+1, a):
                    x_neigh = min(max(int(x) + m, 0), original_width - 1)
                    y_neigh = min(max(int(y) + n, 0), original_height - 1)
                    
                    weight = lanczos_kernel(x - x_neigh, a) * lanczos_kernel(y - y_neigh, a)
                    
                    for channel in range(3):
                        pixel_value[channel] += image[y_neigh][x_neigh][channel] * weight
                    
                    total_weight += weight
            
            # Ağırlıkların toplamına bölerek normalizasyon
            pixel_value = [min(max(int(pv / total_weight), 0), 255) for pv in pixel_value]
            row.append(tuple(pixel_value))
        resized_image.append(row)
    
    return resized_image

# Örnek kullanım
# Orijinal görüntüyü yüklüyoruz
original_image = Image.open("example.jpg")
original_image = list(original_image.getdata())
original_image = [original_image[i:i+original_image.width] for i in range(0, len(original_image), original_image.width)]

# Lanczos interpolasyon yöntemiyle yeniden boyutlandır
new_width, new_height = 75, 75
resized_image = lanczos_interpolation(original_image, new_width, new_height)

# Yeniden boyutlandırılmış görüntüyü kaydetme
resized_pillow_image = Image.new("RGB", (new_width, new_height))
for i in range(new_height):
    for j in range(new_width):
        resized_pillow_image.putpixel((j, i), tuple(resized_image[i][j]))
resized_pillow_image.save("resized_lanczos.jpg")
