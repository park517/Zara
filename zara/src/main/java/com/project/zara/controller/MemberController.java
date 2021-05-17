package com.project.zara.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.MemberVO;
import com.project.zara.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MemberController {
	
	
	@Autowired
	MemberService memberService;
	
	
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
			memberService.updateLoginDate(id);
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
	
	// 업데이트 페이지 보여주기
	@RequestMapping(path = "/update", method=RequestMethod.GET)
	public String showUpdate() {
		return "user/updateMember";
	}
	
	// 업데이트 시도 
	@RequestMapping(path = "/update", method=RequestMethod.POST)
	public String doUpdate(@RequestParam Map<String,Object> param ,Model model) {
		
		String msg = "정보 수정에 성공하셨습니다.";
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
		String mem_id = member.getMem_id();
		String msg = mem_id+" 계정이 삭제 되었습니다.";
		String url = "/";
		
		
		memberService.doDelete(mem_id);
		
		session.removeAttribute("loginMember");
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect";
	}
	
	
	
	
}
