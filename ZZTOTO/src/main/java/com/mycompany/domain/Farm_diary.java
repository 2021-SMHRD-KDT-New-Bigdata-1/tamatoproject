package com.mycompany.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Farm_diary {
	private int diary_num;
	private String diary_subject;
	private String diary_content;
	private String issue;
	private String reg_date;
	private String member_id;
}