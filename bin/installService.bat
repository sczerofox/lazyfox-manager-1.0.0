@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:checkService
echo 正在尝试安装 OssManagerService 服务...
oss-manager-service.exe install oss-manager-service.xml

if %errorlevel% == 0 (
    echo The Oss Manager Service service was installed successfully.
    echo 安装 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was installed error.
    echo 无法安装 Oss Manager Service 服务。
)

echo 正在尝试启动 OssManagerService 服务...
oss-manager-service.exe start

if %errorlevel% == 0 (
    echo The Oss Manager Service service was started successfully.
    echo 启动 Oss Manager Service 服务成功。
) else (
    echo The Oss Manager Service service was started error.
    echo 无法启动 Oss Manager Service 服务。
)


pause