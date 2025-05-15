from typing import Dict, Tuple, List

class HuffmanNode:
    def __init__(self, symbol: str = None, freq: int = 0, left=None, right=None):
        self.symbol = symbol
        self.freq = freq
        self.left = left
        self.right = right
    
    def is_leaf(self) -> bool:
        return self.left is None and self.right is None

def calculate_frequencies(data: str) -> Dict[str, int]:
    frequencies = {}
    for char in data:
        if char in frequencies:
            frequencies[char] += 1
        else:
            frequencies[char] = 1
    return frequencies

def build_huffman_tree(frequencies: Dict[str, int]) -> HuffmanNode:
    # Frekanslara göre Huffman ağacını oluşturma
    nodes = [HuffmanNode(symbol, freq) for symbol, freq in frequencies.items()]
    
    while len(nodes) > 1:
        # Frekansa göre sıralama (Küçükten büyüğe)
        nodes.sort(key=lambda x: x.freq)

        # En düşük frekanslı iki düğümü al
        left = nodes.pop(0)
        right = nodes.pop(0)

        # Yeni bir iç düğüm oluştur, frekansı iki düğümün toplamı
        new_node = HuffmanNode(freq=left.freq + right.freq, left=left, right=right)

        # Yeni düğümü listeye ekle
        nodes.append(new_node)
    
    return nodes[0]

def build_codes(node: HuffmanNode, prefix: str = '', codebook: Dict[str, str] = None) -> Dict[str, str]:
    if codebook is None:
        codebook = {}
    
    if node.is_leaf():
        codebook[node.symbol] = prefix or '0'  # Tek bir sembol olduğunda '0' verilir
    else:
        if node.left:
            build_codes(node.left, prefix + '0', codebook)
        if node.right:
            build_codes(node.right, prefix + '1', codebook)
    
    return codebook

def encode(data: str, codebook: Dict[str, str]) -> str:
    return ''.join(codebook[char] for char in data)

def decode(encoded_data: str, root: HuffmanNode) -> str:
    decoded_str = []
    node = root

    for bit in encoded_data:
        if bit == '0':
            node = node.left
        else:
            node = node.right

        if node.is_leaf():
            decoded_str.append(node.symbol)
            node = root
    
    return ''.join(decoded_str)

# Test fonksiyonları
def test_huffman_coding():
    # Örnek veri
    data = "huffman coding example"

    # Adım 1: Frekansları hesapla
    frequencies = calculate_frequencies(data)
    print(f"Frekanslar: {frequencies}")

    # Adım 2: Huffman ağacını oluştur
    huffman_tree = build_huffman_tree(frequencies)

    # Adım 3: Huffman kodlarını oluştur
    codebook = build_codes(huffman_tree)
    print(f"Kodlar: {codebook}")

    # Adım 4: Veriyi kodla
    encoded_data = encode(data, codebook)
    print(f"Kodlanmış veri: {encoded_data}")

    # Adım 5: Veriyi çöz
    decoded_data = decode(encoded_data, huffman_tree)
    print(f"Çözümlenmiş veri: {decoded_data}")

    # Test: Verinin doğru çözülüp çözülmediğini kontrol et
    assert data == decoded_data, "Veri doğru çözülmedi!"

# Test et
test_huffman_coding()
