import subprocess
import time
import platform
import os

# Çalıştırılacak ikililer (binary dosyalar)
binaries = [
    {"path": "./benchmark_O0.exe", "args": []},
    {"path": "./benchmark_O3.exe", "args": []},
    {"path": "./benchmark_simd.exe", "args": []},
]

def is_executable(path):
    return os.path.isfile(path) and os.access(path, os.X_OK)

def run_binary(binary):
    path = binary["path"]
    args = binary["args"]

    if not is_executable(path):
        print(f"[!] Dosya çalıştırılamaz: {path}")
        return None

    print(f"[*] Çalıştırılıyor: {path} {' '.join(args)}")
    start = time.time()

    try:
        completed = subprocess.run([path] + args, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        end = time.time()
        duration = end - start

        print("[+] Çıktı:")
        print(completed.stdout)
        print(f"[✓] Süre: {duration:.3f} saniye")
        print("-" * 40)

    except subprocess.CalledProcessError as e:
        print(f"[!] Hata oluştu:\n{e.stderr}")
        print("-" * 40)

def main():
    current_os = platform.system()
    print(f"[i] Platform: {current_os}")

    for binary in binaries:
        run_binary(binary)

if __name__ == "__main__":
    main()
