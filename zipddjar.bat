@echo off
echo current path ：%~f0
REM pause
cd /d %~dp0
@echo off

7z.exe a dd-0.1-SNAPSHOT.jar.7z dd-0.1-SNAPSHOT.jar