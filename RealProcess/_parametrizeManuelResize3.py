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

    def calculate_average_color(image_data, width, height, target_width, target_height, block_width, block_height):
        """Blok boyutuna göre piksel renk ortalamasını hesaplar."""
        new_data = []
        for i in range(target_height):
            for j in range(target_width):
                r_sum, g_sum, b_sum = 0, 0, 0
                count = 0
                for m in range(int(block_height)):
                    for n in range(int(block_width)):
                        y = int(i * block_height + m) # buradaki int() dönüşümü gereksiz değil mi?
                        x = int(j * block_width + n) # buradaki int() dönüşümü gereksiz değil mi?
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
        new_data = calculate_average_color(image_data, width, height, target_width, target_height, block_width, block_height)

        new_image = create_new_image(new_data, target_width, target_height)
        return new_image

    image = image.copy() # Gereksiz mi, iterasyon yok.
    resized_image = process_image(image, target_width, target_height)
    resized_image.save('_parametrize-1div4.jpg')

# Kullanım:
image = Image.open("2.jpg")
_manual_resize(image, 150, 150)
#_manual_resize(image, 200, 200)
#_manual_resize(image, 31, 43)
#_manual_resize(image, 3, 7)
#_manual_resize(image, 7, 3)
#_manual_resize(image, 2, 1)
#_manual_resize(image, 1, 1)
#_manual_resize(image, 0, 0)
#_manual_resize(image, 0.5, 0.5)
#_manual_resize(image, 75, 75)



def calculate_average_color(image_data, width, height, target_width, target_height, block_width, block_height):
    """Blok boyutuna göre piksel renk ortalamasını hesaplar."""
    new_data = []  # Yeni boyutlara sahip görüntünün piksel verilerini tutacak liste.
    for i in range(target_height):  # Hedef görüntü yüksekliği boyunca döngü.
        for j in range(target_width):  # Hedef görüntü genişliği boyunca döngü.
            r_sum, g_sum, b_sum = 0, 0, 0  # Kırmızı, yeşil ve mavi renk bileşenlerinin toplamı.
            count = 0  # Ortalama hesaplamak için toplam piksel sayacı.
            for m in range(int(block_height)):  # Orijinal görüntüdeki blok yüksekliği boyunca döngü.
                for n in range(int(block_width)):  # Orijinal görüntüdeki blok genişliği boyunca döngü.
                    y = int(i * block_height + m)  # Orijinal görüntüdeki pikselin y koordinatı.
                    x = int(j * block_width + n)  # Orijinal görüntüdeki pikselin x koordinatı.
                    if y < height and x < width:  # Pikselin görüntü sınırları içinde olduğundan emin ol.
                        idx = y * width + x  # Pikselin düz liste indeksini hesapla.
                        r_sum += image_data[idx][0]  # Kırmızı bileşeni topla.
                        g_sum += image_data[idx][1]  # Yeşil bileşeni topla.
                        b_sum += image_data[idx][2]  # Mavi bileşeni topla.
                        count += 1  # Piksel sayısını artır.
            # Her bir renk bileşeni için ortalama değeri hesapla.
            r = r_sum // count
            g = g_sum // count
            b = b_sum // count
            new_data.append((r, g, b))  # Hesaplanan ortalama renk değerini yeni veri listesine ekle.
    return new_data  # Yeni boyutlara sahip görüntünün piksel verilerini döndür.

print(f"a{2*2:<2}b")
print(f"a{2*2:>2}b")
print(f"a{2*2:^3}b")

"""
import unittest
from PIL import Image

class TestManualResize(unittest.TestCase):
    
    def setUp(self):
        #Testlerde kullanılacak örnek görüntüyü oluştur.
        self.image = Image.new("RGB", (100, 100), color=(255, 0, 0))  # Kırmızı bir görüntü

    def test_resize_to_75_75(self):
        #Görüntünün 75x75 boyutlarına doğru şekilde yeniden boyutlandırılıp boyutlandırılmadığını kontrol et.
        resized_image = _manual_resize(self.image, 75, 75)
        self.assertEqual(resized_image.size, (75, 75))

    def test_resize_to_200_200(self):
        #Görüntünün 200x200 boyutlarına doğru şekilde yeniden boyutlandırılıp boyutlandırılmadığını kontrol et.
        resized_image = _manual_resize(self.image, 200, 200)
        self.assertEqual(resized_image.size, (200, 200))

    def test_resize_to_1_1(self):
        #Görüntünün 1x1 boyutlarına doğru şekilde yeniden boyutlandırılıp boyutlandırılmadığını kontrol et.#
        resized_image = _manual_resize(self.image, 1, 1)
        self.assertEqual(resized_image.size, (1, 1))

    def test_resize_to_0_0(self):
        #Görüntünün 0x0 boyutlarına yeniden boyutlandırma sırasında hata fırlatmasını kontrol et.#
        with self.assertRaises(ValueError):
            _manual_resize(self.image, 0, 0)

    def test_resize_to_fractional_size(self):
        #Görüntünün 0.5x0.5 gibi küsuratlı boyutlara yeniden boyutlandırma sırasında hata fırlatmasını kontrol et.#
        with self.assertRaises(ValueError):
            _manual_resize(self.image, 0.5, 0.5)

if __name__ == '__main__':
    unittest.main()
"""