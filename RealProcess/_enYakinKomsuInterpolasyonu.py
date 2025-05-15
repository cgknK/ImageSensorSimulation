from PIL import Image
import os

def resize_image(image, target_width, target_height):
    """
    Görüntüyü hedef boyutlara yeniden boyutlandırma işlemi.
    """
    def get_image_data(image):
        """Görüntüden piksel verilerini al ve boyutlarını döndür."""
        width, height = image.size
        image_data = list(image.getdata())
        return image_data, width, height

    def calculate_average_color(image_data, width, height, target_width, target_height, block_width, block_height):
        """Blok boyutuna göre piksel renk ortalamasını hesaplar (küçültme için)."""
        assert False, "calculate_average_color run"
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

        return new_data

    def nearest_neighbor_interpolation(image_data, width, height, target_width, target_height):
        index_list = []
        """En yakın komşu interpolasyonu ile piksel hesaplaması yapar (büyütme için)."""
        print(f"nearest_neighbor_interpolation(image_data, width:{width}, "
            f"height:{height}, target_width:{target_width}, target_height:{target_height}):")
        new_data = []
        x_ratio = width / target_width
        y_ratio = height / target_height
        #x_ratio = (width - 1) / (target_width - 1) if target_width > 1 else 0
        #y_ratio = (height - 1) / (target_height - 1) if target_height > 1 else 0
        print("ratio:", x_ratio, y_ratio)

        print("idx,  y*width,  y,    width,    x,\t\ty,\t\tj,\t\ti\t\tTargerIndex")
        for i in range(target_height):
            for j in range(target_width):
                x = int(j * x_ratio)
                y = int(i * y_ratio)
                if x < width and y < height:
                    idx = y * width + x
                    print(idx, y * width, y, width, x, y, j, i, len(new_data), sep="\t\t")
                    #print(image_data[idx], len(new_data))
                    new_data.append(image_data[idx])
                    index_list.append(idx)
                else:
                    print("else")

        return new_data, index_list

    def create_new_image(new_data, new_width, new_height):
        """Yeni boyutlara sahip yeni bir görüntü oluştur ve verileri yerleştir."""
        new_image = Image.new("RGB", (new_width, new_height))
        new_image.putdata(new_data)
        return new_image

    def process_image(image, target_width, target_height):
        """Görüntüyü işleyen fonksiyon."""
        image_data, width, height = get_image_data(image)

        if target_width < width and target_height < height:
            # Küçültme işlemi için blok boyutlarını hedef boyutlara göre ayarla
            block_width = width / target_width
            block_height = height / target_height
            new_data = calculate_average_color(image_data, width, height, target_width, target_height, block_width, block_height)
        else:
            # Büyütme işlemi için en yakın komşu interpolasyonu kullan
            new_data, index_list = nearest_neighbor_interpolation(image_data, width, height, target_width, target_height)

        new_image = create_new_image(new_data, target_width, target_height)
        return new_image, index_list

    resized_image, index_list = process_image(image, target_width, target_height)
    resized_image.save('_enYakinKomsuInterpolasyonu.jpg')
    return index_list

# Kullanım:
image = Image.open("0_3x3.jpg")
index_list = resize_image(image, 4, 4)  # Hem büyütme hem de küçültme işlemi yapar
print(index_list)
for i in range(4):
    for j in range(4):
        print(index_list[i*4+j], end="\t")
    print()
print("-"*10)
_3x3 = [x for x in range(9)]
for i in range(3):
    for j in range(3):
        print(_3x3[i*3+j], end="\t")
    print()