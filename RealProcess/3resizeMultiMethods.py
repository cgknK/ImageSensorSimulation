"""
Bu kodlar, bir görüntüyü 300x300 pikselden 75x75 piksele dört farklı interpolasyon 
    yöntemiyle yeniden boyutlandırır ve sonuçları kaydeder.

Image.NEAREST: En hızlı yöntemdir ancak keskin kenarlarda kalite kaybı olabilir.
Image.BILINEAR: Yumuşak geçişler sağlar, özellikle gradient olan bölgelerde.
Image.BICUBIC: Daha geniş bir alandaki pikselleri dikkate alarak daha kaliteli ve 
    yumuşak sonuçlar üretir.
Image.LANCZOS: En yüksek kalitede sonuçlar sunar, özellikle karmaşık detaylara 
    sahip görsellerde tercih edilir.

Ayrıca:
NEAREST Interpolasyonu (En Yakın Komşu):
Görsel Kalite: Keskin kenarlar sağlar, ancak pikselleşme ve moiré etkisi olabilir.
Dosya Boyutu: Genellikle en büyük boyuta sahip olur çünkü renk ve ton geçişlerinde 
    keskinlik vardır. Bu, daha az sıkıştırılabilir veri anlamına gelir.
BILINEAR Interpolasyonu:
Görsel Kalite: Daha yumuşak geçişler sağlar. Orta kalitededir.
Dosya Boyutu: NEAREST'ten daha küçük olur. Yumuşak geçişler, daha kolay sıkıştırılabilir.
BICUBIC Interpolasyonu:
Görsel Kalite: Daha kaliteli ve yumuşak sonuçlar sunar, 16 çevre pikseli dikkate alır.
Dosya Boyutu: BILINEAR'a kıyasla biraz daha küçük olabilir çünkü daha düzgün geçişler içerir.
LANCZOS Interpolasyonu:
Görsel Kalite: En yüksek kaliteyi sağlar, en geniş alandaki piksellerin ağırlıklı 
    ortalamasını alır.
Dosya Boyutu: En küçük dosya boyutuna sahiptir çünkü bu yöntem, pürüzsüz ve yumuşak 
bir görüntü oluşturur, bu da daha fazla veri sıkıştırması sağlar.
"""

import os
from PIL import Image

# Görüntüyü aç
image = Image.open(f'2.jpg')

# NEAREST Interpolasyonu ile küçültme
nearest_image = image.resize((75, 75), Image.NEAREST)
nearest_image.save(f'{int(os.path.basename(__file__)[0]) + 1}_1NEAREST.jpg')

# BILINEAR Interpolasyonu ile küçültme
bilinear_image = image.resize((75, 75), Image.BILINEAR)
bilinear_image.save(f'{int(os.path.basename(__file__)[0]) + 1}_2BILINEAR.jpg')

# BICUBIC Interpolasyonu ile küçültme
bicubic_image = image.resize((75, 75), Image.BICUBIC)
bicubic_image.save(f'{int(os.path.basename(__file__)[0]) + 1}_3BICUBIC.jpg')

# LANCZOS Interpolasyonu ile küçültme
lanczos_image = image.resize((75, 75), Image.LANCZOS)
lanczos_image.save(f'{int(os.path.basename(__file__)[0]) + 1}_4LANCZOS.jpg')

# Küçültülmüş görüntüleri gösterme (isteğe bağlı)
#nearest_image.show()
#bilinear_image.show()
#bicubic_image.show()
#lanczos_image.show()

def _1div4_noncollision_evenxeven(image, iterations=1):
    """
    Tek Sorumluluk İlkesi ve Modülerlik adına bu fonksiyon, 
    belirli işlemler için alt fonksiyonlar tanımlar.
    """

    # Piksel erişim nesnesini yükle
    #pixels = image.load()
    #print(pixels[x, y])
    #pixels[x, y] = (255 - r, 255 - g, 255 - b)

    def get_image_data(image):
        """Görüntüden piksel verilerini al ve boyutlarını döndür."""
        width, height = image.size
        image_data = list(image.getdata())
        #image_data_matrix = [image_data[i:i + width] for i in range(0, len(image_data), width)]
        return image_data, width, height

    def calculate_average_color(image_data, width, height, block_size=2):
        """2x2 piksel bloğunun RGB değerlerinin ortalamasını hesaplar."""
        Total_Matrix_elements = 4  # Piksel başına renk bileşeni sayısı
        new_data = []
        for i in range(0, height, block_size):
            for j in range(0, width, block_size):
                # Piksel indekslerini hesapla
                top_left = i * width + j
                top_right = top_left + 1
                bottom_left = top_left + width
                bottom_right = bottom_left + 1

                r = (image_data[top_left][0] + image_data[top_right][0] +
                     image_data[bottom_left][0] + image_data[bottom_right][0]) // Total_Matrix_elements
                g = (image_data[top_left][1] + image_data[top_right][1] +
                     image_data[bottom_left][1] + image_data[bottom_right][1]) // Total_Matrix_elements
                b = (image_data[top_left][2] + image_data[top_right][2] +
                     image_data[bottom_left][2] + image_data[bottom_right][2]) // Total_Matrix_elements
                new_data.append((r, g, b))
        return new_data

    def create_new_image(new_data, width, height):
        """Yeni boyutlara sahip yeni bir görüntü oluştur ve verileri yerleştir."""
        new_width = width // 2
        new_height = height // 2
        new_image = Image.new("RGB", (new_width, new_height))
        new_image.putdata(new_data)
        #new_image.putdata([pixel for row in x for pixel in row])
        #new_image = itertools.chain(*x) #low space complexity, high time complexity
        return new_image

    def process_image(image, iterations):
        """Görüntüyü belirtilen sayıda iterasyonla işleyen fonksiyon."""
        current_image = image.copy()

        for _ in range(iterations):
            # Piksel verilerini işlemek için görüntü boyutlarını al
            image_data, width, height = get_image_data(current_image)
            
            if width % 2 != 0 or height % 2 != 0:
                raise ValueError("Görüntü boyutları 2'nin katı olmalıdır.")
            
            block_size = 2 #2x2 matrix
            new_data = calculate_average_color(image_data, width, height, block_size)
            current_image = create_new_image(new_data, width, height)
        
        current_image.save(f'{int(os.path.basename(__file__)[0]) + 1}_5-1div4noncollision.jpg')

    process_image(image, iterations)

_1div4_noncollision_evenxeven(image, 2)


"""
1. Görüntünün Piksel Sayısını Ayarlama
from PIL import Image

# Görüntüyü yükleme
image = Image.open('input_image.png')

# Piksel sayısını ayarlama (örneğin 100x100 piksel)
new_image = image.resize((100, 100))

# Yeni görüntüyü kaydetme ve gösterme
new_image.save('resized_image.png')
new_image.show()
"""
"""
2. Her 2 Pikselden Birini Kullanarak Yeni Bir Görüntü Üretme
from PIL import Image

# Görüntüyü yükleme
image = Image.open('input_image.png')

# Orijinal görüntü boyutları
width, height = image.size

# Yeni görüntü boyutları (yarısı)
new_width = width // 2
new_height = height // 2

# Yeni görüntü oluşturma
new_image = Image.new('RGB', (new_width, new_height))

# Orijinal görüntüdeki her 2 pikselden birini seçme
for y in range(new_height):
    for x in range(new_width):
        pixel = image.getpixel((x * 2, y * 2))
        new_image.putpixel((x, y), pixel)

# Yeni görüntüyü kaydetme ve gösterme
new_image.save('downsampled_image.png')
new_image.show()
"""
