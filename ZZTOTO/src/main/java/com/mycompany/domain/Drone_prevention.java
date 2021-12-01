package com.mycompany.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone_prevention {
		// 예약 순번
	  	private int reservation_Num;

		// 예약 날짜 
	    private String reservation_Date;

	    // 신청자 아이디 
	    private int member_Id;

	    // 신청자 이름 
	    private String proposer_Name;

	    // 신청자 이메일 
	    private String proposer_Email;

	    // 신청자 번호 
	    private String proposer_Number;

	    // 신청자 주소 
	    private String proposer_Address;

	    // 논지 종류 
	    private String land_Type;

	    // 면적 
	    private int area;

	    // 농약 보유 
	    private String pesticide;

	    // 병명 
	    private String pest_Name;

	    // 작물명 
	    private String crop_Name;

		
}