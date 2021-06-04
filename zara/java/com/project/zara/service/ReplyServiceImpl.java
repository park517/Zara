package com.project.zara.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.ReplyMapper;
import com.project.zara.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public void writeReply(ReplyVO replyVO) {
		
		replyMapper.writeReply(replyVO);
		
	}

	@Override
	public List<ReplyVO> getReplyList(Map<String,Object> map) {
		
		
			
		return replyMapper.getReplyList(map);
	}

	@Override
	public void updateReply(ReplyVO reply) {
		
		replyMapper.updateReply(reply);
	}

	@Override
	public void deleteReply(int cno) {
		
		replyMapper.deleteReply(cno);
	}

	@Override
	public int replyCount(int pno) {
		
		return replyMapper.replyCount(pno);
	}
	
}
