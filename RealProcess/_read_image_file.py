def read_bmp_image(file_path):
    with open(file_path, 'rb') as f:
        # BMP dosyasının başlık kısmını okuyalım
        f.seek(10)
        pixel_data_offset = int.from_bytes(f.read(4), 'little')

        # Görüntü genişliğini ve yüksekliğini okuyalım
        f.seek(18)
        width = int.from_bytes(f.read(4), 'little')
        height = int.from_bytes(f.read(4), 'little')

        # BMP dosyasının başlık kısmını atlayıp piksel verisine ulaşalım
        f.seek(pixel_data_offset)

        # BMP formatında, her pikselin 3 baytı (RGB) vardır
        image_data = []
        row_size = (3 * width + 3) // 4 * 4  # BMP satırları 4 bayt hizalanmış olur

        for y in range(height):
            row = []
            for x in range(width):
                # RGB baytlarını oku
                blue = int.from_bytes(f.read(1), 'little')
                green = int.from_bytes(f.read(1), 'little')
                red = int.from_bytes(f.read(1), 'little')
                row.append((red, green, blue))
            image_data.insert(0, row)  # BMP dosyası, alt satırdan başlar
            f.seek(pixel_data_offset + (y + 1) * row_size)

    return image_data

# Örnek kullanım
image_data = read_bmp_image('example.bmp')


import struct

def read_jpeg_image(file_path):
    with open(file_path, 'rb') as f:
        # İlk iki baytı kontrol edelim (JPEG dosyaları SOI marker ile başlar: 0xFFD8)
        if f.read(2) != b'\xff\xd8':
            raise ValueError("Bu bir JPEG dosyası değil!")
        
        # JPEG segmentleri FF ile başlar, segment tipi ve uzunluk içerir
        while True:
            marker, = struct.unpack('B', f.read(1))
            if marker != 0xFF:
                break
            
            segment_type, = struct.unpack('B', f.read(1))
            if segment_type == 0xDA:  # Start of Scan (pikseller burada başlar)
                break
            
            segment_length, = struct.unpack('>H', f.read(2))  # Segmentin uzunluğu
            f.seek(segment_length - 2, 1)  # Segmentin geri kalanını atla

        # Burada DCT ve Huffman kod çözme işlemi gerçekleşmelidir (çok karmaşık)
        print("JPEG pikselleri burada başlıyor ama çözümleme oldukça karmaşıktır.")

def read_png_image(file_path):
    with open(file_path, 'rb') as f:
        # İlk 8 baytı kontrol edelim (PNG dosyaları belirli bir imza ile başlar: 0x89504E470D0A1A0A)
        if f.read(8) != b'\x89PNG\r\n\x1a\n':
            raise ValueError("Bu bir PNG dosyası değil!")
        
        # PNG chunklarını okuyalım
        while True:
            chunk_length = struct.unpack('>I', f.read(4))[0]
            chunk_type = f.read(4)
            chunk_data = f.read(chunk_length)
            crc = f.read(4)  # CRC atla
            
            if chunk_type == b'IHDR':  # Başlık chunk'ı
                width = struct.unpack('>I', chunk_data[:4])[0]
                height = struct.unpack('>I', chunk_data[4:8])[0]
                print(f"PNG genişliği: {width}, yüksekliği: {height}")
            
            elif chunk_type == b'IDAT':  # Piksel verisi chunk'ı
                print("PNG pikselleri burada başlıyor ama çözümleme çok karmaşıktır.")
            
            elif chunk_type == b'IEND':  # Son chunk
                break

# Örnek JPEG ve PNG dosyalarının başlıklarını okuma
read_jpeg_image('example.jpg')
read_png_image('example.png')
