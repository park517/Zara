package com.project.zara.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseVO {
	private int cos_num; //게시판 번호
	private int cos_category; //게시판 카테고리
	private String cos_title; //글 제목
	private String cos_content; //내용
	private int cos_hit; //조회수
	private Date create_at; //생성일
	private Date update_at;//수정일
}
