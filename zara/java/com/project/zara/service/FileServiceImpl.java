package com.project.zara.service;

import java.util.List;

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
	public List<FileVO> getFile(int bno) {
	
		return fileMapper.getFile(bno);
	}


}
