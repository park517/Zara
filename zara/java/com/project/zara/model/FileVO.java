package com.project.zara.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
	
	private int fid;
	private int no;
	private String table_name;
	private String file_name;
	private String file_real_name;
	private String file_path;
}
