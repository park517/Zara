package com.project.zara.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.BoardVO;
import com.project.zara.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	BoardService boardService;
	
	
	//자바빈(VO) 초기화
	@ModelAttribute("boardVO")
	public com.project.zara.model.BoardVO initCommand() {
		return new com.project.zara.model.BoardVO();
	}
	
	
	//게시판 목록
	@RequestMapping(value="/getlist", method=RequestMethod.GET)
	public String process(Model model) {
		
		List<BoardVO> list = null;
		list = boardService.getList();
		model.addAttribute("list",list);
		
		return "board/getlist";
	}
	
	
	//게시판 글 작성하기
	@GetMapping("/write")
	public String showWrite() {
		return "board/write";
	}
	
	
	//게시판 글 작성처리 전송하기
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String doWrite(@RequestParam Map<String, Object> param, BindingResult result, HttpServletRequest request, HttpSession session ) {
	
		return "board/list";
	}
	
	
	
	
}
