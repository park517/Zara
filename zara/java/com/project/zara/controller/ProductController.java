package com.project.zara.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {
	
	@RequestMapping(value="/getlist", method=RequestMethod.GET)
	public String getProductList() {
		return "product/list";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String showInserView() {
		return "product/newProduct";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String InsertProduct(Model model , HttpSession session ) {
		return "product/list";
	}
	
	@RequestMapping(value="/get", method=RequestMethod.GET)
	public String getProduct(Model model , HttpSession session ) {
		return "product/get";
	}
	
}
