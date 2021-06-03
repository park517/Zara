package com.project.zara.service;

import java.util.List;
import java.util.Map;

import com.project.zara.model.FileVO;

public interface FileService {

	public void fileUpload(List<FileVO> file_list);
	
	public List<FileVO> getFile(Map<String,Object> map);
	
	public void deleteFile(Map<String,Object> map);
}
