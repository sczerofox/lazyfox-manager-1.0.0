@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: 检测是否以管理员权限运行
net session >nul 2>&1
if %errorlevel% == 0 (
    echo 已以管理员权限运行...
    goto checkService
) else (
    echo 请求管理员权限...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

:checkService
echo 正在尝试关闭 OssManagerService 服务...
net stop OssManagerService

if %errorlevel% == 0 (
    echo The Oss Manager Service service was stopped successfully.
    echo 关闭 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was stopped error.
    echo 无法关闭 Oss Manager Service 服务。
)

pause