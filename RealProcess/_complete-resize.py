import logging
# Logger oluşturma ve yapılandırma
logging.basicConfig(level=logging.DEBUG, format='%(message)s')
logger = logging.getLogger(__name__)
logger.setLevel(logging.CRITICAL + 1)  # Bu ayar tüm loglamayı kapatır.
logger.setLevel(logging.DEBUG)

from PIL import Image

def resize_image(image, target_width, target_height):
    """
    Görüntüyü hedef boyutlara yeniden boyutlandırma işlemi.
    """

    def get_image_data(image):
        """Görüntüden piksel verilerini al ve boyutlarını döndür."""
        width, height = image.size
        image_data = list(image.getdata())
        return image_data, width, height

    def calculate_resized_image(image_data, width, height, target_width, target_height):
        """Hem büyütme hem de küçültme işlemleri için piksel verilerini hesaplar."""
        logger.debug(
            f"def calculate_resized_image(image_data, width:{width}, height:{height}, "
            f"target_width:{target_width}, target_height:{target_height}):"
            )

        new_data = []
        x_ratio = width / target_width
        y_ratio = height / target_height

        logger.debug(f"x_ratio:{x_ratio} = width:{width} / target_width:{target_width}")
        logger.debug(f"y_ratio:{y_ratio} = height:{height} / target_height:{target_height}")

        for i in range(target_height):
            indent = "    "
            indent_level = 0
            for j in range(target_width):
                # Blokların başlangıç ve bitiş indekslerini hesapla
                x_start = int(j * x_ratio)
                y_start = int(i * y_ratio)
                x_end = int((j + 1) * x_ratio)
                y_end = int((i + 1) * y_ratio)

                indent_level = 1
                logger.debug(f"{indent*indent_level}x_start:{x_start} = int(j:{j} * x_ratio:{x_ratio})")
                logger.debug(f"{indent*indent_level}y_start:{y_start} = int(i:{j} * y_ratio:{y_ratio})")
                logger.debug(f"{indent*indent_level}x_end:{x_end} = int((j+1):{j+1} * x_ratio:{x_ratio})")
                logger.debug(f"{indent*indent_level}y_end:{y_end} = int((i+1):{i+1} * y_ratio:{y_ratio})")

                # Renklerin toplamını ve piksel sayısını hesapla
                r_sum, g_sum, b_sum = 0, 0, 0
                count = 0

                for y in range(y_start, y_end):
                    for x in range(x_start, x_end):
                        if x < width and y < height: # Bu kontrol gereksiz duruyor. Test edilmeli.
                            idx = y * width + x

                            indent_level = 2
                            logger.debug(
                                f"{indent*indent_level}"
                                f"idx:{idx} = y:{y}*width:{width} + x:{x}"
                                f" - x:{x}, y:{y}, j:{j}, i:{i}"
                                )

                            r, g, b = image_data[idx]
                            r_sum += r
                            g_sum += g
                            b_sum += b
                            count += 1
                        else:
                            logger.debug(f"...else...: x:{x}, y:{y}, j:{j}, i:{i}")

                logger.debug(f"count:{count}")
                # Eğer hiç piksel yoksa mevcut konumu doldur
                if count == 0:
                    new_data.append((0, 0, 0))
                    logger.debug(
                        f"new_data.apppend((0, 0, 0))"
                        f" -> new_data[-1:]:{new_data[-1:]}, {len(new_data)-1}"
                        )
                else:
                    # Ortalama rengi hesapla
                    new_data.append((r_sum // count, g_sum // count, b_sum // count))
                    logger.debug(f" -> new_data[-1:]:{new_data[-1:]}, {len(new_data)-1}")

        logger.debug(f"len(new_data):{len(new_data)}")

        return new_data

    def create_new_image(new_data, new_width, new_height):
        """Yeni boyutlara sahip yeni bir görüntü oluştur ve verileri yerleştir."""
        new_image = Image.new("RGB", (new_width, new_height))
        new_image.putdata(new_data)
        return new_image

    def process_image(image, target_width, target_height):
        """Görüntüyü işleyen ve yeniden boyutlandıran ana fonksiyon."""
        image_data, width, height = get_image_data(image)

        # Piksel verilerini yeniden boyutlandır
        new_data = calculate_resized_image(image_data, width, height, target_width, target_height)

        # Yeni görüntüyü oluştur
        new_image = create_new_image(new_data, target_width, target_height)
        return new_image

    resized_image = process_image(image, target_width, target_height)
    resized_image.save('_complete-resize.jpg')

# Kullanım:
image = Image.open("0_3x3.jpg")
resize_image(image, 3, 3)  # Büyütme işlemi
print()
print("NEXT")
print()
image = Image.open('_complete-resize.jpg')
resize_image(image, 2, 2)   # Küçültme işlemi
