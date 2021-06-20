package com.project.zara.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {

	
	
	// 공지사항 페이지 보여주기
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String showNotice() {
	
		return "board/notice";
	
	}
}
