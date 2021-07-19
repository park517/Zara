package com.project.zara.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonValueFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;


@Data
@AllArgsConstructor
@NoArgsConstructor

public class BoardReplyVO {
	private int cno; //댓글번호
	private int bno; //게시글 번호
	private String mem_id; //회원아이디
	private String content; //댓글 내용
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date create_at; //작성일
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date update_at; //수정일
	private int depth;
	private int parent_no;
}
