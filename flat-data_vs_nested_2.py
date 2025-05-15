import time
import random

width = 5_000
height = 5_000
flat_data = [(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)) for _ in range(width * height)]
nested_data = [flat_data[i * width:(i + 1) * width] for i in range(height)]

def test_flat():
    total = 0
    for i in range(height):
        for j in range(width):
            total += flat_data[i * width + j][0]
    return total

def test_nested():
    total = 0
    for i in range(height):
        for j in range(width):
            total += nested_data[i][j][0]
    return total

start = time.time()
flat_sum = test_flat()
end = time.time()
print("Flat erişim süresi:", end - start, "saniye")

start = time.time()
nested_sum = test_nested()
end = time.time()
print("Nested erişim süresi:", end - start, "saniye")
