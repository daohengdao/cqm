@echo off
echo =================================================
echo this bat need mingw64 environment .....
echo =================================================
pause
rem if exist build (
rem    rd /s /q build
rem )
if exist cqm.exe (
    del /q cqm.exe
)
mingw32-make
echo ===============================
echo Done!
echo ===============================
pause
