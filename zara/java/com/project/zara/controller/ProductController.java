package com.project.zara.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.zara.model.BoardVO;
import com.project.zara.model.FileVO;
import com.project.zara.model.ProductVO;
import com.project.zara.model.ReplyVO;
import com.project.zara.service.FileService;
import com.project.zara.service.ProductService;
import com.project.zara.service.ReplyService;
import com.project.zara.util.FileUtil;
import com.project.zara.util.PagingUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	ReplyController replyController;
	
	// 상품 게시물 목록 불러오기 (페이징)
	@RequestMapping(value="/getlist", method=RequestMethod.GET)
	public ModelAndView getProductList(
			Model model,
			@RequestParam(value="pageNum", defaultValue="1")int currentPage
			){
		int total = productService.selectRowCount();
		
		PagingUtil page = new PagingUtil(currentPage, total, 10, 10, "getlist");
		
		List<ProductVO> list = null;
		if(total >0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = productService.getProductList(map);
			System.out.println("판매글 리스트" +list);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/getlist");
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
			
		return mav;
	}
	
	// 새 상품 페이지 
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String showInserView() {
		return "product/newProduct";
	}
	
	// 새 상품 등록
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String InsertProduct(@RequestParam("files") MultipartFile files[] ,ProductVO productVO,Model model , HttpSession session ) throws IllegalStateException, IOException {
		
		// 상품 보너스 포인트 , 총가격, 상태 수정하기
	
		productVO.setPro_point((Double.valueOf(String.format("%.1f",productVO.getPro_price()*0.01))));
		productVO.setPro_status("판매중");
		if(productVO.getPro_price() <=50000) {
			productVO.setPro_sum(productVO.getPro_price()+3000);
		}
		int pno =productService.insertProduct(productVO);
		
		
		// 상품 이미지 파일 넣기
		
		List<FileVO> file_list = new ArrayList<>();
		if(files != null && files.length !=0) {
			FileUtil fileUtil = new FileUtil();
			file_list = fileUtil.setFiles(files,pno,"product");
			System.out.println("파일들 : "+file_list);
			fileService.fileUpload(file_list);
		}
		String msg = "상품이 등록되었습니다";
		String url = "/product/getlist";
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect";
	}
	
	
	// 상품 게시물 상세 정보
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getProduct(@RequestParam("pno") int pno , Model model , HttpSession session ) {
		
		// 상품 정보 가져오기
		ProductVO product = productService.getProduct(pno);
		
		// 조회 수 증가
		productService.hitUp(pno);
		
		// 파일 가져오기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("no", pno);
		map.put("table_name","product");
		List<FileVO> fileList = fileService.getFile(map);
	
		//댓글 가져오기
		Map<String,Object> replyList = replyController.getReplyList(pno, 1);
		
		model.addAttribute("reply",replyList);
		model.addAttribute("files",fileList);
		model.addAttribute("product" ,product);
		return "product/detail";
	}
	
	// 업데이트 페이지 보여주기
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String showUpdateProduct(@RequestParam("pno") int pno , Model model)
	{
		ProductVO productVO = productService.getProduct(pno);
		model.addAttribute("product",productVO);
		
		return "product/update"; 
	}
	
	// 업데이트 실행
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateProduct(Model model, ProductVO productVO , @RequestParam("files") MultipartFile files[]) throws IllegalStateException, IOException
	{
		String msg ="수정 되었습니다";
		String url = "/product/detail?pno="+productVO.getPno();
		Map<String,Object> map = new HashMap<String,Object>();
		List<FileVO> file_list = new ArrayList<>();
		map.put("no", productVO.getPno());
		System.out.println("파일의 길이"+files.length);
		System.out.println("파일 "+files.toString());
		map.put("table_name", "product");
		
		// 파일 수정이 있을 때만 기존 파일 삭제하고 다시 넣기
		
		if(!files[0].isEmpty()) {
			fileService.deleteFile(map);
			FileUtil fileUtil = new FileUtil();
			file_list = fileUtil.setFiles(files,productVO.getPno(),"product");
			fileService.fileUpload(file_list);
		}
		productService.updateProduct(productVO);
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/redirect"; 
	}
	
	// 판매글 올리기
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteProduct(Model model ,@RequestParam("pno") int pno) {
		
		// 파일 삭제
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("no", pno);
		map.put("table_name", "product");
		fileService.deleteFile(map);
		
		String msg ="삭제 되었습니다";
		String url = "/product/getlist";
		
		// 상품글 삭제
		productService.deleteProduct(pno);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/redirect";
	}

}
