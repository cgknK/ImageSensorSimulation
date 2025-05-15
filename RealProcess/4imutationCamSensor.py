from PIL import Image

def cam_sensor(image, reduce_bit_depth):
    def get_bit_depth(image):
        mode = image.mode

        # Mod bilgisine göre bit derinliğini belirle
        bit_depth = {
            "1": 1,  # 1-bit pixels, black and white
            "L": 8,  # 8-bit pixels, grayscale
            "P": 8,  # 8-bit pixels, mapped to any other mode using a color palette
            "RGB": 24,  # 3x8-bit pixels, true color
            "RGBA": 32,  # 4x8-bit pixels, true color with transparency mask
            "CMYK": 32,  # 4x8-bit pixels, color separation
            "YCbCr": 24,  # 3x8-bit pixels, color video format
            "LAB": 24,  # 3x8-bit pixels, the L*a*b color space
            "HSV": 24,  # 3x8-bit pixels, Hue, Saturation, Value color space
            "I": 32,  # 32-bit signed integer pixels
            "F": 32  # 32-bit floating point pixels
        }.get(mode, "Unknown")

        return bit_depth//3


    bit_depth = get_bit_depth(image)
    print(bit_depth)
    if bit_depth > 6:
        shift = 2
    shift = reduce_bit_depth

    data = list(image.getdata())
    width, height = image.size

    new_data = []
    for i in range(height):
        for j in range(width):
            idx = i * width + j

            if i % 2 == 0:
                if j % 2 == 0:
                    new_data.append((0, data[idx][1] << shift, 0))
                else:
                    new_data.append((0, 0, data[idx][2] << shift))
            else:
                if j % 2 == 0:
                    new_data.append((data[idx][0] << shift, 0, 0))
                else:
                    new_data.append((0, data[idx][1] << shift, 0))

    new_width, new_height = width, height
    new_image = Image.new("RGB", (new_width, new_height))
    new_image.putdata(new_data)
    new_image.show()
    new_image.save(f"5_{width}x{height}.png")


orijin_image = Image.open("4_1NEAREST.jpg")
image = orijin_image.copy()
orijin_image.close()

reduce_bit_depth = 0 # 2 bit düşürür, 0 değiştirme demek
output_cam_sensor = cam_sensor(image, reduce_bit_depth)
