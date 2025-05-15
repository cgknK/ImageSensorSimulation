import cv2
import numpy as np

# 1. Renkli görüntüyü yükle
color_image = cv2.imread('0.jpg')

# 2. Renkli görüntüyü gri tonluya dönüştür
image = cv2.cvtColor(color_image, cv2.COLOR_BGR2GRAY)

# 3. Kenar tespiti (Canny yöntemi ile)
edges = cv2.Canny(image, threshold1=100, threshold2=200)

# 4. Kenarları işleyerek, sadece kenar bölgelerini belirle
processed_image = np.zeros_like(image)

# 5. Yalnızca kenar bölgelerinde işlem yap (örneğin, kenarları parlatalım)
processed_image[edges != 0] = image[edges != 0] * 2  # Kenarları iki kat parlak yap

# 6. Sonucu göster
cv2.imshow('Original Image', color_image)
cv2.imshow('Processed Image (Only Edges)', processed_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
