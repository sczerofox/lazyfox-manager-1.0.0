@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:checkService
echo 正在尝试停止 OssManagerService 服务...
oss-manager-service.exe stop

if %errorlevel% == 0 (
    echo The Oss Manager Service service was stopped successfully.
    echo 停止 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was stopped error.
    echo 无法停止 Oss Manager Service 服务。
)

echo 正在尝试卸载 OssManagerService 服务...
oss-manager-service.exe uninstall oss-manager-service.xml

if %errorlevel% == 0 (
    echo The Oss Manager Service service was uninstalled successfully.
    echo 卸载 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was uninstalled error.
    echo 无法卸载 Oss Manager Service 服务。
)

pause