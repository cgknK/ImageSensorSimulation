# PowerShell Benchmark Runner
# Bu script, EXE dosyalarını tekrar tekrar çalıştırarak sürelerini karşılaştırmak için kullanılır.

# Not: Eğer script çalışmazsa terminalde aşağıdakini çalıştırın:
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Tekrar sayısı (her exe kaç kez çalıştırılsın)
$repeatCount = 2

# Log dosyası (isteğe bağlı)
$logFile = "o0_o1_o2_o3_log.txt"
if (Test-Path $logFile) { Remove-Item $logFile }

# Çalıştırılacak EXE dosyaları ve parametreleri
$executables = @(
    @{ Path = ".\flat-data_vs_nested_7.exe";   Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o1.exe"; Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o2.exe"; Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o3.exe"; Args = "" }
)

Write-Host "`n[i] PowerShell Benchmark Runner Başlatıldı`n" -ForegroundColor Yellow

foreach ($i in 1..$repeatCount) {
    Write-Host "[i] Tekrar $i / $repeatCount" -ForegroundColor Magenta
    Add-Content -Path $logFile -Value "[i] Tekrar $i / $repeatCount"

    foreach ($exe in $executables) {
        $path = $exe.Path
        $args = $exe.Args

        if (-Not (Test-Path $path)) {
            Write-Host "[!] Dosya bulunamadı: $path" -ForegroundColor Red
            Add-Content -Path $logFile -Value "[!] Dosya bulunamadı: $path"
            continue
        }

        Write-Host "[*] Çalıştırılıyor: $path $args" -ForegroundColor Cyan
        Add-Content -Path $logFile -Value "[*] Çalıştırılıyor: $path $args"

        # Zaman ölçüm başlat
        $sw = [System.Diagnostics.Stopwatch]::StartNew()
        try {
            $output = & $path $args.Split(" ") 2>&1
            $exitCode = $LASTEXITCODE
            $sw.Stop()
            $elapsed = $sw.Elapsed.TotalMilliseconds

            if ($exitCode -eq 0) {
                Write-Host "[+] Çıktı:`n$output"
                Write-Host "[✓] Süre: $elapsed ms`n" -ForegroundColor Green

                Add-Content -Path $logFile -Value "[+] Çıktı:`n$output"
                Add-Content -Path $logFile -Value "[✓] Süre: $elapsed ms`n"
            }
            else {
                Write-Host "[!] Hatalı çıkış kodu: $exitCode" -ForegroundColor Red
                Write-Host "[!] Hata çıktısı:`n$output" -ForegroundColor Red

                Add-Content -Path $logFile -Value "[!] Hatalı çıkış kodu: $exitCode"
                Add-Content -Path $logFile -Value "[!] Hata çıktısı:`n$output"
            }
        }
        catch {
            $sw.Stop()
            Write-Host "[!] Hata oluştu: $($_.Exception.Message)" -ForegroundColor Red
            Add-Content -Path $logFile -Value "[!] Hata oluştu: $($_.Exception.Message)"
        }

        Write-Host "----------------------------------------"
        Add-Content -Path $logFile -Value "----------------------------------------`n"
    }
}

Write-Host "`n[i] Benchmark tamamlandı. Log dosyası: $logFile" -ForegroundColor Yellow
