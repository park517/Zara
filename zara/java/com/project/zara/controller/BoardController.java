package com.project.zara.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.BoardReplyVO;
import com.project.zara.model.BoardVO;
import com.project.zara.model.FileVO;
import com.project.zara.model.MemberVO;
import com.project.zara.service.BoardService;
import com.project.zara.service.FileService;
import com.project.zara.util.FileUtil;
import com.project.zara.util.PagingUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	BoardService boardService;
	
	@Autowired
	FileService fileService;
	
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
			@RequestParam(value="category") String category
			){
		
		System.out.println("카테고리 : "+category);
		
		int total = boardService.CategoryRowCount(category);
		
		PagingUtil page = new PagingUtil(category,currentPage, total, 10, 10, "getCategoryList");
		
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
	public String doWrite(@RequestParam("files") MultipartFile files[],BoardVO board , Model model) throws IllegalStateException, IOException {
		
		List<FileVO> file_list = new ArrayList<>();
		
		// 글 insert 후 생성된 글 번호 가져오기
		int bno = boardService.insertBoard(board);
		System.out.println("파일목록 : "+files);
		if(files != null && files.length !=0) {
			FileUtil fileUtil = new FileUtil();
			file_list = fileUtil.setFiles(files, bno ,"board");
			System.out.println("파일들 : "+file_list);
			fileService.fileUpload(file_list);
		}
		
	
		String msg  = "글이 작성되었습니다";
		String url = "/board/getCategoryList?category="+board.getCategory();
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/redirect";
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
		
		//댓글 가져오깅
		List<BoardReplyVO> boardReplyList = (List<BoardReplyVO>)getList(1,bno).get("list");
		int totalReplyPageNum = (int)getList(1,bno).get("totalPageNum");
		mav.addObject("totalPageNum",totalReplyPageNum);
		mav.addObject("boardReply",boardReplyList);
		
		// 파일 가져오기
        Map<String,Object> map = new HashMap<>();
        map.put("no", bno);
        map.put("table_name", "board");
		List<FileVO> fileList = fileService.getFile(map);
		mav.addObject("fileList",fileList);
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
	
	
	
	//사이트소개
	@RequestMapping(value="/hello", method=RequestMethod.GET)
	public String showHello() {
	
		return "board/hello";
	
	}
	
	
//=================================댓글=================================//
	
	
	//댓글 작성하기
	@RequestMapping("/detail/writeReply")
	@ResponseBody
	public void writeReply( BoardReplyVO boardReplyVO, HttpSession session,
							HttpServletRequest request)
	{

		System.out.println("댓글 : "+boardReplyVO);
		boardService.insertReply(boardReplyVO);

	}
	
	//댓글 목록
	@RequestMapping("/detail/listReply")
	@ResponseBody
	public Map<String,Object> getList(
									   @RequestParam(value="pageNum",defaultValue="1")
									   int currentPage,
									   @RequestParam("bno") int bno
									 )
	{
		//(******주의)댓글 좋아요 처리시만 HttpSession 넣을 것
		if(log.isDebugEnabled()) {
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<bno>> : " + bno);
		}

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);

		//총 글의 갯수
		int count = boardService.selectRowCountReply(bno);
		
		// 총 글 갯수로 부터 총 페이지 갯수 구하기
		int totalPageNum = (count+4)/5;

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
		mapJson.put("totalPageNum", totalPageNum);
		mapJson.put("list", list);
		

		return mapJson;
	}
	
	//댓글 삭제
	@RequestMapping("/detail/deleteReply")
	@ResponseBody
	public String deleteReply(
							@RequestParam("cno") int cno,
							HttpSession session){
		boardService.deleteReply(cno);
		String msg = "댓글이 삭제되었습니다!";
		return msg;
	}
	
	//댓글 수정
	@RequestMapping("/detail/updateReply")
	@ResponseBody
	public String modifyReply(
								@RequestParam("cno") int cno,
								@RequestParam("content") String content,
								HttpSession session,
								HttpServletRequest request){

		boardService.updateReply(cno,content);
		return "댓글 수정완료";
	}

}
