package com.project.zara.mapper;

import java.util.List;

import com.project.zara.model.NoticeVO;

public interface NoticeMapper {
	
	// 공지사항 등록
	public void insertNotice(NoticeVO noticeVO);
	
	// 공지사항 수정
	public void updateNotice(NoticeVO noticeVO);
	
	// 공지사항 삭제
	public void deleteNotice(long nno);
	
	// 공지사항 목록 가져오기
	public List<NoticeVO> getNoticeList();
	
	// 공지사항 정보 가져오기
	public NoticeVO getNotice(long nno);
}
