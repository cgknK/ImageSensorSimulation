import numpy as np

def quantize(data, num_levels):
    """
    Verilen veriyi belirli sayıda seviyeye kuantize eder.
    
    Args:
    data (numpy array): Kuantize edilecek veri.
    num_levels (int): Kuantizasyon seviyelerinin sayısı.
    
    Returns:
    numpy array: Kuantize edilmiş veri.
    """
    # Veri aralığını belirle
    data_min, data_max = np.min(data), np.max(data)
    
    # Kuantizasyon adımını hesapla
    step = (data_max - data_min) / num_levels
    
    # Kuantize edilmiş veriyi hesapla
    quantized_data = np.floor((data - data_min) / step) * step + data_min + step / 2
    
    return quantized_data

# Örnek veri
data = np.array([0.1, 0.5, 1.2, 1.8, 2.5, 3.0, 4.2, 5.5])

# Kuantizasyon seviyeleri
num_levels = 4

# Kuantize edilmiş veri
quantized_data = quantize(data, num_levels)

print("Orijinal Veri:", data, len(data))
print("Kuantize Edilmiş Veri:", quantized_data, len(quantized_data))



#########

import numpy as np
import matplotlib.pyplot as plt

# Sürekli bir sinyal (örneğin bir sinüs dalgası)
x = np.linspace(0, 2 * np.pi, 100)
continuous_signal = np.sin(x)

# Kuantizasyon seviyeleri (örneğin 4 seviyeye kuantize edeceğiz)
quantization_levels = 4

# Minimum ve maksimum değerleri bulma
min_val = np.min(continuous_signal)
max_val = np.max(continuous_signal)

# Kuantizasyon adımını hesaplama
quantization_step = (max_val - min_val) / (quantization_levels - 1)

# Kuantize edilmiş sinyali hesaplama
quantized_signal = np.round((continuous_signal - min_val) / quantization_step) * quantization_step + min_val

# Orijinal ve kuantize edilmiş sinyali çizdirme
plt.figure(figsize=(10,6))
plt.plot(x, continuous_signal, label='Continuous Signal (Sürekli Sinyal)', color='blue')
plt.plot(x, quantized_signal, label=f'Quantized Signal (Kuantize Sinyal) - {quantization_levels} Levels', color='red', linestyle='--')
plt.legend()
plt.title("Kuantizasyon Örneği")
plt.xlabel("Zaman")
plt.ylabel("Genlik")
plt.grid(True)
plt.show()
