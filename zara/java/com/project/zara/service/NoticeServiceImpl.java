package com.project.zara.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.zara.mapper.NoticeMapper;
import com.project.zara.model.NoticeVO;

@Service

public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public void insertNotice(NoticeVO noticeVO) {
		
		noticeMapper.insertNotice(noticeVO);
		
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		
		noticeMapper.updateNotice(noticeVO);
		
	}

	@Override
	public void deleteNotice(long nno) {

		noticeMapper.deleteNotice(nno);
		
	}

	@Override
	public List<NoticeVO> getNoticeList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeList(map);
	}

	@Override
	public NoticeVO getNotice(long nno) {
		
		noticeMapper.hitUp(nno);
		
		return noticeMapper.getNotice(nno);
	}

	@Override
	public int NoticeCount() {
		// TODO Auto-generated method stub
		return noticeMapper.NoticeCount();
	}
	

}
