package com.project.zara.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardReplyVO {
	public int cno; //댓글번호
	public int bno; //게시글 번호
	public String mem_id; //회원아이디
	public String content; //댓글 내용
	public DATE create_at; //작성일
	public DATE update_at; //수정일
}
