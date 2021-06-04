package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.ReplyVO;

public interface ReplyMapper {
	
	// 댓글 작성
	public void writeReply(ReplyVO replyVO);
	
	// 댓글 가져오기
	public List<ReplyVO> getReplyList(Map<String,Object> map);
	
	// 댓글 수정하기
	public void updateReply(ReplyVO reply);
	
	// 댓글 삭제하기
	public void deleteReply(@Param("cno") int cno);
	
	// 게시물 당 댓글 갯수
	public int replyCount(@Param("pno") int pno);

}
