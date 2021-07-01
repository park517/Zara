package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import com.project.zara.model.ProductVO;

public interface ProductMapper {

	// 상품 등록
	public void insertProduct(ProductVO productVO);
	
	// 상품리스트 가져오기
	public List<ProductVO> getProductList(Map<String,Object> map);
	
	// 상품 상세조회
	public ProductVO getProduct(int pno);
	
	// 조회수 증가
	public void hitUp(int pno);
	
	// 상품 삭제
	public void deleteProduct(int pno);
	
	// 상품 수정
	public void updateProduct(ProductVO productVO);
	
	// 상품 갯수
	public int selectRowCount();
	
	// 유저별 상품 갯수
	public int UserProductCount(String mem_id);
	
	// 유저별 상품 가져오기
	public List<ProductVO> getUserProduct(Map<String,Object> map);

}
