package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.MemberVO;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	// 멤버 정보 가져오기
	@Override
	public MemberVO getMember(String mem_id , String mem_password) {
		if(memberMapper.getMember(mem_id,mem_password) != null) {
			return memberMapper.getMember(mem_id,mem_password);
		}
		return null;
		
	}

	// 회원가입
	@Override
	public long doRegister(MemberVO memberVO) {
		memberMapper.doRegister(memberVO);
		return memberVO.getMem_no();
	}

	// 아이디 중복 체크
	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		return memberMapper.checkId(id);
	}

	// 정보 수정
	@Override
	public void doUpdate(Map<String, Object> param) {
		
		memberMapper.doUpdate(param);
		
	}

	// 삭제
	@Override
	public void doDelete(long mem_no) {
		
		memberMapper.doDelete(mem_no);
		
	}

	// 회원 로그인 날짜 수정
	@Override
	public void updateLoginDate(long mem_no) {
		memberMapper.updateLoginDate(mem_no);
	}

	// 아이디 찾기
	@Override
	public List<String> findId(Map<String, Object> param) {
		
		return memberMapper.findId(param);
	}

	// 비밀번호 찾기
	@Override
	public String findPassword(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return memberMapper.findPassword(param);
	}

	// 권한 부여
	@Override
	public void insertAuth(long mem_no) {
		// TODO Auto-generated method stub
		memberMapper.insertAuth(mem_no);
	}

}
