package com.project.zara.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	
	private long nno;
	private String title;
	private String contents;
	private Date create_at;
	private Date update_at;
	private Date delete_at;
	private String del_yn;
	private int hit;

	
}
