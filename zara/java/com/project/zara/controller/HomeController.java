package com.project.zara.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.zara.model.BoardVO;
import com.project.zara.model.ProductVO;
import com.project.zara.service.BoardService;
import com.project.zara.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		// 게시판 글 가져오기
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 4);
		List<BoardVO> boardList = boardService.selectList(map);
		
		// 자전거 상품 글 가져오기
		List<ProductVO> productList = productService.getProductList(map);
		System.out.println("상품 리스트 : "+productList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("productList",productList);
		
		return "index";
	}
	
}
