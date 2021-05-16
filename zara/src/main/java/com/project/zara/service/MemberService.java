package com.project.zara.service;

import java.util.Map;

import com.project.zara.model.MemberVO;

public interface MemberService {
	public MemberVO getMember(String mem_id , String mem_password);
	public void doRegister(Map<String,Object> param);
	public String checkId(String id);
	
}
