@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Use UTF-8 BOM to ensure proper encoding in the output file
>hashes.md5 (
  :: Write BOM for UTF-8
  <nul set /p=ï»¿

  :: Loop through files
  for %%f in (*) do (
    for /f %%h in ('certutil -hashfile "%%f" MD5 2^>nul ^| findstr /R /C:"^[0-9a-fA-F][0-9a-fA-F]*$"') do (
      :: Output in .md5 format, preserving Unicode filenames
      echo %%h *%%f
    )
  )
)

echo ✅ hashes.md5 created with proper Unicode support.
