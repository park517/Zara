package com.project.zara.service;

import java.util.List;
import java.util.Map;

import com.project.zara.model.BoardVO;

public interface BoardService {
	
	// 게시물 총 갯수
	public int selectRowCount();

	//카테고리 별 레코드 수
	public int CategoryRowCount(String category);
	
	// 페이징 처리 게시글 조회
	List<BoardVO> selectBoard(Map<String, Object> map);
	
	
	// 카테고리 별 페이징 처리 게시글 조회
	List<BoardVO> selectCategoryBoard(Map<String, Object> map);
	//글쓰기
	public void insertBoard(BoardVO board);
	
	
	
	
}
