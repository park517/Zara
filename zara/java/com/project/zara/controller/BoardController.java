package com.project.zara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.BoardReplyVO;
import com.project.zara.model.BoardVO;
import com.project.zara.model.MemberVO;
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
	public BoardVO initCommand() {
		return new BoardVO();
	}
	@ModelAttribute("boardReplyVO")
	public BoardReplyVO initCommand1() {
		return new BoardReplyVO();
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
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardView");
		//조회수 증가
		boardService.updateHit(bno);
		
		//글 내용
		BoardVO board = boardService.selectBoard(bno);
		mav.addObject("board", board);
		
		return mav;
	}
	
	//글 수정
	//수정폼 호출
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int bno, Model model) {
		BoardVO board = boardService.selectBoard(bno);
		model.addAttribute("boardVO", board);
		return "board/boardModify";
	}
	
	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String submitUpdate(BoardVO boardVO ,Model model) {
		boardService.updateBoard(boardVO);
		String url = "/board/getCategoryList?category=와글와글";
		String msg = "수정 되었습니다;";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/redirect";
	}
	
	//글 삭제
	@RequestMapping("/delete")
	public String submitDelete(@RequestParam int bno, Model model) {
		boardService.deleteBoard(bno);
		String url = "/board/getCategoryList?category=와글와글";
		String msg = "삭제 되었습니다.";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/redirect";
	}
	
	
	
	
	
	//==================댓글====================//
	@RequestMapping("/detail/writeReply")
	@ResponseBody
	public Map<String,String> writeReply(
									BoardReplyVO boardReplyVO,
									HttpSession session,
									HttpServletRequest request){

		if(log.isDebugEnabled()) {
			log.debug("<<boardReplyVO>> : " + boardReplyVO);
		}

		Map<String,String> map = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인 안 됨
			map.put("result", "logout");
		}else {
			//댓글 등록
			boardService.insertReply(boardReplyVO);
			map.put("result", "success");
		}

		return map;
	}
	
	//댓글 목록
	@RequestMapping("/detail/listReply")
	@ResponseBody
	public Map<String,Object> getList(
									@RequestParam(value="pageNum",defaultValue="1")
									int currentPage,
									@RequestParam("bno") int bno,
									HttpSession session){
		//(******주의)댓글 좋아요 처리시만 HttpSession 넣을 것
		if(log.isDebugEnabled()) {
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<bno>> : " + bno);
		}

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);

		//총 글의 갯수
		int count = boardService.selectRowCountReply(map);

		PagingUtil page = new PagingUtil(currentPage,count, 5, 5,null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		List<BoardReplyVO> list = null;
		if(count > 0) {
			list = boardService.selectListReply(map);
		}

		Map<String,Object> mapJson = 
				new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", 5);
		mapJson.put("list", list);

		return mapJson;
	}
	
	//댓글 삭제
	@RequestMapping("/detail/deleteReply")
	@ResponseBody
	public Map<String,String> deleteReply(
							@RequestParam("cno") int cno,
							@RequestParam("mem_id") String mem_id,
							HttpSession session){
   
		if(log.isDebugEnabled()) {
			log.debug("<<cno>> : " + cno);
			log.debug("<<mem_id>> : " + mem_id);
		}

		Map<String,String> map = new HashMap<String,String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인이 되어있지 않음
			map.put("result", "logout");
		}else if(user!=null && user.getMem_id()==mem_id) {
			//로그인 되어 있고 로그인한 아이디와 작성자 아이디 일치
			boardService.deleteReply(cno);
			map.put("result", "success");
		}else {
			//로그인 아이디와 작성자 아이디 불일치
			map.put("result", "wrongAccess");
		}		
		return map;
	}
	
	//댓글 수정
	@RequestMapping("/detail/updateReply")
	@ResponseBody
	public Map<String,String> modifyReply(
								BoardReplyVO boardReplyVO,
								HttpSession session,
								HttpServletRequest request){

		if(log.isDebugEnabled()) {
			log.debug("<<boardReplyVO>> : " + boardReplyVO);
		}

		Map<String,String> map = new HashMap<String,String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인이 안 되어있는 경우
			map.put("result", "logout");
		}else if(user!=null && user.getMem_id()==boardReplyVO.getMem_id()){
			//로그인 회원 번호와 작성자 회원번호 일치
			//댓글 수정
			boardService.updateReply(boardReplyVO);
			map.put("result", "success");
		}else {
			//로그인 아이디와 작성자 아이디 불일치
			map.put("result", "wrongAccess");
		}

		return map;
	}

}
