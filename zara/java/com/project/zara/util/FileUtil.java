package com.project.zara.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.project.zara.model.FileVO;

public class FileUtil {

	public List<FileVO> setFiles(MultipartFile[] file,int no, String table_name) throws IllegalStateException, IOException {
		List<FileVO> files = new ArrayList<>();
		for(MultipartFile f : file) {
			FileVO fd = new FileVO();
		    String sourceFileName = f.getOriginalFilename(); 
		    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		    File destinationFile; 
		    String destinationFileName;
		    String fileUrl = "C:/Users/park517/git/Zara/zara/src/main/webapp/resources/upload/"+table_name+"/";
	        do { 
	            destinationFileName =UUID.randomUUID().toString().replaceAll("-", "") + "." + sourceFileNameExtension; 
	            destinationFile = new File(fileUrl + destinationFileName); 
	        } while (destinationFile.exists()); 
	        
	        destinationFile.getParentFile().mkdirs(); 
	        f.transferTo(destinationFile);
	        fd.setNo(no);
	        fd.setTable_name(table_name);
	        fd.setFile_name(destinationFileName);
	        fd.setFile_real_name(sourceFileName);
	        fd.setFile_path(fileUrl);
	        files.add(fd);
		}
		return files;
	}
}
