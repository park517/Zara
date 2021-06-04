package com.project.zara.service;

import java.util.List;
import java.util.Map;

import com.project.zara.model.CourseVO;

public interface CourseService {
	
	//게시글 수
	public int selectCosRowCount(Integer category);
	
	//게시글 조회
	List<CourseVO> selectCosList(Map<String, Object> map);
	
	//글쓰기
	public void insertCosBoard(CourseVO course);
	
	//글 상세 조회
	public CourseVO selectCosBoard(Integer cos_num);
	
	//글 수정
	public void updateCosBoard(CourseVO course);
	
	//글 삭제
	public void deleteCosBoard(Integer cos_num);
	
	//글 조회수 증가
	public void updateCosHit(Integer cos_num);
   
	

}
