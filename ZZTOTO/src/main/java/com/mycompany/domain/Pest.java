package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pest {
	private int pest_num;
	private String pest_name;
	private String pest_symptom;
	private String pest_solution;
	private Date reg_date;
	private String member_id;
}