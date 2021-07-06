package com.project.zara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.BoardVO;
import com.project.zara.model.CourseVO;
import com.project.zara.model.MemberVO;
import com.project.zara.model.ProductVO;
import com.project.zara.service.BoardService;
import com.project.zara.service.CourseService;
import com.project.zara.service.MemberService;
import com.project.zara.service.ProductService;
import com.project.zara.util.PagingUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MemberController {
	
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productSerivce;
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	BoardService boardService;
	
	// 로그인 페이지 보여주기
	@RequestMapping(path = "/login", method=RequestMethod.GET)
	public String showLogin() {
		
		return "user/login";
	}
	
	
	// 로그인 시도
	@RequestMapping(path = "/login", method=RequestMethod.POST)
	@ResponseBody
	public String doLogin(HttpSession session, Model model ,@RequestParam("id") String id ,@RequestParam("password") String password ) {
		
		MemberVO member = memberService.getMember(id, password);
		
		if(member !=null) {
			memberService.updateLoginDate(member.getMem_no());
			session.setAttribute("loginMember",member);
			return "good";
		}
		return "error";
	}
	
	// 로그아웃 
	@RequestMapping(path = "/logout", method=RequestMethod.GET) 
	public String logout(HttpSession session, Model model) {
		String msg = "로그아웃 되었습니다.";
		String back = "back";
		session.removeAttribute("loginMember");
		model.addAttribute("msg",msg);
		model.addAttribute("back",back);
		return "common/redirect";
	}
	
	// 회원가입 페이지 보여주기
	@RequestMapping(path = "/register", method=RequestMethod.GET)
	public String Register() {
		return "user/register";
	}
	
	// 회원가입 시 중복 체크
	@RequestMapping(path = "/checkId", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam("id") String id){
		return memberService.checkId(id);
	}
	
	// 회원가입 시도
	@RequestMapping(path = "/register", method=RequestMethod.POST)
	public String doRegister(@RequestParam Map<String,Object> param ,Model model) {
		
		String msg = "회원가입에 성공하셨습니다.";
		String url = "/";
		memberService.doRegister(param);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/redirect";
	}
	
	
	// 정보 수정 시 비밀번호 체크 페이지 보여주기
	@RequestMapping(path = "/checkPassword", method=RequestMethod.GET)
	public String checkPassword() {
		return "user/checkPassword";
	}
	
	// ajax로 비밀번호 받아서 맞는지 비교하기 
	@RequestMapping(path = "/checkPassword", method=RequestMethod.POST)
	@ResponseBody
	public String checkPassword(@RequestParam("password") String password, HttpSession session ) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String current_password = member.getMem_password();
		if(password.equals(current_password)) {
			return "good";
		}
		
		return "error";
	}
	
	// Mypage 이동
	@RequestMapping(path = "/myPage", method=RequestMethod.GET)
	public String myPage() {
		return "user/mypage";
	}
	
	// 업데이트 페이지 보여주기
	@RequestMapping(path = "/update", method=RequestMethod.GET)
	public String showUpdate() {
		return "user/updateMember";
	}
	
	// 업데이트 시도 
	@RequestMapping(path = "/update", method=RequestMethod.POST)
	public String doUpdate(@RequestParam Map<String,Object> param ,Model model , HttpSession session) {
		session.removeAttribute("loginMember");
		String msg = "정보 수정에 성공하셨습니다. 다시 로그인 부탁드립니다욧!";
		String url = "/";
		memberService.doUpdate(param);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/redirect";
	}
	
	// 계정 삭제 구현 
	@RequestMapping(path = "/delete", method=RequestMethod.GET)
	public String doDelete(HttpSession session ,Model model) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		long mem_no = member.getMem_no();
		String msg = mem_no+" 계정이 삭제 되었습니다.";
		String url = "/";
		
		memberService.doDelete(mem_no);
		
		session.removeAttribute("loginMember");
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect";
	}
	
	
	// ID 및 Password 찾는 페이지 보여주기
	@RequestMapping(path = "/find", method=RequestMethod.GET)
	public String findAccount() {
			
		return "user/findAccount";
	}
	
	// ID 찾기
	@RequestMapping(path = "/findId", method=RequestMethod.POST)
	@ResponseBody
	public List<String> findId(@RequestParam Map<String,Object> param) {
		return memberService.findId(param);
	}
	
	// 비밀번호 찾기
	@RequestMapping(path = "/findPassword", method=RequestMethod.POST)
	@ResponseBody
	public String findPassword(@RequestParam Map<String,Object> param) {
		return memberService.findPassword(param);
	}
	
	
	//내가 작성한 상품 글 가져오기 
	@RequestMapping(value="/getProdutList/{mem_id}", method=RequestMethod.GET)
	public String getProductList(
			Model model,
			@RequestParam(value="pageNum", defaultValue="1")int currentPage,
			@PathVariable("mem_id") String mem_id
			){
		int total = productSerivce.UserProductCount(mem_id);
		
		PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "getProdutList/"+mem_id);
		
		List<ProductVO> list = null;
		if(total >0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("mem_id", mem_id);
			list = productSerivce.getProductList(map);
		}
		ModelAndView mav = new ModelAndView();
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		model.addAttribute("pagingHtml", page.getPagingHtml());

		return "user/userWriteList";
	}
	
	
	
}
