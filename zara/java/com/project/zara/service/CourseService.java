package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.zara.model.CourseVO;

@Service
public interface CourseService {
	
	//카테고리별 게시글 수
	public int selectCosRowCount(Integer cos_category);
	
	//총 게시글 수
	public int selectRowCount();
	
	//전체 게시글 조회
	List<CourseVO> selectList(Map<String, Object> map);
	
	//카테고리별게시글 조회
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

	// 유저별 코스 가져오기
	public List<CourseVO> getcosList(String mem_id);
   
	

}
