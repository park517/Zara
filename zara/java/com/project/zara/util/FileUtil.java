package com.project.zara.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.project.zara.model.FileVO;

public class FileUtil {

	public List<FileVO> setFiles(MultipartFile[] file,String table_name) throws IllegalStateException, IOException {
		List<FileVO> files = new ArrayList<>();
		
		String uploadFolder = "C:\\zara_upload";

		String uploadFolderPath = getFolder(table_name);
		
		File uploadpath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadpath.exists() == false) {
			uploadpath.mkdirs();
		}
		for(MultipartFile f : file) {
			FileVO fd = new FileVO();
		    String sourceFileName = f.getOriginalFilename(); 
		    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		    File destinationFile; 
		    String destinationFileName;
	        destinationFileName =UUID.randomUUID().toString().replaceAll("-", "") + "." + sourceFileNameExtension; 
	        destinationFile = new File(uploadpath,destinationFileName); 
	        f.transferTo(destinationFile);
	        fd.setTable_name(table_name);
	        fd.setFile_name(destinationFileName);
	        fd.setFile_real_name(sourceFileName);
	        fd.setFile_path(uploadFolderPath);
	        files.add(fd);
		}
		return files;
	}
	
	private String getFolder(String table_name) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);
		str = table_name +"-"+str;

		return str.replace("-", File.separator);
	}
}
