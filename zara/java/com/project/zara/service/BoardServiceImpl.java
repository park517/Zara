package com.project.zara.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.BoardMapper;
import com.project.zara.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getList() {
		
		return boardMapper.getList();
	}

}
