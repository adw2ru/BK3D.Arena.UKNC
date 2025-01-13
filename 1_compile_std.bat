@echo off

echo.
echo ===========================================================================
echo Compiling MAIN
echo ===========================================================================
..\php\php -f ../scripts/preprocess.php bk3da.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -l _bk3da.lst _bk3da.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\php\php -f ../scripts/lst2bin.php _bk3da.lst ./release/bk3da.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\bk3da.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\bk3da.sav >NUL

echo.