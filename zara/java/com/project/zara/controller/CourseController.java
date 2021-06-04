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
	
	
	
}
