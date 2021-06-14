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
	private int pno;
	private String mem_id;
	private String pro_category;
	private String pro_name;
	private String pro_info;
	private int pro_price;
	private Double pro_point;
	private int pro_stock;
	private Double pro_weight;
	private String pro_com;
	private String pro_status;
	
	private String pro_date;
	
	private int pro_sum;
	private int pro_hit;
	private String update_at;
}
