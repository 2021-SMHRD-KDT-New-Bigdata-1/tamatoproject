package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
	private int schedule_idx;
	private String schedule_title;
	private String schedule_content;
	private Date schedule_regdate;

	@Override
	public String toString() {
		return "Schedule [schedule_idx=" + schedule_idx + ", schedule_title=" + schedule_title + ", schedule_content="
				+ schedule_content + ", schedule_regdate=" + schedule_regdate + "]";
	}
}