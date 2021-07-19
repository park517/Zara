package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project.zara.model.BoardReplyVO;
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
	
	
	//=================댓글==================================//
	
	//댓글 목록
	public List<BoardReplyVO> selectListReply(Map<String,Object> map);

	//댓글 수 카운트
	@Select("SELECT COUNT(*) FROM comments WHERE bno=#{bno}")
	public int selectRowCountReply(@Param("bno") int bno);

	//댓글 작성
	public void insertReply(BoardReplyVO boardReply);

	//댓글 수정
	@Update("UPDATE comments SET content=#{content}, update_at=SYSDATE WHERE cno=#{cno}")
	public void updateReply(@Param("cno")int cno, @Param("content")String content);

	//댓글 삭제
	@Delete("DELETE FROM comments WHERE cno=#{cno}")
	public void deleteReply(Integer cno);

	//게시글 삭제시 댓글이 존재하면 게시글 삭제전 댓글 삭제
	@Delete("DELETE FROM comments WHERE bno=#{bno}")
	public void deleteReplyByBoardNum(Integer bno);

	
}
