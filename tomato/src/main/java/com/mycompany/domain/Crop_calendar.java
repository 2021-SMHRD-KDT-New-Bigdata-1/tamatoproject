package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Crop_calendar {
	private int calendar_sum;
	private String crop_name;
	private int calendar_month;
	private String crop_guide;
	private String crop_disaster;
	private String pest_guide;
	private Date reg_date;
	private String member_id;
}
