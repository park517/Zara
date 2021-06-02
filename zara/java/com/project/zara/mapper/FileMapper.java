package com.project.zara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.FileVO;

public interface FileMapper {
	public void fileUpload(List<FileVO> file_list);

	public List<FileVO> getFile(@Param("bno") int bno);
}
