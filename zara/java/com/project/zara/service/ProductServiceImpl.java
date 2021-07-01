package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.ProductMapper;
import com.project.zara.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	
	@Autowired
	ProductMapper productMapper;
	
	// 글 등록
	@Override
	public int insertProduct(ProductVO productVO) {
		productMapper.insertProduct(productVO);
		return productVO.getPno();
	}

	//글 목록 가져오기
	@Override
	public List<ProductVO> getProductList(Map<String,Object> map) {
		return productMapper.getProductList(map);
	}

	
	// 글 가져오기
	@Override
	public ProductVO getProduct(int pno) {
		// TODO Auto-generated method stub
		return productMapper.getProduct(pno);
	}

	// 조회수 증가
	@Override
	public void hitUp(int pno) {
		
		productMapper.hitUp(pno);
		
	}

	// 글 삭제
	@Override
	public void deleteProduct(int pno) {
		
		productMapper.deleteProduct(pno);
	}

	// 글 수정
	@Override
	public void updateProduct(ProductVO productVO) {
		productMapper.updateProduct(productVO);
	}

	// 상품 갯수 
	@Override
	public int selectRowCount() {
		// TODO Auto-generated method stub
		return productMapper.selectRowCount();
	}

	
	// 유저별 상품 갯수
	@Override
	public int UserProductCount(String mem_id) {
		// TODO Auto-generated method stub
		return productMapper.UserProductCount(mem_id);
	}

	
	// 유저별 상품 조회 
	@Override
	public List<ProductVO> getUserProduct(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return productMapper.getUserProduct(map);
	}

}
