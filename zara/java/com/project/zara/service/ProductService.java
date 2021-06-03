package com.project.zara.service;

import java.util.List;
import java.util.Map;

import com.project.zara.model.ProductVO;

public interface ProductService {
	
	public int insertProduct(ProductVO productVO);
	public List<ProductVO> getProductList(Map<String,Object> map);
	public ProductVO getProduct(int pno);
	public void hitUp(int pno);
	public void deleteProduct(int pno);
	public void updateProduct(ProductVO productVO);
	public int selectRowCount();
 
}
