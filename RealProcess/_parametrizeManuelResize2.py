from PIL import Image
import os

def _manual_resize(image, target_width, target_height):
    """
    Görüntüyü hedef boyutlara manuel olarak yeniden boyutlandırma işlemi.
    """

    def get_image_data(image):
        """Görüntüden piksel verilerini al ve boyutlarını döndür."""
        width, height = image.size
        image_data = list(image.getdata())
        return image_data, width, height

    def calculate_average_color(image_data, width, height, block_width, block_height):
        """Blok boyutuna göre piksel renk ortalamasını hesaplar."""
        new_data = []
        for i in range(0, height, block_height):
            for j in range(0, width, block_width):
                r_sum, g_sum, b_sum = 0, 0, 0
                count = 0
                for m in range(block_height):
                    for n in range(block_width):
                        if (i + m) < height and (j + n) < width:
                            idx = (i + m) * width + (j + n)
                            r_sum += image_data[idx][0]
                            g_sum += image_data[idx][1]
                            b_sum += image_data[idx][2]
                            count += 1
                r = r_sum // count
                g = g_sum // count
                b = b_sum // count
                new_data.append((r, g, b))
        return new_data

    def create_new_image(new_data, new_width, new_height):
        """Yeni boyutlara sahip yeni bir görüntü oluştur ve verileri yerleştir."""
        new_image = Image.new("RGB", (new_width, new_height))
        new_image.putdata(new_data)
        return new_image

    def process_image(image, target_width, target_height):
        """Görüntüyü işleyen fonksiyon."""
        image_data, width, height = get_image_data(image)

        # Blok boyutlarını hedef boyutlara göre ayarla
        block_width = width / target_width
        block_height = height / target_height
        
        # Renk ortalamasını hesapla
        new_data = []
        for i in range(target_height):
            for j in range(target_width):
                r_sum, g_sum, b_sum = 0, 0, 0
                count = 0
                for m in range(int(block_height)):
                    for n in range(int(block_width)):
                        y = int(i * block_height + m)
                        x = int(j * block_width + n)
                        if y < height and x < width:
                            idx = y * width + x
                            r_sum += image_data[idx][0]
                            g_sum += image_data[idx][1]
                            b_sum += image_data[idx][2]
                            count += 1
                r = r_sum // count
                g = g_sum // count
                b = b_sum // count
                new_data.append((r, g, b))

        new_image = create_new_image(new_data, target_width, target_height)
        return new_image

    image = image.copy()
    resized_image = process_image(image, target_width, target_height)
    resized_image.save('_parametrize-1div4.jpg')

# Kullanım:
image = Image.open("2.jpg")
_manual_resize(image, 31, 43)


from PIL import ImageChops

def compare_images(image1_path, image2_path):
    """İki görüntünün aynı olup olmadığını kontrol eder."""
    image1 = Image.open(image1_path)
    image2 = Image.open(image2_path)

    # İki görüntü arasındaki farkı hesapla
    diff = ImageChops.difference(image1, image2)

    # Fark görüntüsünde herhangi bir farklılık olup olmadığını kontrol et
    if diff.getbbox() is None:
        return True  # Görüntüler aynı
    else:
        return False  # Görüntüler farklı

# Kullanım:
image1_path = "_parametrize-1div4.jpg"
image2_path = "4_5-1div4noncollision.jpg"
are_same = compare_images(image1_path, image2_path)
print("Görüntüler aynı mı?", are_same)
