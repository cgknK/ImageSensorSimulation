import os
from PIL import Image

def crop_center(image_path, output_path, target_width, target_height):
    # Görüntüyü aç
    image = Image.open(image_path)

    # Görüntünün genişlik ve yüksekliğini al
    width, height = image.size
    print(image.size)

    # Merkeze odaklanarak kırpma sınırlarının hesaplanması
    left = (width - target_width) / 2
    print("left", left)
    top = (height - target_height) / 2
    print("top", top)
    right = (width + target_width) / 2
    print("right", right)
    bottom = (height + target_height) / 2
    print("bottom", bottom)

    # Kırpma işlemi
    cropped_image = image.crop((left, top, right, bottom))

    # Sonucu kaydetme
    cropped_image.save(output_path)

    # Kırpılmış görüntüyü gösterme (isteğe bağlı)
    cropped_image.show()

# Parametrik kullanımı
crop_center('0.jpg', f'{int(os.path.basename(__file__)[0]) + 1}.jpg', 300, 300)
