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
echo 正在尝试开启 OssManagerService 服务...
net start OssManagerService

if %errorlevel% == 0 (
    echo The Oss Manager Service service was started successfully.
    echo 启动 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was started error.
    echo 无法启动 Oss Manager Service 服务。
)

pause