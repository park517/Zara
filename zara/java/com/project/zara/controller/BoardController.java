package com.project.zara.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.BoardVO;
import com.project.zara.model.PagingUtil;
import com.project.zara.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	BoardService boardService;
	
	
	//자바빈(VO) 초기화
	@ModelAttribute("boardVO")
	public com.project.zara.model.BoardVO initCommand() {
		return new com.project.zara.model.BoardVO();
	}
	
	//전체 게시판 목록 가져오기
	@RequestMapping(value="/getlist", method=RequestMethod.GET)
	public ModelAndView process(
			Model model,
			@RequestParam(value="pageNum", defaultValue="1")int currentPage
			){
		int total = boardService.selectRowCount();
		
		PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "getlist");
		
		List<BoardVO> list = null;
		if(total >0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = boardService.selectList(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/getlist");
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
			
		return mav;
	}
	
	
	// 카테고리별 게시물 조회
	
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	public ModelAndView getCategoryList(
			Model model,
			@RequestParam(value="pageNum", defaultValue="1")int currentPage ,
			String category
			){
		
		System.out.println("카테고리 : "+category);
		
		int total = boardService.CategoryRowCount(category);
		
		PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "getCategoryList");
		
		List<BoardVO> list = null;
		if(total >0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("category", category);
			list = boardService.selectCategoryBoard(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/categoryList");
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
			
		return mav;
	}
	
	//게시판 글 작성하기
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String showWrite() {
		return "board/write";
	}
	
	//게시판 글 작성처리 전송하기
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String doWrite(BoardVO board , Model model) {
		
		
		boardService.insertBoard(board);
		String msg  = "글이 작성되었습니다";
		String url = "/board/getlist";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/redirect";
	}
	
	
	// 공지사항 페이지 보여주기
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String showNotice() {
	
		return "board/notice";
	
	}
	
	//글 상세페이지
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam int bno) {
		
		//조회수 증가
		boardService.updateHit(bno);
		
		BoardVO board = boardService.selectBoard(bno);

		return new ModelAndView("board/boardView", "board", board);
	}
	
	//글 수정
	//수정폼 호출
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int bno, Model model) {
		BoardVO boardVO = boardService.selectBoard(bno);
		model.addAttribute("boardVO", boardVO);
		return "board/boardModify";
	}
	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String submitUpdate(BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		return "redirect:/board/getList";
	}
	
	//글 삭제
	@RequestMapping("/delete")
	public String submitDelete(@RequestParam int bno) {
		boardService.deleteBoard(bno);
		
		return "redirect:/board/getList";
	}
	
	
	
}
