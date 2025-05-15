RGB'den YCbCr'ye Dönüşüm:

python
Kodu kopyala
def rgb_to_ycbcr(R, G, B):
    Y = 0.299 * R + 0.587 * G + 0.114 * B
    Cb = -0.1687 * R - 0.3313 * G + 0.5 * B + 128
    Cr = 0.5 * R - 0.4187 * G - 0.0813 * B + 128
    return Y, Cb, Cr
YCbCr'den RGB'ye Dönüşüm:

python
Kodu kopyala
def ycbcr_to_rgb(Y, Cb, Cr):
    R = Y + 1.402 * (Cr - 128)
    G = Y - 0.344136 * (Cb - 128) - 0.714136 * (Cr - 128)
    B = Y + 1.772 * (Cb - 128)
    return R, G, B

# RGB değerleri
R, G, B = 255, 0, 0  # Örnek olarak kırmızı

# RGB'den YCbCr'ye dönüşüm
Y, Cb, Cr = rgb_to_ycbcr(R, G, B)
print(f"YCbCr: Y={Y}, Cb={Cb}, Cr={Cr}")

# YCbCr'den RGB'ye dönüşüm
R_new, G_new, B_new = ycbcr_to_rgb(Y, Cb, Cr)
print(f"RGB: R={R_new}, G={G_new}, B={B_new}")

####################

Renk bilgileri, YCbCr renk uzayında üç bileşenden oluşur: Y, Cb ve Cr. Bu sistemde, 
renk bilgisi genellikle iki bileşenle temsil edilir: Cb ve Cr, çünkü bu bileşenler 
renk tonlarını tanımlar, bu da renklerin nasıl göründüğünü ifade eder. Üçüncü bileşen olan Y, 
parlaklık bilgisi sağlar. İşte bu bileşenlerin nasıl çalıştığına dair daha ayrıntılı bir açıklama:

### YCbCr Renk Uzayı

- **Y (Luminance / Parlaklık):**
  - Bu bileşen, görüntünün parlaklık değerini temsil eder. İnsan gözünün parlaklık 
  değişikliklerine renk değişikliklerinden daha duyarlı olduğunu göz önünde bulundurarak, 
  yüksek çözünürlükte saklanır.

- **Cb (Chrominance Blue / Mavi Renk Bileşeni):**
  - Bu bileşen, mavi renk tonunun ne kadar yoğun olduğunu belirtir. Yani, mavi rengi 
  nasıl algıladığımızı ifade eder. Renk verilerinde daha az bilgi gerektirdiği için, 
  genellikle düşük çözünürlükte saklanır.

- **Cr (Chrominance Red / Kırmızı Renk Bileşeni):**
  - Bu bileşen, kırmızı renk tonunun ne kadar yoğun olduğunu belirtir. Yani, kırmızı 
  rengi nasıl algıladığımızı ifade eder. Cb bileşenine benzer şekilde, daha az bilgi 
  içerir ve düşük çözünürlükte saklanır.

### Renklerin Üç Bileşeni

Renkli görüntülerin RGB renk uzayında, renk bilgisi üç bileşenden o
luşur: Kırmızı (R), Yeşil (G) ve Mavi (B). YCbCr renk uzayında ise bu bileşenler şu 
şekilde temsil edilir:

- **Renk Bilgisi:**
  - YCbCr'de, renk bilgisi doğrudan R ve G bileşenleri ile birlikte değil, Cb ve Cr 
  bileşenleriyle temsil edilir. Bunun nedeni, Cb ve Cr bileşenlerinin renk tonlarını ve 
  doygunluğunu belirlemesi, Y bileşeninin ise parlaklığı belirlemesidir. Bu bileşenler, 
  parlaklık ve renk bilgilerini ayırarak daha verimli sıkıştırma sağlar.

### Nasıl Çalışır?

- **Renk Bilgilerinin Yeniden Oluşturulması:**
  - Cb ve Cr bileşenleri, görüntünün renk tonlarını ve doygunluğunu temsil eder. 
  Y bileşeni, bu renkleri parlaklık verisiyle birleştirerek RGB renk uzayına dönüştürülür. 
  Cb ve Cr bileşenleri Y bileşenine göre daha düşük çözünürlükte saklanabilir çünkü 
  insan gözü renk farklılıklarını parlaklık değişikliklerine göre daha az algılar.

### Örnek Hesaplama

RGB’den YCbCr’ye dönüşüm şu formülle yapılır:

- **Y (Parlaklık) = 0.299 * R + 0.587 * G + 0.114 * B**
- **Cb (Mavi Renk Bileşeni) = -0.1687 * R - 0.3313 * G + 0.5 * B + 128**
- **Cr (Kırmızı Renk Bileşeni) = 0.5 * R - 0.4187 * G - 0.0813 * B + 128**

Bu formüller, her RGB pikseli için bir YCbCr pikseli oluşturur ve renk bilgilerini bu 
bileşenlerde temsil eder.

### Özet

- **Y**: Parlaklık (Luminance)
- **Cb**: Mavi renk bileşeni (Blue Chrominance)
- **Cr**: Kırmızı renk bileşeni (Red Chrominance)

Yeşil renk, doğrudan Y bileşeninde temsil edilir ve bu renk bileşeninin (Cb ve Cr) 
işlemlerinde kullanılmaz. Cb ve Cr bileşenleri, renk tonlarını ve doygunluğunu belirtirken, 
Y bileşeni parlaklık bilgisini sağlar.

##########

`Pillow` kütüphanesini kullanarak görüntüleri işlediğinizde, `image.getdata()` yöntemi 
yalnızca piksel 
değerlerini döndürür ve bu değerler genellikle RGB (kırmızı, yeşil, mavi) formatındadır. 
JPEG ve PNG 
formatlarında renk bilgileri RGB olarak depolanır ve `getdata()` bu bilgileri doğrudan alır. 
Ancak, `getdata()` metoduyla parlaklık (Y) ve renk (Cb, Cr) bilgilerini göremezsiniz, 
çünkü bu yöntem 
sadece renkli piksellerin RGB değerlerini döndürür.

### Croma Alt Örneklemesini Görmek

JPEG ve bazı diğer formatlar, renk bileşenlerinin alt örneklenmesi (chroma subsampling) kullanır. 
Bu, renk bilgilerini (Cb ve Cr) parlaklık bilgisine (Y) kıyasla daha düşük çözünürlükte saklamayı 
içerir. Alt örnekleme, görsel verinin boyutunu azaltarak dosya boyutunu küçültür.

Croma alt örneklemesini (yani, Y, Cb, Cr bileşenlerinin nasıl saklandığını) görmenin birkaç yolu vardır:

1. **Görüntüyü YCbCr Renk Uzayına Dönüştürmek:**

   Görüntü RGB formatında olduğunda, renk ve parlaklık bilgilerini incelemek için önce YCbCr 
   renk uzayına dönüştürmeniz gerekir. YCbCr renk uzayında:
   - **Y**: Parlaklık bileşeni (luminance)
   - **Cb**: Mavi-yüksekliği bileşeni (chrominance blue)
   - **Cr**: Kırmızı-yüksekliği bileşeni (chrominance red)

   ```python
   from PIL import Image

   # Görüntüyü YCbCr renk uzayına dönüştür
   image = Image.open('example.jpg')
   ycbcr_image = image.convert('YCbCr')

   # Y, Cb, Cr bileşenlerini ayır
   y, cb, cr = ycbcr_image.split()

   # Bilgileri incele
   y_data = list(y.getdata())
   cb_data = list(cb.getdata())
   cr_data = list(cr.getdata())

   # Örnek verileri yazdır
   print("Y bileşeni:", y_data[:10])
   print("Cb bileşeni:", cb_data[:10])
   print("Cr bileşeni:", cr_data[:10])
   ```

2. **Croma Alt Örneklemesinin Etkisini Görmek:**

   Alt örnekleme işleminin etkisini gözlemlemek için, aşağıdaki adımları uygulayabilirsiniz:

   - **Görüntüyü YCbCr formatında açın ve bileşenleri ayırın.**
   - **Cb ve Cr bileşenlerini bir sıcaklık veya uzamsal filtre ile küçültün.**
   - **Y bileşeni ile birleştirerek görüntüyü yeniden oluşturun.**

   Bu şekilde, alt örnekleme sonucunda kaybolan ayrıntıları gözlemleyebilirsiniz.

   ```python
   import numpy as np
   from PIL import Image

   # YCbCr görüntüyü yükle
   image = Image.open('example.jpg')
   ycbcr_image = image.convert('YCbCr')
   y, cb, cr = ycbcr_image.split()

   # Cb ve Cr bileşenlerinin boyutlarını küçültme (örnek olarak)
   cb_resized = cb.resize((cb.width // 2, cb.height // 2), Image.NEAREST)
   cr_resized = cr.resize((cr.width // 2, cr.height // 2), Image.NEAREST)

   # Bileşenleri birleştirme
   new_ycbcr_image = Image.merge('YCbCr', (y, cb_resized, cr_resized))
   new_image = new_ycbcr_image.convert('RGB')

   # Sonucu kaydet
   new_image.save('resized_example.jpg')
   ```

### Croma Alt Örneklemesinin Nasıl Görüntülenebileceğini Anlamak:

Alt örnekleme, renk bileşenlerini (Cb, Cr) görüntünün parlaklık bileşenine (Y) göre daha 
düşük çözünürlükte saklamak anlamına gelir. Bu nedenle, renk verileri daha düşük çözünürlükte 
depolanır, bu da renk ayrıntılarının kaybolmasına yol açabilir. Görüntü işleme sırasında 
bu farkları gözlemlemek için renk ve parlaklık bileşenlerinin çözünürlüklerini karşılaştırabilir 
ve yeniden birleştirme işlemleri yapabilirsiniz.