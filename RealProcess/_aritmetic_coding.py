class ArithmeticCoding:
    def __init__(self, symbols, probabilities):
        self.symbols = symbols
        self.probabilities = probabilities
        self.cumulative_probabilities = self._calculate_cumulative_probabilities()

    def _calculate_cumulative_probabilities(self):
        cumulative_probabilities = {}
        cumulative = 0.0
        for symbol, probability in zip(self.symbols, self.probabilities):
            cumulative_probabilities[symbol] = (cumulative, cumulative + probability)
            cumulative += probability
        return cumulative_probabilities

    def encode(self, data):
        low = 0.0
        high = 1.0
        for symbol in data:
            range_ = high - low
            high = low + range_ * self.cumulative_probabilities[symbol][1]
            low = low + range_ * self.cumulative_probabilities[symbol][0]
        return (low + high) / 2

    def decode(self, encoded_value, length):
        decoded_data = []
        for _ in range(length):
            for symbol, (low, high) in self.cumulative_probabilities.items():
                if low <= encoded_value < high:
                    decoded_data.append(symbol)
                    encoded_value = (encoded_value - low) / (high - low)
                    break
        return ''.join(decoded_data)

# Örnek semboller ve olasılıklar
symbols = ['A', 'B', 'C', 'D']
probabilities = [0.1, 0.2, 0.4, 0.3]

# Aritmetik Kodlama nesnesi oluştur
arithmetic_coding = ArithmeticCoding(symbols, probabilities)

# Kodlanacak veri
data = "ABCD"

# Veriyi kodla
encoded_value = arithmetic_coding.encode(data)
print("Kodlanmış Değer:", encoded_value)

# Veriyi çöz
decoded_data = arithmetic_coding.decode(encoded_value, len(data))
print("Çözümlenmiş Veri:", decoded_data)



#############



def arithmetic_encoding(data, probabilities):
    # Başlangıç aralığı [0.0, 1.0)
    low, high = 0.0, 1.0
    
    for symbol in data:
        # Sembolün olasılık aralığını al
        range_size = high - low
        high = low + range_size * probabilities[symbol][1]  # Üst sınır
        low = low + range_size * probabilities[symbol][0]   # Alt sınır
        
    # Kodlanan sayı, son aralığın ortası olabilir
    return (low + high) / 2

def arithmetic_decoding(encoded_value, probabilities, data_length):
    decoded_message = []
    low, high = 0.0, 1.0
    
    for _ in range(data_length):
        range_size = high - low
        value_range = (encoded_value - low) / range_size
        
        # Sembolü bul
        for symbol, (symbol_low, symbol_high) in probabilities.items():
            if symbol_low <= value_range < symbol_high:
                decoded_message.append(symbol)
                high = low + range_size * symbol_high
                low = low + range_size * symbol_low
                break

    return ''.join(decoded_message)

# Olasılıklar: {sembol: (alt aralık, üst aralık)}
probabilities = {
    'A': (0.0, 0.2),
    'B': (0.2, 0.5),
    'C': (0.5, 0.7),
    'D': (0.7, 1.0)
}

# Kodlanacak veri
data = "ABCD"

# Aritmetik kodlama
encoded_value = arithmetic_encoding(data, probabilities)
print(f"Kodlanan değer: {encoded_value}")

# Kod çözme (Verinin uzunluğunu biliyoruz: len(data))
decoded_message = arithmetic_decoding(encoded_value, probabilities, len(data))
print(f"Çözülen mesaj: {decoded_message}")



print()#############


import math

def arithmetic_encoding(data, probabilities):
    # Başlangıç aralığı [0.0, 1.0)
    low, high = 0.0, 1.0
    
    for symbol in data:
        # Sembolün olasılık aralığını al
        range_size = high - low
        high = low + range_size * probabilities[symbol][1]  # Üst sınır
        low = low + range_size * probabilities[symbol][0]   # Alt sınır
        
    # Kodlanan sayı, son aralığın ortası olabilir
    return (low + high) / 2, high - low  # Aralığın genişliği ile geri dön

def arithmetic_decoding(encoded_value, probabilities, data_length):
    decoded_message = []
    low, high = 0.0, 1.0
    
    for _ in range(data_length):
        range_size = high - low
        value_range = (encoded_value - low) / range_size
        
        # Sembolü bul
        for symbol, (symbol_low, symbol_high) in probabilities.items():
            if symbol_low <= value_range < symbol_high:
                decoded_message.append(symbol)
                high = low + range_size * symbol_high
                low = low + range_size * symbol_low
                break

    return ''.join(decoded_message)

def calculate_compression_metrics(data, probabilities, encoded_value, encoded_range):
    # Orijinal veri boyutu
    num_symbols = len(probabilities)  # Örneğin 4 sembol (A, B, C, D)
    bits_per_symbol = math.ceil(math.log2(num_symbols))  # log2(4) = 2 bit
    original_bits = len(data) * bits_per_symbol  # Orijinal veri boyutu (bit)

    # Kodlanan değerin gerekli bit boyutu
    # encoded_range aralığı kadar bir kesir kodlanacak, bunun kaç bitle ifade edileceğini buluruz
    encoded_bits = -math.log2(encoded_range)

    # Sıkıştırma oranı ve alan kazancı
    compression_ratio = original_bits / encoded_bits
    space_saving = original_bits - encoded_bits

    return original_bits, encoded_bits, compression_ratio, space_saving

# Olasılıklar: {sembol: (alt aralık, üst aralık)}
probabilities = {
    'A': (0.0, 0.2),
    'B': (0.2, 0.5),
    'C': (0.5, 0.7),
    'D': (0.7, 1.0)
}

# Kodlanacak veri
data = "ABCD"

# Aritmetik kodlama
encoded_value, encoded_range = arithmetic_encoding(data, probabilities)
print(f"Kodlanan değer: {encoded_value}")

# Kod çözme (Verinin uzunluğunu biliyoruz: len(data))
decoded_message = arithmetic_decoding(encoded_value, probabilities, len(data))
print(f"Çözülen mesaj: {decoded_message}")

# Sıkıştırma oranı ve alan kazancı
original_bits, encoded_bits, compression_ratio, space_saving = calculate_compression_metrics(data, probabilities, encoded_value, encoded_range)
print(f"Orijinal veri boyutu (bit): {original_bits}")
print(f"Kodlanan veri boyutu (bit): {encoded_bits:.2f}")
print(f"Sıkıştırma oranı: {compression_ratio:.2f}")
print(f"Alan kazancı (bit): {space_saving:.2f}")
