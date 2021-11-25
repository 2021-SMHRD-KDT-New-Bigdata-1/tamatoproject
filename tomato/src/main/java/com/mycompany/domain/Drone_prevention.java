package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone_prevention {
	private int reservation_num;
	private Date reservation_date;
	private Date reservation_start_date;
	private Date reservation_end_date;
	private int company_num;
	private Date reg_date;
	private String member_id;
	private String prevention_done;
}
