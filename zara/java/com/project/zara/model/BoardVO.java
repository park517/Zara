package com.project.zara.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int bno; //게시판 번호
	private String mem_id; //사용자 아이디
	private String title; //게시판 제목
	private String content; //게시판 내용
	private String category; //게시판 카테고리
	private Date create_at; //작성일
	private Date update_at; //수정일
	private int hit; //조회수
}
