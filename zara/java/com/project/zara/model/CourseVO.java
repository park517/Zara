package com.project.zara.model;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseVO {
	
	private int cos_num; //게시판 번호
	private int cos_category; //게시판 카테고리
	private String mem_id; //관리자 아이디 get
	private String cos_title; //글 제목
	private String cos_content; //내용
	private int hit; //조회수
	private Date create_at; //생성일
	private Date update_at;//수정일


}
