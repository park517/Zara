package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.zara.model.BoardVO;

@Mapper
public interface BoardMapper {
	
	//총 레코드 수
	public int selectRowCount();
	
	//카테고리 별 레코드 수
	public int CategoryRowCount(@Param("category") String category);
	// 페이징 처리 게시글 조회
	public List<BoardVO> selectList(Map<String,Object> map);
	
	//글쓰기
	public void insertBoard(BoardVO board);

	public List<BoardVO> selectCategoryBoard(Map<String, Object> map);
	
	//글 상세보기
	public BoardVO selectBoard(Integer bno);
	
	//글 수정
	public void updateBoard(BoardVO board);
	
	//글 삭제
	public void deleteBoard(Integer bno);
	
	//글 조회수 증가
	public void updateHit(Integer bno);
	
}
