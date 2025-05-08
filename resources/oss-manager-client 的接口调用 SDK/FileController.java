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

