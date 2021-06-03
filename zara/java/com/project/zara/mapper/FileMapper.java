package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.FileVO;

public interface FileMapper {
	public void fileUpload(List<FileVO> file_list);

	public List<FileVO> getFile(Map<String,Object> map);
	
	public void deleteFile(Map<String, Object> map);
}
