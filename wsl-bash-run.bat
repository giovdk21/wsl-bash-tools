@echo off
setlocal enabledelayedexpansion

REM See: https://github.com/Microsoft/vscode/issues/3519#issuecomment-189688918
powershell.exe -ExecutionPolicy Unrestricted -NoProfile -File %~dp0wsl-bash-run.ps1 %*