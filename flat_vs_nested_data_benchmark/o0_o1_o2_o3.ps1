#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#.\run_binaries.ps1


# Çalıştırılacak EXE dosyaları
$executables = @(
    @{ Path = ".\flat-data_vs_nested_7.exe";   Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o1.exe";   Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o2.exe"; Args = "" },
    @{ Path = ".\flat-data_vs_nested_7_o3.exe"; Args = "" }
)

Write-Host "`n[i] PowerShell Benchmark Runner Başlatıldı`n"

foreach ($exe in $executables) {
    $path = $exe.Path
    $args = $exe.Args

    if (-Not (Test-Path $path)) {
        Write-Host "[!] Dosya bulunamadı: $path" -ForegroundColor Red
        continue
    }

    Write-Host "[*] Çalıştırılıyor: $path $args" -ForegroundColor Cyan

    $start = Get-Date
    try {
        $output = & $path $args 2>&1
        $exitCode = $LASTEXITCODE
        $end = Get-Date
        $elapsed = ($end - $start).TotalSeconds

        if ($exitCode -eq 0) {
            Write-Host "[+] Çıktı:`n$output"
            Write-Host "[✓] Süre: $elapsed saniye`n" -ForegroundColor Green
        } else {
            Write-Host "[!] Hatalı çıkış kodu: $exitCode" -ForegroundColor Red
            Write-Host "[!] Hata çıktısı:`n$output" -ForegroundColor Red
        }
    } catch {
        Write-Host "[!] Hata oluştu: $_" -ForegroundColor Red
    }

    Write-Host "----------------------------------------"
}
