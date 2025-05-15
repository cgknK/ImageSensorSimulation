import time
import random

# Görüntü boyutu
width = 1000
height = 1000

# Sahte flat veri üretimi (tek boyutlu liste)
flat_data = [(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)) for _ in range(width * height)]

# İç içe listeye dönüştür (nested)
nested_data = [flat_data[i * width:(i + 1) * width] for i in range(height)]

# Erişim sayısı
N = 100_000_000

# Flat erişim süresi
start_time = time.time()
for i in range(height):
    for j in range(width):
        _ = flat_data[i * width + j]
end_time = time.time()
print("Flat erişim süresi:", end_time - start_time, "saniye")

# Nested erişim süresi
start_time = time.time()
for i in range(height):
    for j in range(width):
        _ = nested_data[i][j]
end_time = time.time()
print("Nested erişim süresi:", end_time - start_time, "saniye")
