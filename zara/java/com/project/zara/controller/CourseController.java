package com.project.zara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.CourseVO;
import com.project.zara.service.CourseService;
import com.project.zara.util.PagingUtil;

import lombok.extern.log4j.Log4j;
import sun.nio.cs.HistoricallyNamedCharset;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	//자바빈(VO)초기화
	@ModelAttribute("courseVO")
	public CourseVO initcommand() {
		return new CourseVO();
	}
	
	//카테고리별 게시글 조회
	
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	public ModelAndView getCategoryList(@RequestParam(value="pageNum", defaultValue="1")int currentPage,
										@RequestParam(value="cos_category")int cos_category) {
		
		System.out.println("<<카테고리>> : " + cos_category);
		
		int total = courseService.selectCosRowCount(cos_category);
		PagingUtil page = new PagingUtil(currentPage, total, 6, 6, "getCategoryList", "&cos_category=" + cos_category);
		
		List<CourseVO> list = null;
		if(total > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("cos_category", cos_category);
			list = courseService.selectCosList(map);
		}		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("course/getCategoryList");
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//글 작성하기
	//등록 폼
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String form() {
		return "course/courseWrite";
	}
	
	//전송된 데이터 처리
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String submit(CourseVO course,
						 Model model) {
		
		
		//글쓰기
		courseService.insertCosBoard(course);
		
		
		String msg  = "글이 작성되었습니다";
		String url = "/course/getCategoryList?cos_category="+course.getCos_category();
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/redirect";
	}
	
	//글 읽기
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam int cos_num) {
		CourseVO course = courseService.selectCosBoard(cos_num);
		//조회수 증가
		courseService.updateCosHit(cos_num);
		return new ModelAndView("/course/courseView", "course", course);
	}
	
	//글 수정
	//수정 폼 호출
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String formUpdate(@RequestParam int cos_num, Model model) {
		CourseVO course = courseService.selectCosBoard(cos_num);
		model.addAttribute("courseVO", course);
		
		return "course/courseModify";
	}
	//수정폼에서 전송된 데이터 처리
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String submitUpdate(CourseVO courseVO, Model model) {
		courseService.updateCosBoard(courseVO);
		
		String url = "/course/getCategoryList?cos_category=" + courseVO.getCos_category();
		String msg = "수정 되었습니다";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/redirect";
	}
	
	//글 삭제
	@RequestMapping("/delete")
	public String submitDelete(@RequestParam int cos_num) {
		
		CourseVO course = new CourseVO();
		int cat = course.getCos_category();
		System.out.println("제발제발 출력되라 <<categer>> : "+cat);
		
		courseService.deleteCosBoard(cos_num);
		
		return "";
	}
	
}
