
# 1 导入 oss-manager-client Maven 依赖

## 1.1 找出文件

### 1.1.1 文件位置

**文件在**：**lazyfox-manager-1.1.4** 项目文件夹下 **resources** 资源文件下的 **lazyfox** 文件夹

## 1.2 安装文件到本地仓库

将 **lazyfox** 文件夹 复制到 **本地Maven仓库** 中的 **org** 文件夹下

## 1.3 测试依赖是否导入

输入 **UploadService** 当出现 **org.lazyfox.ossmanagerclient.service.UploadService** 这个导包时
并且能在 **org.lazyfox.ossmanagerclient.service.UploadService** 调用如下方法时就说明没问题

**uploadFile(file)
uploadFileParameter(file, type)
uploadFileTowParameter(file, strType, type)
uploadFileSystemConfig(file)

如果有问题 请重新 配置 lazyfox 文件夹的


# 2 参考提供的SDK编写代码

## 2.1 参考 示例代码编写

### 2.1.1 简单示例

``` Java

package org.lazyfox.petfoodstore.controller;

import org.lazyfox.ossmanagerclient.service.DeleteService;
import org.lazyfox.petfoodstore.common.Result;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import static org.lazyfox.ossmanagerclient.service.UploadService.*;
import static org.lazyfox.ossmanagerclient.service.DeleteService.*;

@RestController
@RequestMapping("/file")
public class FileController {

	@PostMapping("/upload")
	public Result fileUpload(@RequestParam("file") MultipartFile file) {
		return Result.success(uploadFile(file));
	}

	@PostMapping("/upload-parameter")
	public Result fileUploadParameter(@RequestParam("file") MultipartFile file, @RequestParam("type") Integer type) {
		return Result.success(uploadFileParameter(file, type));
	}

	@PostMapping("/upload-two-parameter")
	public Result fileUploadTwoParameter(@RequestParam("file") MultipartFile file, @RequestParam("strType") Integer strType, @RequestParam("type") Integer type) {
		return Result.success(uploadFileTwoParameter(file, strType, type));
	}

	@PostMapping("/upload-system-config")
	public Result fileUploadSystemConfig(@RequestParam("file") MultipartFile file) {
		return Result.success(uploadFileSyStemConfig(file));
	}

	@GetMapping("/delete")
	public org.lazyfox.ossmanagerclient.common.Result fileDelete(@RequestParam("filename") String filename) {
		return deleteFile(filename);
	}

}



```

### 2.1.2 Java 文件

文件位置：**lazyfox-manager-1.1.4** 项目文件夹下 **resources** 资源文件下的
**oss-manager-client 的接口调用 SDK** 里面的 **FileController.java**

## 2.2 参考 接口编写

### 2.2.1 上传文件

**package**信息：**org.lazyfox.ossmanagerclient.service.UploadService**
#### 2.2.1.1 方法：**uploadFile(file)**

参数：MultipartFile file (必传 上传的文件)
返回：String

#### 2.2.1.2 方法：**uploadFileParameter(file, type)**

参数：
MultipartFile file (必传 上传的文件)
Integer type (必传 返回字符串的类型)

返回：String

#### 2.2.1.3 方法：**uploadFileTowParameter(file, strType, type)**

参数：
MultipartFile file (必传 上传的文件)
Integer strType (必传 返回字符串的类型)
Integer type (必传 返回字符串前缀的类型)

返回：String

#### 2.2.1.4 方法：**uploadFileSystemConfig(file)**

参数：MultipartFile file
返回：String

### 2.2.2 删除文件

**package**信息：**org.lazyfox.ossmanagerclient.service.DeleteService**

#### 2.2.2.4 方法：deleteFile(filename)

参数：String filename
返回：Result result

``` java
{ 
	"code": 0, 
	"message": "操作成功", 
	"data": null
}
```