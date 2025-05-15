import os
import math
from PIL import Image
import numpy as np

def create_new_image(new_data, new_width, new_height):
    """Yeni boyutlara sahip yeni bir görüntü oluştur ve verileri yerleştir."""
    new_image = Image.new("RGB", (new_width, new_height))
    new_image.putdata(new_data)
    return new_image

def my_first_opinion(image):
    new_data = []
    new_data2 = []
    width, height = image.size
    data = image.getdata()

    for i in range(width):
        for j in range(height):
            idx = i * width + j

            #Hep aynı bloktan besleniyor
            if i < width - 1 and j < height - 1:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data.append((data[idx + width][0], data[idx][1], data[idx + 1][2]))
                    else:#blue
                        new_data.append((data[idx + width - 1][0], data[idx - 1][1], data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        new_data.append((data[idx][0], data[idx + 1][1], data[idx + 1 + width][2]))
                    else:#green
                        new_data.append((data[idx - 1][0], data[idx][1], data[idx - width][2]))
            else:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data.append((data[idx - width][0], data[idx][1], data[idx - 1][2]))
                    else:#blue
                        new_data.append((data[idx - width - 1][0], data[idx - 1][1], data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        new_data.append((data[idx][0], data[idx - 1][1], data[idx - width - 1][2]))
                    else:#green
                        new_data.append((data[idx - 1][0], data[idx][1], data[idx - width][1]))

            #Sürekli uzaktan alarak besleniyor
            if i < width - 1 and j < height - 1:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data2.append((data[idx + width][0], data[idx][1], data[idx + 1][2]))
                    else:#blue
                        new_data2.append((data[idx + width + 1][0], data[idx + 1][1], data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        new_data2.append((data[idx][0], data[idx + 1][1], data[idx + 1 + width][2]))
                    else:#green
                        new_data2.append((data[idx + 1][0], data[idx][1], data[idx + width][2]))
            else:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data2.append((data[idx - width][0], data[idx][1], data[idx - 1][2]))
                    else:#blue
                        new_data2.append((data[idx - width - 1][0], data[idx - 1][1], data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        new_data2.append((data[idx][0], data[idx - 1][1], data[idx - width - 1][2]))
                    else:#green
                        new_data2.append((data[idx - 1][0], data[idx][1], data[idx - width][1]))

    new_image = create_new_image(new_data, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_1my_first_opinion.png")
    new_image2 = create_new_image(new_data2, width, height)
    new_image2.save(f"{int(os.path.basename(__file__)[0]) + 1}_1my_first_opinion-2.png")

def my_second_opinion(image):
    new_data = []
    width, height = image.size
    data = image.getdata()

    for i in range(width):
        for j in range(height):
            idx = i * width + j

            if i < width - 1 and j < height - 1:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data.append((data[idx + width][0], data[idx][1], data[idx + 1][2]))
                    else:#blue
                        left_green = data[idx - 1][1]
                        rigth_green = data[idx + 1][1]
                        bottom_green = data[idx + width][1]
                        avg_green = (left_green + rigth_green + bottom_green) // 3
                        left_bottom_red = data[idx + width - 1][0]
                        rigth_bottom_red = data[idx + width + 1][0]
                        avg_red = (left_bottom_red + rigth_bottom_red) // 2
                        new_data.append((avg_red, avg_green, data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        top_green = data[idx - 1][1]
                        rigth_green = data[idx + 1][1]
                        bottom_green = data[idx + width][1]
                        avg_green = (top_green + rigth_green + bottom_green) // 3
                        rigth_top_blue = data[idx - width + 1][2]
                        rigth_bottom_blue = data[idx + width + 1][2]
                        avg_blue = (rigth_top_blue + rigth_bottom_blue) // 2
                        new_data.append((data[idx][0], avg_green, avg_blue))
                    else:#green
                        top_blue = data[idx - width][2]
                        bottom_blue = data[idx + width][2] 
                        avg_blue = (top_blue + bottom_blue) // 2
                        left_red = data[idx - 1][0]
                        rigth_red = data[idx + 1][0]
                        avg_red = (left_red + rigth_red) // 2
                        new_data.append((avg_red, data[idx][1], avg_blue))
            else:
                if i % 2 == 0:
                    if j % 2 == 0:#green
                        new_data.append((data[idx - width][0], data[idx][1], data[idx - 1][2]))
                    else:#blue
                        new_data.append((data[idx - width - 1][0], data[idx - 1][1], data[idx][2]))
                else:
                    if j % 2 == 0:#red
                        new_data.append((data[idx][0], data[idx - 1][1], data[idx - width - 1][2]))
                    else:#green
                        new_data.append((data[idx - 1][0], data[idx][1], data[idx - width][1]))

    new_image = create_new_image(new_data, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_2my_second_opinion.png")


def nearest_neighbor_interpolation_bayer(image):
    """
    Bayer filtreli bir görüntü üzerinde en yakın komşu interpolasyonu ile demosaicing işlemi yapar.
    """

    # Görüntü boyutlarını al
    width, height = image.size
    data = list(image.getdata())  # Orijinal görüntü piksellerini al

    return

    # Yeni görüntüyü oluştur ve kaydet
    new_image = create_new_image(new_data, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_3nearest_neighbor_interpolation_bayer.png")


def bilinear_interpolasyon_bayer(image):
    """Bayer filtresine sahip bir görüntü üzerinde bilineer interpolasyon uygula ve yeni görüntü oluştur."""
    
    def compute_interpolation(data, x, y, width, height, channel):
        """Compute interpolated value for a given channel at position (x, y)."""
        value = 0.0
        weight_sum = 0.0
        channel_map = {'R': 0, 'G': 1, 'B': 2}

        for dx in [-1, 0, 1]:
            #weight_sum = 0 #Yeşil efekt
            for dy in [-1, 0, 1]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < height and 0 <= ny < width:
                    pixel_value = data[ny, nx][channel_map[channel]]
                    if (channel == 'R' and (nx % 2 == 1) and (ny % 2 == 0)) or \
                       (channel == 'B' and (nx % 2 == 0) and (ny % 2 == 1)) or \
                       (channel == 'G' and ((nx % 2 == 0 and ny % 2 == 0) or (nx % 2 == 1 and ny % 2 == 1))):
                        distance = max(abs(dx), abs(dy))
                        weight = 1 / (distance + 1)
                        """
                        Piksel Kopyalama veya Tek Noktaya Dayalı Interpolasyon: Eğer interpolasyonun amacı bir noktaya çok yakın piksellerin doğrudan kopyalanmasıysa ve mesafe sıfır olduğunda pikselin kopyalandığını garanti edebiliyorsanız, weight = 1 / distance formülü kullanılabilir. Bu durumda, zaten doğrudan kopyalama olduğu için sıfıra bölme sorunu yaşanmaz ve mesafeye 1 eklemenin avantajı kalmaz.
                        Daha Keskin Geçişlerin İstendiği Durumlar: Eğer interpolasyon sonucunda keskin geçişler isteniyorsa, mesafeye 1 eklenmemesi daha iyi olabilir. Çünkü mesafeye 1 eklemek, daha yumuşak geçişler oluştururken, doğrudan 1 / distance formülü ile ağırlıklandırma, yakın piksellerin daha güçlü bir şekilde etkilenmesine neden olur. Bu da daha keskin geçişlere ve detaylı sonuçlara yol açabilir. Örneğin, bir görüntüde doku detayları ön plandaysa ve detayların korunması gerekiyorsa, bu yaklaşım daha iyi sonuç verebilir.
                        Doğrudan Uzaklık Temelli Ağırlıklandırmanın Önemli Olduğu Durumlar: Eğer pikseller arasındaki mesafelerin doğrudan etkisinin önemli olduğu bir senaryoda çalışıyorsanız, mesafeye ekleme yapmadan doğrudan 1 / distance kullanmak anlamlı olabilir. Bu tür durumlar, her pikselin katkısının daha doğru bir şekilde hesaplanmak istendiği durumlarda tercih edilebilir. Mesafeye 1 eklemek, yakın piksellerin ağırlığını daha az etkileyecektir, bu da bazen istenmeyebilir.
                        """
                        value += weight * pixel_value
                        weight_sum += weight
        """
        Eğer weight_sum 0 ise, bir kenar durumu kontrolü yaparak renk değeri için bir varsayılan (default) değer atanmalıdır. Bu değer genellikle, çevre piksellerin ortalama rengi gibi bir değerdir.
        """
        return int(round(value / weight_sum)) if weight_sum > 0 else 0
    
    # Ana işleme başla
    width, height = image.size
    data = image.load()
    interpolated_image = []

    for x in range(height):
        for y in range(width):
            pixel = [0, 0, 0]  # RGB
            if (x % 2 == 0) and (y % 2 == 0):  # Green pixel
                pixel[1] = data[y, x][1]  # Green channel
                pixel[0] = compute_interpolation(data, x, y, width, height, 'R')
                pixel[2] = compute_interpolation(data, x, y, width, height, 'B')
            elif (x % 2 == 0) and (y % 2 == 1):  # Blue pixel
                pixel[2] = data[y, x][2]  # Blue channel
                pixel[0] = compute_interpolation(data, x, y, width, height, 'R')
                pixel[1] = compute_interpolation(data, x, y, width, height, 'G')
            elif (x % 2 == 1) and (y % 2 == 0):  # Red pixel
                pixel[0] = data[y, x][0]  # Red channel
                pixel[1] = compute_interpolation(data, x, y, width, height, 'G')
                pixel[2] = compute_interpolation(data, x, y, width, height, 'B')
            elif (x % 2 == 1) and (y % 2 == 1):  # Green pixel
                pixel[1] = data[y, x][1]  # Green channel
                pixel[0] = compute_interpolation(data, x, y, width, height, 'R')
                pixel[2] = compute_interpolation(data, x, y, width, height, 'B')
            
            interpolated_image.append(tuple(pixel))
    
    new_image = create_new_image(interpolated_image, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_4bilinear_interpolasyon_bayer.png")


def edge_directed_interpolation_bayer(image, use_gaussian=False, radius=1, sigma=1.0):
    """
    Bayer filtresine sahip bir görüntü üzerinde kenar yönlendirmeli interpolasyon uygula ve 
    isteğe bağlı olarak manuel Gauss filtresi uygula.
    """

    def gaussian_kernel(radius, sigma=1.0):
        """Gauss çekirdeği oluştur."""
        kernel_size = 2 * radius + 1
        kernel = [[0] * kernel_size for _ in range(kernel_size)]
        sum_val = 0.0
        for x in range(-radius, radius + 1):
            for y in range(-radius, radius + 1):
                exponent = -(x ** 2 + y ** 2) / (2 * sigma ** 2)
                kernel[x + radius][y + radius] = math.exp(exponent) / (2 * math.pi * sigma ** 2)
                sum_val += kernel[x + radius][y + radius]
        
        # Çekirdeği normalize et
        for i in range(kernel_size):
            for j in range(kernel_size):
                kernel[i][j] /= sum_val
        
        return kernel

    def apply_gaussian_filter(image_data, width, height, kernel, radius):
        """Görüntüye Gauss filtresi uygula."""
        filtered_image = []
        for x in range(height):
            row = []
            for y in range(width):
                red, green, blue = 0.0, 0.0, 0.0
                for i in range(-radius, radius + 1):
                    for j in range(-radius, radius + 1):
                        xi, yj = x + i, y + j
                        if 0 <= xi < height and 0 <= yj < width:
                            weight = kernel[i + radius][j + radius]
                            pixel = image_data[yj, xi]
                            red += pixel[0] * weight
                            green += pixel[1] * weight
                            blue += pixel[2] * weight
                row.append((int(red), int(green), int(blue)))
            filtered_image.append(row)
        return filtered_image

    def compute_gradient(data, x, y, width, height, channel):
        """Belirtilen (x, y) konumundaki gradyanları hesaplar."""
        grad_x, grad_y = 0.0, 0.0
        channel_map = {'R': 0, 'G': 1, 'B': 2}
        ch = channel_map[channel]
        if 0 < x < width - 1 and 0 < y < height - 1:
            grad_x = abs(int(data[y][x + 1][ch]) - int(data[y][x - 1][ch]))
            grad_y = abs(int(data[y + 1][x][ch]) - int(data[y - 1][x][ch]))
        return grad_x, grad_y

    def compute_edge_interpolation(data, x, y, width, height, channel):
        """Bir kanal için belirtilen (x, y) konumunda kenar yönlendirmeli interpolasyon değeri hesapla."""
        value = 0.0
        weight_sum = 0.0
        channel_map = {'R': 0, 'G': 1, 'B': 2}
        ch = channel_map[channel]

        grad_x, grad_y = compute_gradient(data, x, y, width, height, channel)
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < width and 0 <= ny < height:
                    pixel_value = data[ny][nx][ch]
                    if (channel == 'R' and (ny % 2 == 0 and nx % 2 == 1)) or \
                       (channel == 'B' and (ny % 2 == 1 and nx % 2 == 0)) or \
                       (channel == 'G' and ((ny % 2 == 0 and nx % 2 == 0) or (ny % 2 == 1 and nx % 2 == 1))):
                        distance = max(abs(dx), abs(dy))
                        weight = 1 / (distance + 1 + grad_x + grad_y)
                        value += weight * pixel_value
                        weight_sum += weight

        return int(round(value / weight_sum)) if weight_sum > 0 else 0

    # Görüntüyü yükle
    width, height = image.size
    data = image.load()

    # Eğer Gauss filtresi kullanılacaksa, manuel Gauss filtresi uygula
    if use_gaussian:
        kernel = gaussian_kernel(radius, sigma)
        filtered_data = apply_gaussian_filter(data, width, height, kernel, radius)
    else:
        # Eğer Gauss filtresi kullanılmazsa, orijinal veriyi kullan
        filtered_data = [[data[y, x] for x in range(width)] for y in range(height)]

    interpolated_image = []

    for x in range(height):
        for y in range(width):
            pixel = [0, 0, 0]  # RGB
            if (x % 2 == 0) and (y % 2 == 0):  # Yeşil piksel
                pixel[1] = filtered_data[y][x][1]  # Yeşil kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            elif (x % 2 == 0) and (y % 2 == 1):  # Mavi piksel
                pixel[2] = filtered_data[y][x][2]  # Mavi kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[1] = compute_edge_interpolation(filtered_data, x, y, width, height, 'G')
            elif (x % 2 == 1) and (y % 2 == 0):  # Kırmızı piksel
                pixel[0] = filtered_data[y][x][0]  # Kırmızı kanal
                pixel[1] = compute_edge_interpolation(filtered_data, x, y, width, height, 'G')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            elif (x % 2 == 1) and (y % 2 == 1):  # Yeşil piksel
                pixel[1] = filtered_data[y][x][1]  # Yeşil kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            
            interpolated_image.append(tuple(pixel))
    
    new_image = Image.new("RGB", (width, height))
    new_image.putdata(interpolated_image)
    
    # Yeni görüntüyü kaydet
    filter_suffix = "gaussian" if use_gaussian else "no_filter"
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_5edge_directed_interpolation_bayer_{filter_suffix}.png")

def edge_directed_interpolation_bayer2(image, use_gaussian=False, radius=1, sigma=1.0):
    """
    Bayer filtresine sahip bir görüntü üzerinde kenar yönlendirmeli interpolasyon uygula 
    ve isteğe bağlı olarak manuel Gauss filtresi uygula.
    """

    def gaussian_kernel(radius, sigma=1.0):
        """Gauss çekirdeği oluştur."""
        kernel_size = 2 * radius + 1
        kernel = [[0] * kernel_size for _ in range(kernel_size)]
        sum_val = 0.0
        for x in range(-radius, radius + 1):
            for y in range(-radius, radius + 1):
                exponent = -(x ** 2 + y ** 2) / (2 * sigma ** 2)
                kernel[x + radius][y + radius] = math.exp(exponent) / (2 * math.pi * sigma ** 2)
                sum_val += kernel[x + radius][y + radius]
        
        # Çekirdeği normalize et
        for i in range(kernel_size):
            for j in range(kernel_size):
                kernel[i][j] /= sum_val
        
        return kernel

    def apply_gaussian_filter(image_data, width, height, kernel, radius):
        """Görüntüye Gauss filtresi uygula."""
        filtered_image = []
        for x in range(height):
            row = []
            for y in range(width):
                red, green, blue = 0.0, 0.0, 0.0
                for i in range(-radius, radius + 1):
                    for j in range(-radius, radius + 1):
                        xi, yj = x + i, y + j
                        if 0 <= xi < height and 0 <= yj < width:
                            weight = kernel[i + radius][j + radius]
                            pixel = image_data[yj, xi]
                            red += pixel[0] * weight
                            green += pixel[1] * weight
                            blue += pixel[2] * weight
                row.append((int(red), int(green), int(blue)))
            filtered_image.append(row)
        return filtered_image

    def compute_gradient(data, x, y, width, height, channel):
        """Belirtilen (x, y) konumundaki gradyanları hesaplar."""
        grad_x, grad_y = 0.0, 0.0
        channel_map = {'R': 0, 'G': 1, 'B': 2}
        ch = channel_map[channel]
        if 0 < x < width - 1 and 0 < y < height - 1:
            grad_x = abs(int(data[y][x + 1][ch]) - int(data[y][x - 1][ch]))
            grad_y = abs(int(data[y + 1][x][ch]) - int(data[y - 1][x][ch]))
        return grad_x, grad_y

    def compute_edge_interpolation(data, x, y, width, height, channel):
        """Bir kanal için belirtilen (x, y) konumunda kenar yönlendirmeli interpolasyon değeri hesapla."""
        value = 0.0
        weight_sum = 0.0
        channel_map = {'R': 0, 'G': 1, 'B': 2}
        ch = channel_map[channel]

        grad_x, grad_y = compute_gradient(data, x, y, width, height, channel)
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < width and 0 <= ny < height:
                    pixel_value = data[nx][ny][ch]
                    if (channel == 'R' and (ny % 2 == 0 and nx % 2 == 1)) or \
                       (channel == 'B' and (ny % 2 == 1 and nx % 2 == 0)) or \
                       (channel == 'G' and ((ny % 2 == 0 and nx % 2 == 0) or (ny % 2 == 1 and nx % 2 == 1))):
                        distance = max(abs(dx), abs(dy))
                        weight = 1 / (distance + 1 + grad_x + grad_y)
                        value += weight * pixel_value
                        weight_sum += weight

        return int(round(value / weight_sum)) if weight_sum > 0 else 0

    # Görüntüyü yükle
    width, height = image.size
    data = image.load()

    # Eğer Gauss filtresi kullanılacaksa, manuel Gauss filtresi uygula
    if use_gaussian:
        kernel = gaussian_kernel(radius, sigma)
        filtered_data = apply_gaussian_filter(data, width, height, kernel, radius)
    else:
        # Eğer Gauss filtresi kullanılmazsa, orijinal veriyi kullan
        filtered_data = [[data[x, y] for x in range(width)] for y in range(height)]

    interpolated_image = []

    for x in range(height):
        for y in range(width):
            pixel = [0, 0, 0]  # RGB
            if (x % 2 == 0) and (y % 2 == 0):  # Yeşil piksel
                pixel[1] = filtered_data[y][x][1]  # Yeşil kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            elif (x % 2 == 0) and (y % 2 == 1):  # Mavi piksel
                pixel[2] = filtered_data[y][x][2]  # Mavi kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[1] = compute_edge_interpolation(filtered_data, x, y, width, height, 'G')
            elif (x % 2 == 1) and (y % 2 == 0):  # Kırmızı piksel
                pixel[0] = filtered_data[y][x][0]  # Kırmızı kanal
                pixel[1] = compute_edge_interpolation(filtered_data, x, y, width, height, 'G')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            elif (x % 2 == 1) and (y % 2 == 1):  # Yeşil piksel
                pixel[1] = filtered_data[y][x][1]  # Yeşil kanal
                pixel[0] = compute_edge_interpolation(filtered_data, x, y, width, height, 'R')
                pixel[2] = compute_edge_interpolation(filtered_data, x, y, width, height, 'B')
            
            interpolated_image.append(tuple(pixel))
    
    new_image = Image.new("RGB", (width, height))
    new_image.putdata(interpolated_image)
    
    # Yeni görüntüyü kaydet
    filter_suffix = "gaussian" if use_gaussian else "no_filter"
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_5z-2edge_directed_interpolation_bayer_{filter_suffix}.png")


def adaptive_homogeneity_directed_AHD_interpolation(image):
    """
    Adaptive Homogeneity-Directed (AHD) interpolasyon algoritmasını uygular.
    Bayer filtreli bir görüntü üzerinde adaptif homojenlik bölgelerine yönlendirilmiş interpolasyon.
    """

    def bayer_to_grayscale(image):
        """Girdi olarak verilen Bayer filtreli görüntüyü gri tonlamaya dönüştürür."""
        return image.convert("L")  # Convert to grayscale for initial processing

    def compute_gradients(grayscale_image):
        """Gri tonlamalı görüntü üzerinden gradyanları hesaplar (dikey ve yatay)."""
        width, height = grayscale_image.size
        pixels = np.array(grayscale_image)

        # Sobel gradyan filtrelerini kullanarak yatay ve dikey gradyanları hesapla
        gx = np.zeros((height, width), dtype=np.float32)
        gy = np.zeros((height, width), dtype=np.float32)

        # Sobel operatörü
        sobel_x = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]])
        sobel_y = np.array([[-1, -2, -1], [0, 0, 0], [1, 2, 1]])

        for y in range(1, height - 1):
            for x in range(1, width - 1):
                gx[y, x] = np.sum(pixels[y-1:y+2, x-1:x+2] * sobel_x)
                gy[y, x] = np.sum(pixels[y-1:y+2, x-1:x+2] * sobel_y)
        
        return gx, gy

    def ahd_interpolation(data, gx, gy, width, height):
        """
        Adaptive Homogeneity-Directed (AHD) interpolasyonu uygular.
        Gradyan bilgisine göre yönlendirilmiş interpolasyon yapar.
        """
        new_data = []

        for y in range(height):
            for x in range(width):
                # Yatay ve dikey gradyanlara göre piksel interpolasyonu
                # Gradyanların mutlak değerlerini karşılaştır
                if abs(gx[y, x]) > abs(gy[y, x]):
                    # Yatay yönde interpolasyon
                    interpolated_pixel = data[y * width + max(0, x-1)]
                else:
                    # Dikey yönde interpolasyon
                    interpolated_pixel = data[max(0, y-1) * width + x]

                new_data.append(interpolated_pixel)
        
        return new_data

    # Görüntü boyutlarını al
    width, height = image.size
    data = list(image.getdata())  # Orijinal görüntü pikselleri

    # 1. Adım: Görüntüyü gri tonlamaya çevir
    grayscale_image = bayer_to_grayscale(image)

    # 2. Adım: Gradyanları hesapla (Sobel operatörleri)
    gx, gy = compute_gradients(grayscale_image)

    # 3. Adım: Adaptive Homogeneity-Directed interpolasyonu uygula
    new_data = ahd_interpolation(data, gx, gy, width, height)

    # 4. Adım: Yeni görüntüyü oluştur ve kaydet
    new_image = create_new_image(new_data, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_6adaptive_homogeneity_directed_AHD_interpolation_bayer.png")


def cross_channel_interpolation(image):
    """
    Cross channel interpolation ile her pikselin eksik olan renk kanallarını diğer kanallardan
    tahmin et. Bu özellikle Bayer filtresinden gelen görüntüler için uygundur.
    """
    def interpolate_missing_value(pixels, width, height, x, y, channel):
        """
        Eksik olan bir renk kanalını komşu piksellerden enterpole eder.
        Bu işlev performans, doğruluk ve güvenlik için optimize edilmiştir.
        """
        total = 0
        count = 0
        offsets = [-1, 0, 1]

        for dy in offsets:
            for dx in offsets:
                if dx == 0 and dy == 0:
                    continue  # Aynı pikseli tekrar kullanma
                nx, ny = x + dx, y + dy
                if 0 <= nx < width and 0 <= ny < height:
                    # Komşu pikselin RGB değerlerini al
                    neighbor_pixel = pixels[ny * width + nx]
                    if channel == "red":
                        total += neighbor_pixel[0]
                    elif channel == "green":
                        total += neighbor_pixel[1]
                    elif channel == "blue":
                        total += neighbor_pixel[2]
                    count += 1

        # Eksik kanal değeri komşu piksellerin ortalaması olarak belirlenir
        if count > 0:
            return total // count
        else:
            return 0  # Güvenliğe dikkat: Eğer komşu piksel yoksa varsayılan değer olarak 0 dön

    # Görüntünün genişliği ve yüksekliği
    width, height = image.size
    pixels = list(image.getdata())

    # Yeni görüntü verileri
    new_pixels = []

    for y in range(height):
        for x in range(width):
            # Geçerli pikselin RGB değerleri
            red, green, blue = pixels[y * width + x]

            # Pikseller arasında gezerek eksik renk değerlerini tahmin et
            # Eğer kırmızı kanal eksikse yeşil ve maviden enterpole et
            if red == 0:
                red = interpolate_missing_value(pixels, width, height, x, y, "red")
            
            # Eğer yeşil kanal eksikse kırmızı ve maviden enterpole et
            if green == 0:
                green = interpolate_missing_value(pixels, width, height, x, y, "green")
            
            # Eğer mavi kanal eksikse kırmızı ve yeşilden enterpole et
            if blue == 0:
                blue = interpolate_missing_value(pixels, width, height, x, y, "blue")

            # Yeni pikselleri oluştur
            new_pixels.append((red, green, blue))

    # Yeni resmi kaydet
    new_image = create_new_image(new_pixels, width, height)
    new_image.save(f"{int(os.path.basename(__file__)[0]) + 1}_7cross_channel_interpolation_bayer.png")


def gradient_based_interpolation(image):
    pass

def Lanczos():
    pass

"""
def run():
    # script olarak çalıştırılmadığı durumları da ele almak için
    if __name__ == "__main__":
        print("Script doğrudan çalıştırıldı.")
    else:
        print("Script modül olarak içe aktarıldı.")
    
    print(f"File name: {__file__}")
"""

orijinal_image = Image.open("5_75x75.png")
image = orijinal_image.copy()
orijinal_image.close()

my_first_opinion(image)
my_second_opinion(image)
nearest_neighbor_interpolation_bayer(image)
bilinear_interpolasyon_bayer(image)
# Gauss filtresi olmadan
edge_directed_interpolation_bayer(image, use_gaussian=False)
# Gauss filtresi ile
edge_directed_interpolation_bayer(image, use_gaussian=True)
# Gauss filtresi olmadan
edge_directed_interpolation_bayer2(image, use_gaussian=False)
# Gauss filtresi ile
edge_directed_interpolation_bayer2(image, use_gaussian=True)
adaptive_homogeneity_directed_AHD_interpolation(image)
cross_channel_interpolation(image)

"""
a = 2**8
print(a-1)
print(a-1>>1)
print((a-1)>>1)
print((a-1)//2)
"""

#print([x for x in range(5) for y in range(0, -5, -1) ])


"""
Bayer filtresi, dijital görüntüleme cihazlarında sıkça kullanılan bir renk filtresi dizisidir. Bir görüntü sensörü üzerindeki her piksel yalnızca bir renge (kırmızı, yeşil veya mavi) duyarlıdır, bu nedenle tam renkli bir görüntü oluşturmak için eksik renk bilgileri hesaplanmalıdır. Bu sürece demosaicing denir. Demosaicing algoritmaları, eksik renk kanallarını tahmin etmek ve tam bir RGB görüntüsü oluşturmak için kullanılır. Aşağıda Bayer filtresi için kullanılan bazı yaygın demosaicing algoritmalarını açıklayacağım:
1. Nearest Neighbor Interpolation (En Yakın Komşu Enterpolasyonu)

Bu yöntem, eksik renk bileşenini komşu piksellerden basitçe kopyalayarak tahmin eder. Örneğin, kırmızı kanalı eksik olan bir pikselin kırmızı değeri, en yakın kırmızı piksellerden alınır. Bu yöntem oldukça basit ve hızlıdır, ancak renk kenarlarında pürüzlü geçişler ve moiré desenleri oluşmasına neden olabilir.
2. Bilinear Interpolation (Çift Doğrusal Enterpolasyon)

Bu algoritma, eksik renk değerlerini hem yatay hem de dikey yöndeki komşu piksellerin ortalamasını alarak tahmin eder. Her renk kanalı için çevredeki piksel değerleri kullanılarak bir ağırlıklı ortalama hesaplanır. Nearest Neighbor algoritmasından daha yüksek kalite sunar, ancak renk geçişlerinde hala bulanıklık ve artefaktlar oluşabilir.
3. Malvar-He-Cutler Algoritması

Bu yöntem, kenar tespiti ve kenar yönlendirmeli enterpolasyon kullanarak demosaicing yapar. Kenar bölgelerinde moiré ve renk bozulmalarını azaltarak daha iyi sonuçlar elde edilebilir. Kenar algılama işlemi, komşu piksellerin parlaklık farklarına dayalıdır.
4. Adaptive Homogeneity-Directed (AHD)

Bu algoritma, renk geçişlerinin daha hassas bir şekilde hesaplanması amacıyla adaptif homojenlik kullanır. Pikselin çevresindeki renk bilgisi analiz edilerek, eksik renk kanalı, kenarlardaki bozulmayı azaltacak şekilde tahmin edilir. Kenarların korunmasını sağlar ve özellikle moiré desenleri gibi sorunları minimize eder.
5. Directional Filtering (Yönlendirilmiş Filtreleme)

Bu algoritma, bir pikselle ilgili eksik renk bilgilerini yatay, dikey ve çapraz komşu piksellerden alır. Hangi yönün en uygun olduğuna karar verilir ve bu yönde bir enterpolasyon yapılır. Kenar bölgelerinde daha iyi sonuçlar elde edilir.
6. Frequency Domain Approaches (Frekans Alanı Yaklaşımları)

Bu yöntem, Fourier dönüşümü gibi frekans alanı tekniklerini kullanarak demosaicing yapar. Eksik renk bilgileri, yüksek ve düşük frekans bileşenlerine dayalı olarak hesaplanır. Bu yöntemler özellikle tekrarlayan desenler içeren görüntülerde daha iyi performans gösterebilir.
7. Gradient-Based Algorithms (Gradyan Tabanlı Algoritmalar)

Gradyan tabanlı demosaicing algoritmaları, görüntüdeki yoğunluk gradyanlarına göre eksik renk kanallarını tahmin eder. Bu sayede kenarlarda ve detaylı alanlarda daha iyi sonuçlar elde edilir. Kenarlardaki renk bozulmalarını azaltmada oldukça etkilidirler.
8. Deep Learning Tabanlı Algoritmalar

Son yıllarda, demosaicing için derin öğrenme yöntemleri de kullanılmaya başlanmıştır. Sinir ağları, geniş bir eğitim verisi üzerinde eğitilerek eksik renk bilgilerini daha doğru bir şekilde tahmin edebilirler. Bu algoritmalar genellikle geleneksel yöntemlerden daha karmaşık ama daha yüksek doğruluk sunarlar.
"""