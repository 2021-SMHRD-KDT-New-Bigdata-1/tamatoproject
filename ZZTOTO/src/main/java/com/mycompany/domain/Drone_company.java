package com.mycompany.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone_company {
	private int company_num;
	private String company_name;
	private String company_addr;
	private String company_phone;
	private String company_ceo;
	private String company_service;
}