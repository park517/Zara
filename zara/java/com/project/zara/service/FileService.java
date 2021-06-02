package com.project.zara.service;

import java.util.List;

import com.project.zara.model.FileVO;

public interface FileService {

	public void fileUpload(List<FileVO> file_list);
	
	public List<FileVO> getFile(int bno);
}
