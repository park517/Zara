package com.project.zara.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.TestMapper;
import com.project.zara.model.Test;
@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	TestMapper testMapper;
	@Override
	public List<Test> getTest() {
		// TODO Auto-generated method stub
		return testMapper.getTest();
	}

}
