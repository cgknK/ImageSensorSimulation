C programınızın çalışması sırasında **çalışma zamanı (runtime)** süresince **RAM (bellek)** kullanımını 10 saniyelik aralıklarla ölçmek, ardından bu ölçümler üzerinden **istatistiksel analiz** yapmak mümkündür. Ancak, birkaç önemli konuyu ayırmak gerekir:

---

### 🔍 1. **RAM Ölçümünde Dikkat Edilecek Noktalar**

#### a. **Sadece `.exe` Dosyasının Hafıza Kullanımı**
Bu, **"process-level" (süreç düzeyinde)** ölçümdür. Genellikle şunları kapsar:
- Process’in `heap`, `stack`, ve `code` segmenti kullanımı
- Kütüphane kullanımı (shared libraries)
- Kernel’in bu prosese atadığı diğer kaynaklar

#### b. **"Programın Etkileri" Ne Demek?**
Bu daha geniş bir sorudur:
- OS üzerinden başka bir process başlatıyor mu?
- Bellek harici kaynaklara (örneğin disk cache, pagefile, kernel buffer) etkide bulunuyor mu?
- Diğer uygulamaların bellek kullanımını dolaylı yoldan etkiliyor mu?

Bu nedenle “programın kendisi + etkileri” şeklinde iki düzeyde analiz yapılabilir:
- **Dar düzey:** Sadece prosesin kullandığı RAM
- **Geniş düzey:** Sistemde toplam bellek değişimi (programın dolaylı etkisi)

---

### 🛠️ 2. **Nasıl Ölçülür?**

#### a. **Windows Üzerinde Process RAM Ölçümü (Kodla)**

`psutil` benzeri bir Python kütüphanesi veya `GetProcessMemoryInfo` fonksiyonu kullanılarak `.exe` dosyasının bellek tüketimi izlenebilir.

Aşağıda Python ile bir `.exe` dosyasının RAM kullanımını 10 saniyelik aralıklarla ölçen bir örnek:

```python
import psutil
import time
import statistics
import subprocess

# .exe dosyasını başlat
process = subprocess.Popen(["C:\\path\\to\\your_program.exe"])
pid = process.pid
proc = psutil.Process(pid)

# Bellek ölçümlerini saklayacak liste
memory_usages = []

try:
    for _ in range(6):  # 1 dakikalık toplam örnekleme için 6 kez ölç
        mem_info = proc.memory_info()
        memory_mb = mem_info.rss / (1024 * 1024)  # RSS: resident set size
        memory_usages.append(memory_mb)
        print(f"Memory used: {memory_mb:.2f} MB")
        time.sleep(10)
except psutil.NoSuchProcess:
    print("Process terminated.")
finally:
    if process.poll() is None:
        process.terminate()

# İstatistiksel analiz
print("\n--- Statistics ---")
print(f"Min: {min(memory_usages):.2f} MB")
print(f"Max: {max(memory_usages):.2f} MB")
print(f"Mean (Ortalama): {statistics.mean(memory_usages):.2f} MB")
print(f"Median (Medyan): {statistics.median(memory_usages):.2f} MB")
try:
    mode = statistics.mode(memory_usages)
except:
    mode = "No unique mode"
print(f"Mode (Mod): {mode}")
print(f"Standard Deviation (Std): {statistics.stdev(memory_usages):.2f} MB")
```

#### b. **Geniş Düzey: Sistem RAM Kullanımı (Toplam Değişim)**
Bu durumda, `.exe` çalışmadan önce ve sonra sistemdeki **toplam kullanılabilir RAM** ölçülür. Yine `psutil` bunu destekler:

```python
psutil.virtual_memory().available  # Kullanılabilir RAM
```

Böylece programın dolaylı etkilerini gözlemleyebilirsiniz.

---

### 📊 3. **Güvenilirlik**

#### a. **Süreç düzeyinde ölçüm**
- `psutil` veya `GetProcessMemoryInfo` gibi sistem çağrıları **doğrudan OS'tan alınan bilgilerle** çalışır.
- Bu, oldukça güvenilir bir yöntemdir.
- Ancak ölçülen değer, "resident" bellek olabilir (yani fiziksel RAM; pagefile veya cache değil).

#### b. **Genel sistem etkisi**
- Daha değişkendir, çünkü program dışında başka işlemler de RAM kullanıyor olabilir.
- Programın başka process'leri tetiklemesi (örneğin virüs programları, hizmetler) bellek kullanımını artırabilir ve ölçüm karmaşıklaşır.

---

### 🧪 Gerçek Hayat Uygulaması

Aşağıdakiler için bu tür analiz gereklidir:
- **Oyun motorları** ve render yazılımları (GPU/CPU bellek kullanımı)
- **Veritabanı sunucuları** (örn. PostgreSQL’in shared_buffers etkisi)
- **Bellek sızıntısı (memory leak)** analizi
- **Performans profili çıkarma** (profiling)

---

### 📁 Alternatif Yöntemler

- **Windows Performance Monitor (perfmon)**
- **Valgrind/Massif** (Linux için, ayrıntılı heap profil çıkarır)
- **Windows Resource Monitor / Task Manager** (manuel izleme)
- **ETW (Event Tracing for Windows)** ile detaylı izleme

---

### 🔚 Sonuç

C programınızın RAM kullanımını ve sistem üzerindeki etkilerini analiz etmek için:
1. `.exe` process'inin bellek kullanımını izleyin.
2. Sistem genelindeki RAM değişimini ölçün.
3. Ölçümleri istatistiksel olarak analiz edin.
4. Yalnızca `heap` değil, `kernel objects`, `mapped files` gibi dolaylı etkileri de göz önünde bulundurun.

İstersen bu ölçüm sistemini hem `.exe` dosyan hem de OS düzeyi için birlikte geliştirip test edebiliriz. Bu Python örneğini C'de gerçekleştirmek istersen onu da adım adım anlatabilirim. Hangisinden devam edelim?
