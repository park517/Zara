package com.project.zara.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("/login")
	public String Login() {
		return "user/login";
	}
	
	@PostMapping("/do-login")
	@ResponseBody
	public String doLogin(Model model ,@RequestParam("id") String id ,@RequestParam("password") String password ) {
		System.out.println("id : "+id );
		System.out.println("password : "+password );
		
		return "good";
	}
	
	@GetMapping("/register")
	public String Register() {
		return "user/register";
	}
	
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(){
		return "good";
	}
	
	@PostMapping("/do-register")
	public String doRegister() {
	
		return "index";
	}
}
