package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_pest {
	private int m_pest_num;
	private String m_pest_question;
	private Date regdate;
	private int member_id;

}