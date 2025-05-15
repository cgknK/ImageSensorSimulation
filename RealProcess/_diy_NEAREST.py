from PIL import Image

def nearest_neighbor_resize(image, new_width, new_height):
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
            # En yakın pikselin koordinatlarını hesapla
            nearest_x = int(j * x_ratio)
            nearest_y = int(i * y_ratio)
            
            # En yakın pikseli yeni görüntüye ekle
            row.append(image[nearest_y][nearest_x])
        resized_image.append(row)
    
    return resized_image

# Örnek kullanım
# Orijinal görüntüyü yüklüyoruz
original_image = Image.open("example.jpg")
original_image = list(original_image.getdata())
original_image = [original_image[i:i+original_image.width] for i in range(0, len(original_image), original_image.width)]

# En Yakın Komşu yöntemiyle yeniden boyutlandır
new_width, new_height = 75, 75
resized_image = nearest_neighbor_resize(original_image, new_width, new_height)

# Yeniden boyutlandırılmış görüntüyü kaydetme
resized_pillow_image = Image.new("RGB", (new_width, new_height))
for i in range(new_height):
    for j in range(new_width):
        resized_pillow_image.putpixel((j, i), tuple(resized_image[i][j]))
resized_pillow_image.save("resized_nearest.jpg")
