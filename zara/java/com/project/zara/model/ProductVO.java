package com.project.zara.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProductVO {
	private int pno; // 상품번호
	private String mem_no; // 유저 번호
	private String pro_category; // 카테고리
	private String pro_name; // 상품 이름
	private String pro_info; // 상품 정보
	private int pro_price; // 상품 가격
	private Double pro_point; // 상품 적립금
	private int pro_stock; // 상품 재고
	private Double pro_weight; // 상품 무게
	private String pro_com; // 상품 제조사
	private String pro_status; //상품 상태
	private Date pro_date; // 상품 등록일
	private Date update_at; // 상품 수정일
	private int pro_sum; // 상품 총 가격
	private String del_yn; // 상품 삭제 여부
	private Date delete_at; // 상품 삭제 일
	private int pro_hit; // 상품 조회 수 

}
