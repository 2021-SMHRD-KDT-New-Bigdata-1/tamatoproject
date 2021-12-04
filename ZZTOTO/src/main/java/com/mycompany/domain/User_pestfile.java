package com.mycompany.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_pestfile {
	private int m_pest_num;
	private String reg_date;
	private String member_id;
	private String uploadPath;
	private String uuid;
	private String fileName;
}