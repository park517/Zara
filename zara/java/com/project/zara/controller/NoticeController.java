package com.project.zara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.zara.model.CourseVO;
import com.project.zara.model.NoticeVO;
import com.project.zara.service.NoticeService;
import com.project.zara.util.PagingUtil;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	// 공지사항 페이지 보여주기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String showNotice(Model model ,
							 @RequestParam(value="pageNum", defaultValue="1")int currentPage)
	{
		int total = noticeService.NoticeCount();
		PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "list");
		List<NoticeVO> list = null;
		if(total >0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = noticeService.getNoticeList(map);
		}
		model.addAttribute("list",list);
		model.addAttribute("pagingHtml",page.getPagingHtml());
		
		return "notice/list";
	
	}
	@GetMapping("/write") 
	public String writeNotice() {
		
		return "notice/write";
	}
	
	@PostMapping("/write") 
	public String doWriteNotice(Model model , NoticeVO noticeVO) {
		
		String msg = "공지사항이 등록되었습니다.";
		String url = "/notice/list";
		System.out.println("공지 정보 " +noticeVO);
		noticeService.insertNotice(noticeVO);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect";
	}
	
	@GetMapping("/detail")
	public String detailNotice(Model model,  @RequestParam("nno") long nno) {
		
		NoticeVO notice = noticeService.getNotice(nno);
		model.addAttribute("notice",notice);
		return "notice/detail";
	}
	
	@GetMapping("/update") 
	public String updateNotice(Model model , @RequestParam("nno") long nno) {

		NoticeVO notice = noticeService.getNotice(nno);
		model.addAttribute("notice",notice);
		return "notice/update";
	}
	
	@PostMapping("/update") 
	public String doUpdateNotice(Model model, NoticeVO noticeVO) {
		
		noticeService.updateNotice(noticeVO);
		
		String msg = "공지사항이 수정되었습니다.";
		String url = "/notice/list";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/redirect";
	}
	
	
	@GetMapping("/delete/{nno}")
	public String deleteNotice(Model model,@PathVariable("nno") long nno) {
		
		noticeService.deleteNotice(nno);
		alertMessage(model,"삭제되었습니다","/notice/list");
		
		return "common/redirect";
	}
	
	@GetMapping("/redirect")
	public Model alertMessage(Model model , String msg , String url) {
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return model;
	}
}
