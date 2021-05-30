package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.BoardMapper;
import com.project.zara.model.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	//의존관계
	@Autowired
	BoardMapper boardMapper;

	//글쓰기
	public void insertBoard(BoardVO board) {
		boardMapper.insertBoard(board);
	}
	
	//총레코드수
	@Override
	public int selectRowCount( ) {
		return boardMapper.selectRowCount();
	}
	
	//카테고리별 레코드 수 
	@Override
	public int CategoryRowCount(String category) {
		// TODO Auto-generated method stub
		return boardMapper.CategoryRowCount(category);
	}  
	

	//글목록
	@Override
	public List<BoardVO> selectList(Map<String,Object> map) {
		return boardMapper.selectList(map);
	}

	@Override
	public List<BoardVO> selectCategoryBoard(Map<String, Object> map) {
		return boardMapper.selectCategoryBoard(map);
	}

	//글 상세 조회
	public BoardVO selectBoard(Integer bno) {
		return boardMapper.selectBoard(bno);
	}

	//글 수정
	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
		
	}

	//글 삭제
	@Override
	public void deleteBoard(Integer bno) {
		boardMapper.deleteBoard(bno);
		
	}
	//조회수 증가
	public void updateHit(Integer bno) {
		boardMapper.updateHit(bno);
	}
	
	
}
