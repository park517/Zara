package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.MemberVO;

public interface MemberService {
	// 멤버 정보 가져오기
	public MemberVO getMember(String mem_id);
	
	// 마지막 로그인 날짜 수정
	public void updateLoginDate(@Param("mem_no") long mem_no);
	
	// 회원가입
	public long doRegister(MemberVO memberVO);
	
	// 회원 수정
	public void doUpdate(Map<String,Object> param);
	
	// 중복 체크
	public int checkId(String id);
	
	// 회원 탈퇴
	public void doDelete(@Param("mem_no") long mem_no);
	
	// 아이디 찾기
	public List<String> findId(Map<String,Object> param);
	
	// 비밀번호 찾기
	public String findPassword(Map<String,Object> param);
	
	// 권한 부여하기
	public void insertAuth(long mem_no);
}
