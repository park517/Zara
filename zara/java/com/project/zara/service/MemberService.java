package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.zara.model.MemberVO;

public interface MemberService {
	public MemberVO getMember(String mem_id , String mem_password);
	public void updateLoginDate(@Param("mem_no") long mem_no);
	public void doRegister(Map<String,Object> param);
	public void doUpdate(Map<String,Object> param);
	public int checkId(String id);
	public void doDelete(@Param("mem_no") long mem_no);
	public List<String> findId(Map<String,Object> param);
	public String findPassword(Map<String,Object> param);
}
