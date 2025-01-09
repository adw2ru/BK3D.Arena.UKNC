@echo off

echo.
echo ===========================================================================
echo Compiling MAIN
echo ===========================================================================
..\php\php -f ../scripts/preprocess.php bmain.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -l _bmain.lst _bmain.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\php\php -f ../scripts/lst2bin.php _bmain.lst ./release/bmain.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\bmain.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\bmain.sav >NUL

echo.