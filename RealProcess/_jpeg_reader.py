import struct
from typing import List, Tuple

class JpegReader:
    def __init__(self, file_path: str):
        self.file_path = file_path
        self.data = None
        self.width = None
        self.height = None
        self.components = None

    def open(self):
        """JPEG dosyasını aç ve başlık bilgilerini oku."""
        try:
            with open(self.file_path, 'rb') as f:
                self._parse_file(f)
        except FileNotFoundError:
            raise FileNotFoundError(f"File {self.file_path} not found.")
        except IOError:
            raise IOError("An error occurred while reading the file.")

    def _parse_file(self, f):
        """JPEG dosyasını çözümle."""
        # JPEG dosyası SOI (Start of Image) marker ile başlar.
        soi_marker = f.read(2)
        if soi_marker != b'\xff\xd8':
            raise ValueError("Invalid JPEG file: Missing SOI marker.")
        
        while True:
            marker, length = self._read_marker(f)
            if marker == b'\xff\xc0':  # SOF0 marker (Start of Frame)
                self._parse_sof(f, length)
            elif marker == b'\xff\xda':  # SOS marker (Start of Scan)
                self._parse_sos(f)
                break
            else:
                # Diğer blokları atla.
                f.seek(length - 2, 1)

    def _read_marker(self, f) -> Tuple[bytes, int]:
        """Bir JPEG marker bloğunu oku."""
        while True:
            byte = f.read(1)
            if byte == b'\xff':
                marker = f.read(1)
                if marker != b'\x00':  # Stuffed byte, ignore
                    length = struct.unpack(">H", f.read(2))[0]
                    return b'\xff' + marker, length

    def _parse_sof(self, f, length: int):
        """SOF (Start of Frame) bloğunu işle."""
        data = f.read(length - 2)
        precision, self.height, self.width, components = struct.unpack(">BHHB", data[:6])
        self.components = []
        offset = 6
        for _ in range(components):
            component_id, sampling_factors, quant_table = struct.unpack(">BBB", data[offset:offset + 3])
            self.components.append({
                'component_id': component_id,
                'sampling_factors': sampling_factors,
                'quant_table': quant_table
            })
            offset += 3

    def _parse_sos(self, f):
        """SOS (Start of Scan) bloğunu işle ve sıkıştırılmış verileri al."""
        # Veri sıkıştırılmış olduğundan basitçe veriyi okuyacağız.
        # Ancak demosaicing ve dekompresyon işlemi yerleşik modüllerle desteklenmediğinden
        # basit okuma yapıyoruz.
        self.data = f.read()

    def getdata(self) -> List[Tuple[int, int, int]]:
        """Görüntü verilerini döndür (Bu kısım demosaicing yapmadan raw veriyi temsil eder)."""
        if self.data is None:
            raise RuntimeError("No image data found. Did you open the file?")
        
        # Geri kalan kısım veri işleme algoritması olurdu (DCT çözümleme vb.)
        # Burada henüz raw formatta veriyi alıp işlenmemiş olarak döndürmekteyiz.
        return list(self.data)

    def get_dimensions(self) -> Tuple[int, int]:
        """Görüntünün genişliğini ve yüksekliğini döndür."""
        if self.width is None or self.height is None:
            raise RuntimeError("Image dimensions not found.")
        return self.width, self.height


# Kullanım örneği
if __name__ == "__main__":
    jpeg_reader = JpegReader("example.jpg")
    jpeg_reader.open()
    width, height = jpeg_reader.get_dimensions()
    print(f"Görüntü Boyutu: {width}x{height}")
    image_data = jpeg_reader.getdata()
    print(f"Görüntü verisi uzunluğu: {len(image_data)} byte")
