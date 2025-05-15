"""
1. Pozlama (Exposure):
Ne Zaman Gerçekleşmeli?: Sensör verisi kaydedilmeden önce.
Neden?: Pozlama, kameranın sensöre ulaşan ışık miktarını kontrol eder. Doğrudan sensörde gerçekleşir ve veriler henüz işlenmeden önce doğru bir ışık dengesi elde etmek için kritik bir aşamadır. Aksi takdirde aşırı ya da yetersiz pozlama, işlenmiş görüntünün kalite kaybına neden olabilir. Bu işlem, ışığın sensöre ulaştığı andan itibaren başlar ve kaydedilmeden önce gerçekleşmelidir.
2. Bayer Filtre Demosaicing (Interpolation):
Ne Zaman Gerçekleşmeli?: Pozlamadan sonra, ancak renk dengeleme ve diğer işlemlerden önce.
Neden?: Bayer filtresi uygulandığında, sensör tek bir renk kanalından (kırmızı, yeşil, mavi) ham veriler kaydeder. Renkleri tam olarak oluşturmak için bu ham verilerin interpolasyonu yapılır (Bayer demosaicing). Demosaicing, renk işlemleri ve diğer adımlardan önce yapılmalıdır, çünkü tam renkli bir görüntü elde edilmeden renk dengeleme gibi işlemleri uygulamak mümkün olmaz.
3. Renk Dengesi (White Balance):
Ne Zaman Gerçekleşmeli?: Bayer filtresinden sonra.
Neden?: Beyaz dengesi, farklı ışık kaynaklarının oluşturduğu renk sapmalarını düzeltmek için kullanılır. Demosaicing ile tam renkli bir görüntü elde edildikten sonra uygulanmalıdır, çünkü doğru beyaz dengesini sağlamak için her üç renk kanalını (RGB) işlemek gerekir. Ham sensör verisi yalnızca tek renk kanalı verisi içerdiğinden bu aşamadan önce beyaz dengesi uygulanamaz.
4. Gürültü Azaltma (Noise Reduction):
Ne Zaman Gerçekleşmeli?: Genellikle Bayer filtresi uygulandıktan sonra, ancak bazı durumlarda ham sensör verileri üzerinde de yapılabilir.
Neden?: Gürültü, sensörün doğrudan ürettiği ham verilerde (RAW) bulunur. Gürültü azaltma, demosaicing işleminden önce ya da sonra yapılabilir, ancak çoğu modern algoritma demosaicing sonrası uygulanır çünkü gürültü, renk kanalları birleştirildikten sonra daha belirgin hale gelir. Demosaicing öncesinde gürültü azaltma yapmak, ham veri üzerinde bazı ince gürültü türlerini (örneğin, sensör düzeyindeki sıcaklık kaynaklı gürültü) daha iyi temizleyebilir.
5. Renk Dönüşümleri ve Ton Haritalama (Color Transformations and Tone Mapping):
Ne Zaman Gerçekleşmeli?: Demosaicing, renk dengesi ve gürültü azaltma işlemlerinden sonra.
Neden?: Bu aşamada, tam renkli bir görüntü elde edildiği için renk dönüşümleri (örneğin, RGB'den sRGB veya AdobeRGB gibi renk uzaylarına geçiş) ve ton haritalama (yüksek dinamik aralığı daha dar bir aralığa sıkıştırmak) işlemleri yapılabilir. Renk dönüşümleri, demosaicing öncesinde yapılamaz çünkü henüz tam renk bilgisi yoktur. Ton haritalama ise tüm renk ve parlaklık bilgileri tamamlandıktan sonra uygulanır.
"""

"""
1. Renk Dengesi (White Balance)

Renk dengesi ayarı, görüntünün renk sıcaklığını düzenleyerek, beyaz alanların gerçekten beyaz görünmesini sağlar. Genellikle, kırmızı, yeşil ve mavi (RGB) kanallarının ortalamasını hesaplayarak ve bu ortalamaları normalize ederek yapılır.

Renk dengesi (white balance), bir görüntüdeki renk sapmalarını düzeltmek ve görüntüyü daha doğal veya gerçeğe uygun hale getirmek için kullanılan önemli bir adımdır. Beyaz dengesini uygulamanızın temel nedeni, farklı ışık kaynaklarının (örneğin güneş ışığı, floresan ışığı, tungsten lambası) farklı renk sıcaklıkları yaymasıdır. Eğer bir görüntüde beyaz renkli nesneler gerçekte beyaz görünmüyorsa, beyaz dengesi bozulmuş demektir. Bu yüzden renk dengesi uygulanarak bu sapmalar düzeltilir ve doğru renk temsili elde edilir.

Beyaz dengesi (white balance) görüntüdeki renkleri, ışık kaynağının renk sıcaklığına göre ayarlamak için kullanılır. Doğru beyaz dengesi, beyaz nesnelerin görüntüde gerçekten beyaz görünmesini sağlar, ışık kaynaklarının renk sıcaklıkları ise genellikle sıcak (kırmızımsı) veya soğuk (mavimsi) olabilir. Beyaz dengesi için kazanç değerlerinin (r_gain, g_gain, b_gain) seçimi, ortam ışığının sıcaklığına ve görüntünün genel renk dağılımına bağlıdır.
Kazanç Değerlerinin Seçimi:

    r_gain (Kırmızı kanal kazancı): Işık kaynağı soğuksa (mavimsi), kırmızı kanalı güçlendirmek için r_gain artırılır.
    g_gain (Yeşil kanal kazancı): Genellikle nötrdür, çünkü yeşil renk insan gözünün en duyarlı olduğu renktir ve genelde fazla değişiklik gerektirmez.
    b_gain (Mavi kanal kazancı): Işık kaynağı sıcakken (kırmızımsı), mavi kanalı güçlendirmek için b_gain artırılır.

Kazanç değerleri, ışık kaynaklarının renk sıcaklığı (Kelvin cinsinden ölçülür) ve görüntüdeki renk dağılımına göre ayarlanmalıdır. Örneğin:

    Sıcak (gün batımı) ışıkta: r_gain > 1, b_gain > 1 olabilir.
    Soğuk (gölgeli, bulutlu hava) ışıkta: r_gain < 1, b_gain > 1 olabilir.

Dinamik Beyaz Dengesi:

Kazanç değerlerinin görüntüye göre dinamik olarak belirlenmesi için otomatik beyaz dengesi (AWB) algoritmaları kullanılır. Bu algoritmalar genellikle şu adımları içerir:

    Gri Dünya Varsayımı (Gray World Assumption): Görüntüdeki tüm renklerin ortalamasının nötr (gri) olması gerektiği varsayılır. Her renk kanalının ortalaması hesaplanır ve bu ortalamaya göre kazanç değerleri ayarlanır.
    İstatistiksel Analiz: Görüntüdeki en parlak bölgeler beyaz olarak kabul edilip, bu bölgelere göre renk kanalları normalize edilir.

Işık Koşulları ve Pozlama:

Pozlama, bir görüntünün genel parlaklığı ile ilgilidir ve beyaz dengesi genellikle parlaklıkla doğrudan ilişkili değildir. Beyaz dengesi, renklerin doğru şekilde dengelenmesine odaklanırken, pozlama görüntünün ne kadar aydınlık veya karanlık olduğuna odaklanır. Ancak, düşük pozlamalı (karanlık) bir görüntüde renkler doğru şekilde yakalanmadığından, beyaz dengesi zorlaşabilir. Benzer şekilde aşırı pozlanmış bir görüntüde renkler yanmış olabilir ve beyaz dengesi ayarı zorlaşabilir. Bu yüzden ışık koşulları, hem pozlama hem de beyaz dengesi üzerinde etkilidir, ancak bu iki parametre birbirinden bağımsızdır.

Dinamik bir beyaz dengesi uygulaması için şu adımlar izlenebilir:

    Görüntüdeki ortalama RGB değerlerini analiz et.
    Beyaz dengesini ayarlamak için her kanalın ortalama değerini kullanarak kazançları dinamik olarak belirle.
    Eğer beyaz dengesini doğru sağlamak istiyorsan, histogram tabanlı analiz veya grilik seviyesi gibi yöntemlerle otomatik kazanç değerlerini ayarlayabilirsin.

Bunun yanında, parlaklık ve beyaz dengesini ayrı ayrı kontrol etmek için, önce pozlama kontrolü (örneğin gama düzeltmesi) uygulayıp sonra beyaz dengesi yapabilirsin.

Renk Sıcaklığını Ölçme (Kamera Sensörü ile):

Bir kameranın sensör verilerinden renk sıcaklığını tahmin etmek için, sensörden gelen ham RGB verilerini analiz ederek, beyaz dengesi için kazanç değerlerini dinamik olarak hesaplamak mümkündür. Işık kaynağının renk sıcaklığını (Kelvin cinsinden) belirlemek için şu adımları takip edebilirsin:

    Ortalama Renk Kanalı Yoğunluklarını Hesapla: Bayer sensöründen gelen RGB verilerini toplayarak, her bir renk kanalının ortalamasını hesaplayabilirsin. Örneğin:
        R_mean: Tüm kırmızı piksellerin ortalama değeri
        G_mean: Tüm yeşil piksellerin ortalama değeri
        B_mean: Tüm mavi piksellerin ortalama değeri

    Kırmızı-Mavi Oranı: Renk sıcaklığını tahmin etmek için yaygın bir yöntem, kırmızı-mavi oranını (R/B) kullanmaktır. Işık kaynağı sıcaksa, kırmızı kanal daha baskın olacak ve bu oran daha yüksek olacaktır. Soğuk ışık kaynaklarında ise mavi kanal daha güçlü olur ve bu oran daha düşük çıkar.

    Oran şu şekilde hesaplanır:
    R/B ratio=RmeanBmean
    R/B ratio=Bmean​Rmean​​

    Bu oran belirli eşiklerle karşılaştırılarak renk sıcaklığı hakkında fikir verebilir.

    Renk Sıcaklığını Tahmin Et: Kırmızı-mavi oranı kullanılarak ampirik bir modelle renk sıcaklığı tahmin edilebilir. Aşağıdaki formül, bu ilişkiyi kurmak için kullanılabilir:
    T(K)=a×RmeanBmean+b
    T(K)=a×Bmean​Rmean​​+b

    Burada T(K) tahmini renk sıcaklığı, a ve b ise sensöre özgü parametrelerdir ve deneysel olarak belirlenebilir. Genelde, a ve b parametreleri sensörün kalibrasyonu sırasında belirlenir.

    Yeşil Kanalı Nötr Olarak Kullanma: Yeşil kanal, genellikle doğal ışıkta diğer renklerle daha dengeli olur. Bu yüzden bazı otomatik beyaz dengesi algoritmaları yeşil kanalı nötr renk olarak kabul eder ve kırmızı ve mavi kanallar buna göre ayarlanır. Ancak bu yöntem özellikle RGB histogramlarının dağılımına dayalı daha gelişmiş bir algoritma ile desteklenebilir.

Python İmplementasyonu:
"""

import numpy as np
import cv2

def white_balance(image):
    # RGB kanalları için ortalamaları hesapla
    result = np.zeros_like(image)
    avgR = np.mean(image[:, :, 0])
    avgG = np.mean(image[:, :, 1])
    avgB = np.mean(image[:, :, 2])

    # Ortalamaları normalize et
    result[:, :, 0] = np.clip((image[:, :, 0] * (128 / avgR)), 0, 255)
    result[:, :, 1] = np.clip((image[:, :, 1] * (128 / avgG)), 0, 255)
    result[:, :, 2] = np.clip((image[:, :, 2] * (128 / avgB)), 0, 255)
    
    return result

# Görüntüyü yükle
image = cv2.imread('raw_image.png')
white_balanced_image = white_balance(image)
cv2.imwrite('zzzwhite_balanced_image.png', white_balanced_image)

"""
2. Pozlama (Exposure)

Pozlama ayarı, görüntünün ne kadar parlak veya karanlık olacağını kontrol eder. Pozlama, genellikle bir görüntünün parlaklığını artırmak veya azaltmak için her pikselin parlaklık değerlerinin çarpılması ile ayarlanır.

Python İmplementasyonu:
"""
from PIL import Image

def estimate_ambient_light_level(image):
    """
    Görüntü verilerinden ortam ışık seviyesini tahmin eder.
    Daha parlak görüntüler daha yüksek ortam ışık seviyesine işaret eder.
    """
    # Görüntüyü gri tonlamaya çevir
    grayscale_image = image.convert("L")
    
    # Histogramı al
    histogram = grayscale_image.histogram()
    
    # Histogramdaki parlaklık değerlerinin ağırlıklı ortalamasını al
    total_pixels = sum(histogram)
    brightness_sum = sum(i * histogram[i] for i in range(256))
    
    avg_brightness = brightness_sum / total_pixels
    
    # Parlaklık seviyesini çevresel ışık seviyesiyle ilişkilendirin (örneğin, 0-255 arasında)
    ambient_light_level = avg_brightness
    
    return ambient_light_level

# Örnek kullanım
image = Image.open("example_image.jpg")
ambient_light_level = estimate_ambient_light_level(image)
print(f"Estimated Ambient Light Level: {ambient_light_level}")


def auto_exposure(image, ambient_light_level):
    """
    Görüntünün ortalama parlaklığını analiz eder ve pozlamayı otomatik olarak ayarlayan bir faktör döner.
    ambient_light_level, sensörden gelen çevresel ışık seviyesi verisidir.
    """
    data = list(image.getdata())
    
    # Ağırlıklı ortalama parlaklık hesaplama (R, G, B değerleri için farklı ağırlıklar)
    total_brightness = sum([0.299 * pixel[0] + 0.587 * pixel[1] + 0.114 * pixel[2] for pixel in data])
    avg_brightness = total_brightness / len(data)
    
    # Çevresel ışık seviyesine göre hedef parlaklık belirleme
    # Bu örnekte çevresel ışık seviyesi (ambient_light_level) doğrudan hedef parlaklık olarak kullanılıyor.
    target_brightness = ambient_light_level
    
    # Hedef parlaklığa ulaşmak için gereken pozlama katsayısını hesapla
    exposure_factor = target_brightness / avg_brightness if avg_brightness > 0 else 1.0
    return exposure_factor


def auto_exposure(image, target_brightness=128):
    """
    Görüntünün ortalama parlaklığını analiz eder ve pozlamayı otomatik olarak ayarlayan bir faktör döner.
    target_brightness, hedeflenen ortalama parlaklık seviyesidir (örneğin 128).
    """
    data = list(image.getdata())
    
    # Ağırlıklı ortalama parlaklık hesaplama (R, G, B değerleri için farklı ağırlıklar)
    total_brightness = sum([0.299 * pixel[0] + 0.587 * pixel[1] + 0.114 * pixel[2] for pixel in data])
    avg_brightness = total_brightness / len(data)
    
    # Hedef parlaklığa ulaşmak için gereken pozlama katsayısını hesapla
    exposure_factor = target_brightness / avg_brightness if avg_brightness > 0 else 1.0
    return exposure_factor

def adjust_exposure(image, exposure_factor):
    # Tüm kanalları pozlama faktörü ile çarp
    result = np.clip(image * exposure_factor, 0, 255).astype(np.uint8)
    return result

# Pozlama faktörünü belirle (1.0: aynı, <1.0: daha karanlık, >1.0: daha parlak)
exposure_factor = 1.5
exposure_adjusted_image = adjust_exposure(white_balanced_image, exposure_factor)
cv2.imwrite('zzzexposure_adjusted_image.png', exposure_adjusted_image)

"""
3. Gürültü Azaltma (Noise Reduction)

Gürültü azaltma, düşük ışık koşullarında veya sensör gürültüsünden kaynaklanan 
bozulmaları azaltmak için kullanılır. Bu işlem için basit bir Gaussian Blur veya 
daha karmaşık bir ortalama filtresi kullanabiliriz.

Gaussian blur veya median filter gibi yöntemlerle uygulanabilir.

Python İmplementasyonu:
"""

def noise_reduction(image):
    # Gaussian blur kullanarak gürültü azaltma
    result = cv2.GaussianBlur(image, (5, 5), 0)
    return result

noise_reduced_image = noise_reduction(exposure_adjusted_image)
cv2.imwrite('zzznoise_reduced_image.png', noise_reduced_image)

"""
4. Renk Dönüşümleri ve Ton Haritalama (Color Transformations and Tone Mapping)

Renk dönüşümleri ve ton haritalama, farklı cihazlarda görüntülerin doğru bir şekilde gösterilmesini sağlar ve ayrıca kontrast ve parlaklık düzenlemeleri yapar. Bu işlem için OpenCV'nin LAB renk uzayını kullanarak bir kontrast iyileştirmesi yapılabilir.

WDR ve HDR nasıl çalışır?

Renk uzayları, renklerin sayısal olarak temsil edilmesini sağlayan matematiksel modellerdir. Farklı renk uzayları, farklı uygulamalar ve cihazlar için optimize edilmiştir. İşte en yaygın renk uzaylarından bazıları:

RGB (Red, Green, Blue):
Kullanım Alanı: Dijital ekranlar, bilgisayar grafikleri ve dijital fotoğrafçılık.
Özellikler: Renkler, kırmızı, yeşil ve mavi bileşenlerin karışımıyla oluşturulur1.
CMYK (Cyan, Magenta, Yellow, Key/Black):
Kullanım Alanı: Baskı teknolojileri.
Özellikler: Renkler, camgöbeği, macenta, sarı ve siyah bileşenlerin karışımıyla oluşturulur1.
HSV (Hue, Saturation, Value):
Kullanım Alanı: Görüntü işleme ve bilgisayarla görme.
Özellikler: Renkler, renk tonu, doygunluk ve parlaklık bileşenleriyle tanımlanır1.
YUV (Luminance, Chrominance):
Kullanım Alanı: Video sıkıştırma ve iletimi.
Özellikler: Renkler, parlaklık ve iki renk bileşeniyle tanımlanır1.
sRGB (Standard RGB):
Kullanım Alanı: İnternet ve çoğu dijital cihaz.
Özellikler: Standart bir renk gamı sunar ve çoğu cihazla uyumludur2.
Adobe RGB:
Kullanım Alanı: Profesyonel fotoğrafçılık ve grafik tasarım.
Özellikler: sRGB’den daha geniş bir renk gamı sunar2.
ProPhoto RGB:
Kullanım Alanı: Yüksek kaliteli fotoğrafçılık.
Özellikler: En geniş renk gamlarından birine sahiptir2.

Python İmplementasyonu:
"""

def color_transformation_and_tone_mapping(image):
    # Görüntüyü LAB renk uzayına dönüştür
    lab_image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
    
    # LAB kanalını ayır
    l, a, b = cv2.split(lab_image)

    # L kanalını CLAHE algoritması ile iyileştir
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    cl = clahe.apply(l)

    # LAB kanallarını birleştir ve tekrar BGR renk uzayına dönüştür
    limg = cv2.merge((cl, a, b))
    result = cv2.cvtColor(limg, cv2.COLOR_LAB2BGR)
    
    return result

final_image = color_transformation_and_tone_mapping(noise_reduced_image)

import cv2

# HDR formatındaki bir görüntüyü yükle
hdr_image = cv2.imread('example_hdr_image.hdr', cv2.IMREAD_ANYDEPTH)

# Ton haritalama işlemi (gamma=2.2 ile basit bir ton haritalama)
tonemap = cv2.createTonemap(gamma=2.2)
ldr_image = tonemap.process(hdr_image)

# Sonucu göster
cv2.imshow('Tone Mapped Image', ldr_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
