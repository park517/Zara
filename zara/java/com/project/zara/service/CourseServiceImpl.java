package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.zara.mapper.CourseMapper;
import com.project.zara.model.CourseVO;

public class CourseServiceImpl implements CourseService {

	//의존관계
	@Autowired
	CourseMapper courseMapper;
	
	//레코드 수
	@Override
	public int selectCosRowCount(Integer category) {
		return courseMapper.selectCosRowCount(category);
	}

	//글 목록
	@Override
	public List<CourseVO> selectCosList(Map<String, Object> map) {
		return courseMapper.selectCosList(map);
	}

	//글쓰기
	@Override
	public void insertCosBoard(CourseVO course) {
		courseMapper.insertCosBoard(course);
	}

	//글 상세 조회
	@Override
	public CourseVO selectCosBoard(Integer cos_num) {
		return courseMapper.selectCosBoard(cos_num);
	}

	//글 수정
	@Override
	public void updateCosBoard(CourseVO course) {
		courseMapper.updateCosBoard(course);
	}

	//글 삭제
	@Override
	public void deleteCosBoard(Integer cos_num) {
		courseMapper.deleteCosBoard(cos_num);
	}

	//조회수 증가
	@Override
	public void updateCosHit(Integer cos_num) {
		courseMapper.updateCosHit(cos_num);
	}

}
