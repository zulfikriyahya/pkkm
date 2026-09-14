#!/bin/bash

# Pastikan pandoc terinstall terlebih dahulu:
# - Ubuntu/Debian : sudo apt install pandoc
# - macOS         : brew install pandoc
# - Windows       : choco install pandoc / download dari pandoc.org

# Cari semua file .md di dalam folder PKKM, lalu convert ke .docx
find . -type f -name "*.md" | while read -r file; do
    dir=$(dirname "$file")
    filename=$(basename "$file" .md)
    pandoc "$file" -o "$dir/$filename.docx"
    if [ $? -eq 0 ]; then
        echo "✓ Berhasil: $filename.docx"
        rm "$file"   # hapus file .md asli setelah berhasil convert
    else
        echo "✗ Gagal: $file"
    fi
done

echo "Konversi selesai."
