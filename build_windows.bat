@echo off
echo [1] Creating folders...
mkdir obj bin 2>nul

echo [2] Building with GNAT...
gnatmake -P aegis_build.gpr -Xmode=release

echo [3] Build complete. Run:
echo   bin\aegis_demo.exe
pause
