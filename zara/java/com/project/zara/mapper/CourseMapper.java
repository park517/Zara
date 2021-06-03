package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.zara.model.CourseVO;

@Mapper
public interface CourseMapper {

	//카테고리 별 레코드 수
	public int selectRowCount(@Param("category") int category);
	
	//게시글 조회
	public List<CourseVO> selectList(Map<String, Object> map);
	
	//글쓰기
	public void insertBoard(CourseVO course);
	
	//글 상세보기
	public CourseVO selectBoard(Integer cos_num);
	
	//글 수정
	public void updateBoard(CourseVO course);
	
	//글 삭제
	public void deleteBoard(Integer cos_num);
	
	//글 조회수 증가
	public void updateHit(Integer cos_num);
	
}
