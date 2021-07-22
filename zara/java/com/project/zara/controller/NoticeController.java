package com.project.zara.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	
	
	// 공지사항 페이지 보여주기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String showNotice(Model model) {
		return "notice/list";
	
	}
	@GetMapping("/write") 
	public String writeNotice() {
		
		return "notice/write";
	}
	
	@PostMapping("/write") 
	public void doWriteNotice(Model model) {
		
		String msg = "공지사항이 등록되었습니다.";
		String url = "/notice";
		alertMessage(model,msg,url);

	}
	
	@GetMapping("/update/{nno}") 
	public void updateNotice(Model model , @PathVariable("nno") long nno) {
		
		String msg = "공지사항이 등록되었습니다.";
		String url = "/notice";
		alertMessage(model,msg,url);

	}
	
	@PostMapping("/update") 
	public void doUpdateNotice(Model model) {
		
		String msg = "공지사항이 수정되었습니다.";
		String url = "/notice";
		alertMessage(model,msg,url);
	}
	
	@GetMapping("/delete/{nno}")
	public String deleteNotice(@PathVariable("nno") long nno) {
		
		return "";
	}
	
	public String alertMessage(Model model , String msg , String url) {
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect";
		}
}
