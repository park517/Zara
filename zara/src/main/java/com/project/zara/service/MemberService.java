package com.project.zara.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.MemberVO;

public interface MemberService {
	public MemberVO getMember(String mem_id , String mem_password);
	public void updateLoginDate(@Param("mem_id") String mem_id);
	public void doRegister(Map<String,Object> param);
	public void doUpdate(Map<String,Object> param);
	public String checkId(String id);
	public void doDelete(@Param("id") String id);
	public String findId(Map<String,Object> param);
	public String findPassword(Map<String,Object> param);
}
