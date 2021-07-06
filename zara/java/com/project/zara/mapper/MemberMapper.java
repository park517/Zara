package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.zara.model.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 멤버 정보 가져오기
	public MemberVO getMember(@Param("mem_id") String mem_id ,@Param("mem_password") String mem_password);
	
	// 마지막 로그인 날짜 수정
	public void updateLoginDate(@Param("mem_no") long mem_no);
	
	// 가입하기
	public void doRegister(Map<String,Object> param);
	
	// 수정하기
	public void doUpdate(Map<String,Object> param);
	
	// 아이디 중복 체크
	public String checkId(String id);
	
	// 아이디 삭제
	public void doDelete(@Param("mem_no") long mem_no);
	
	// 아이디 찾기
	public List<String> findId(Map<String,Object> param);
	
	// 비밀번호 찾기
	public String findPassword(Map<String,Object> param);
	
}
