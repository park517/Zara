package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.ReplyVO;

public interface ReplyService {

	// 댓글 작성
	public void writeReply(ReplyVO replyVO);
	
	// 댓글 가져오기
	public List<ReplyVO> getReplyList(Map<String,Object> map);
	
	// 댓글 수정하기
	public void updateReply(ReplyVO reply);
	
	// 댓글 삭제하기
	public void deleteReply(int cno);
	
	// 댓글 갯수 
	public int replyCount(@Param("pno") int pno);
}
