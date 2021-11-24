package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Farm_work {
	private int work_num;
	private String work_item;
	private int work_quantity;
	private Date reg_date;
	private String member_id;
	private String work_memo;
	private int diary_num;
}
