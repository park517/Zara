package com.project.zara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.zara.model.BoardReplyVO;
import com.project.zara.model.ReplyVO;
import com.project.zara.service.ReplyService;
import com.project.zara.util.PagingUtil;

@Controller
@RequestMapping("/product/reply")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	//댓글 작성하기
	@RequestMapping("/write")
	@ResponseBody
	public void writeReply( ReplyVO replyVO, HttpSession session,
							HttpServletRequest request)
	{
		
		System.out.println("댓글 내용 : "+replyVO);
		replyService.writeReply(replyVO);
	}
	
	//댓글 가져오기
	@RequestMapping("/get")
	@ResponseBody
	public Map<String,Object> getReplyList(@Param("pno") int pno , @Param("currentPage") int currentPage ) {
		
		Map<String,Object> map = new HashMap<>();
		//총 글의 갯수
		int count = replyService.replyCount(pno);
		
		// 총 글 갯수로 부터 총 페이지 갯수 구하기
		int totalPageNum = (count+4)/5;
		System.out.println("페이지수는>!?!?!?1 : "+ totalPageNum);
		PagingUtil page = new PagingUtil(currentPage,count, 5, 5,null);
		map.put("pno", pno);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		List<ReplyVO> list = null;
		if(count > 0) {
			list = replyService.getReplyList(map);
		}

		Map<String,Object> mapJson = 
				new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", 5);
		mapJson.put("totalPageNum", totalPageNum);
		mapJson.put("list", list);
		return mapJson;
		
	}
	
	//댓글 수정하기
	@RequestMapping("/update")
	@ResponseBody
	public void UpdateReply(ReplyVO reply) 
	{
		replyService.updateReply(reply);
	}
	
	//댓글 삭제하기
	@RequestMapping("/delete")
	@ResponseBody
	public void DeleteReply(@RequestParam("cno") int cno) 
	{
		replyService.deleteReply(cno);
		
	}
}
