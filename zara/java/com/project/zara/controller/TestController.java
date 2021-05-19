package com.project.zara.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.zara.model.Test;
import com.project.zara.service.TestService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/test")

public class TestController {
	
	@Autowired
	TestService testService;
	
	@GetMapping("")
	public void getTest(Model model) {
		List<Test> testList = testService.getTest();
		
		for(Test test : testList) {
			System.out.println("test : "+test);
		}
		model.addAttribute("testList",testList);
		
	}
}
