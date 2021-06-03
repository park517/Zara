package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import com.project.zara.model.ProductVO;

public interface ProductMapper {

	public void insertProduct(ProductVO productVO);
	public List<ProductVO> getProductList(Map<String,Object> map);
	public ProductVO getProduct(int pno);
	public void hitUp(int pno);
	public void deleteProduct(int pno);
	public void updateProduct(ProductVO productVO);
	public int selectRowCount();
}
