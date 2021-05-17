package com.project.zara.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.zara.model.MemberVO;

@Mapper
public interface MemberMapper {
	
	public MemberVO getMember(@Param("mem_id") String mem_id ,@Param("mem_password") String mem_password);
	public void updateLoginDate(String mem_id);
	public void doRegister(Map<String, Object> param);
	public void doUpdate(Map<String,Object> param);
	public String checkId(@Param("id") String id);
	public void doDelete(@Param("id") String id);

}
