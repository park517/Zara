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
	public int selectRowCount(Integer category) {
		return courseMapper.selectRowCount(category);
	}

	//글 목록
	@Override
	public List<CourseVO> selectList(Map<String, Object> map) {
		return courseMapper.selectList(map);
	}

	//글쓰기
	@Override
	public void insertBoard(CourseVO course) {
		courseMapper.insertBoard(course);
	}

	//글 상세 조회
	@Override
	public CourseVO selectBoard(Integer cos_num) {
		return courseMapper.selectBoard(cos_num);
	}

	//글 수정
	@Override
	public void updateBoard(CourseVO course) {
		courseMapper.updateBoard(course);
	}

	//글 삭제
	@Override
	public void deleteBoard(Integer cos_num) {
		courseMapper.deleteBoard(cos_num);
	}

	//조회수 증가
	@Override
	public void updateHit(Integer cos_num) {
		courseMapper.updateHit(cos_num);
	}

}
