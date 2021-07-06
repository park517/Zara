package com.project.zara.model;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private long mem_no; // 회원 번호
	private String mem_id;  // 회원아이디
	private String mem_password; // 회원 비밀번호
	private String mem_name; // 회원 이름
	private String mem_tel; // 전화번호
	private String mem_email; // 이메일
	private String mem_zip; // 우편번호
	private String mem_road; // 도로명 주소
	private String mem_adrdetail; // 상세 주소
	private String gender; // 성별
	private Date create_at; // 생성일자
	private Date update_at; // 수정일자
	private Date last_login; // 마지막 로그인 일자
	private String delete_flag; // 삭제여부
	private Date delete_at; // 삭제일자
	private int mem_point; //포인트
}
