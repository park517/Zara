package com.project.zara.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.MemberVO;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public MemberVO getMember(String mem_id , String mem_password) {
		if(memberMapper.getMember(mem_id,mem_password) != null) {
			return memberMapper.getMember(mem_id,mem_password);
		}
		return null;
		
	}

	@Override
	public void doRegister(Map<String, Object> param) {
		memberMapper.doRegister(param);
	}

	@Override
	public String checkId(String id) {
		// TODO Auto-generated method stub
		return memberMapper.checkId(id);
	}

	@Override
	public void doUpdate(Map<String, Object> param) {
		
		memberMapper.doUpdate(param);
		
	}

	@Override
	public void doDelete(String id) {
		
		memberMapper.doDelete(id);
		
	}

	@Override
	public void updateLoginDate(String mem_id) {
		memberMapper.updateLoginDate(mem_id);
	}

	@Override
	public String findId(Map<String, Object> param) {
		
		return memberMapper.findId(param);
	}

	@Override
	public String findPassword(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return memberMapper.findPassword(param);
	}

}
