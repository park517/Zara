package com.project.zara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.zara.model.BoardVO;

@Mapper
public interface BoardMapper {
	//글 목록
	public List<BoardVO> getList();
	
	//총 레코드 수
	public int selectRowCount();
}
