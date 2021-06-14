package com.project.zara.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.FileMapper;
import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.FileVO;

@Service
public class FileServiceImpl implements FileService {

	
	@Autowired
	FileMapper fileMapper;
	
	
	@Override
	public void fileUpload(List<FileVO> file_list) {
		fileMapper.fileUpload(file_list);
		
	}


	@Override
	public List<FileVO> getFile(Map<String,Object> map) {
	
		return fileMapper.getFile(map);
	}


	@Override
	public void deleteFile(Map<String, Object> map) {
		
		
		
		List<FileVO> list = getFile(map);
		System.out.println("파일 리스트 : " + list);
		for(FileVO file : list ) {
			String path = file.getFile_path()+file.getFile_name();
		    File file1 = new File(path);
		    System.out.println("파일 경로 : "+path);
		    System.out.println("삭제할 파일 : " +file1);
		    if(file1.exists() == true){
		    	System.out.println("파일이 존재하여 삭제합니다!");
		    	file1.delete();

		    			}
		}
		
		fileMapper.deleteFile(map);
		
		
		
		
	}


}
