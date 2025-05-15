def resize_liste(liste, target_width, target_height):

    def calculate_resized_image(liste, width, height, target_width, target_height):

        new_data = []
        x_ratio = width / target_width
        y_ratio = height / target_height

        for i in range(target_height):
            for j in range(target_width):
                # Blokların başlangıç ve bitiş indekslerini hesapla
                x_start = int(j * x_ratio)
                y_start = int(i * y_ratio)
                x_end = int((j + 1) * x_ratio)
                y_end = int((i + 1) * y_ratio)

                # Renklerin toplamını ve piksel sayısını hesapla
                acc = 0
                count = 0

                for y in range(y_start, y_end):
                    for x in range(x_start, x_end):
                        if x < width and y < height: # Bu kontrol gereksiz duruyor. Test edilmeli.
                            idx = y * width + x

                            value = liste[idx]
                            acc += value
                            count += 1
                        else:
                            print(f"...else...: x:{x}, y:{y}, j:{j}, i:{i}")

                # Eğer hiç piksel yoksa mevcut konumu doldur
                if count == 0:
                    new_data.append(-1)
                else:
                    # Ortalama rengi hesapla
                    new_data.append((acc // count))

        return new_data

    def process_liste(liste, target_width, target_height):
        """Görüntüyü işleyen ve yeniden boyutlandıran ana fonksiyon."""
        image_data, width, height = liste[:], 3, 3

        # Piksel verilerini yeniden boyutlandır
        new_data = calculate_resized_image(image_data, width, height, target_width, target_height)

        return new_data

    resized_liste = process_liste(liste, target_width, target_height)
    return resized_liste

# Kullanım:
liste = [x for x in range(9)]
resize_1 = resize_liste(liste[:], 5, 5)  # Büyütme işlemi
resize_2 = resize_liste(liste[:], 3, 3)   # Küçültme işlemi
print(liste)
print(resize_1)
print(resize_2)
print([-x if x < 10 else x%10*-1 for x in range(25)])