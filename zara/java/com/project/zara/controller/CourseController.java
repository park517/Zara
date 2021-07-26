package com.project.zara.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
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

import com.google.gson.JsonObject;
import com.project.zara.model.CourseVO;
import com.project.zara.service.CourseService;
import com.project.zara.util.PagingUtil;
import com.project.zara.util.StringUtil;


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
	
	//전체 게시판 목록 가져오기
		@RequestMapping(value="/getList", method=RequestMethod.GET)
		public ModelAndView process(
				Model model,
				@RequestParam(value="pageNum", defaultValue="1")int currentPage
				){
			int total = courseService.selectRowCount();
			
			PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "getlist");
			
			List<CourseVO> list = null;
			if(total >0) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				list = courseService.selectList(map);
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("course/getList");
			mav.addObject("total", total);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
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
		System.out.println("코스 정보 " +course);
		courseService.insertCosBoard(course);
		
		
		String msg  = "글이 작성되었습니다";
		String url = "/course/getCategoryList?cos_category="+course.getCos_category();
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/redirect";
	}
	
	//서머노트
	@RequestMapping("/summernote")
	public String summernote() {
		return "summernote";
	}
	
	
	//서머노트 이미지업로드부분
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println("파일 저장 위치 : "+fileRoot);
		String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
		String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);   
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
			jsonObject.addProperty("url", "../resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	//글 읽기
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam int cos_num) {
		CourseVO course = courseService.selectCosBoard(cos_num);
		//조회수 증가
		courseService.updateCosHit(cos_num);
		
		//html 태그 불허
		course.setCos_title(StringUtil.useNoHtml(course.getCos_title()));
		course.setCos_content(course.getCos_content());
		
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
	public String submitDelete(@RequestParam int cos_num,Model model) {
		
		String msg = "삭제되었습니다.";
		String url ="/course/getList";
		courseService.deleteCosBoard(cos_num);
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/redirect";
	}
	
	
	
}
