package com.mycompany.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String member_id;
	private String member_pwd;
	private String member_qr;
	private String member_name;
	private String member_addr;
	private String member_phone;
	private Date member_joindate;
	private String admin_yn;
}