package com.mycompany.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone_prevention {
		// ���� ����
	  	private int reservation_Num;

		// ���� ��¥ 
	    private String reservation_Date;

	    // ��û�� ���̵� 
	    private int member_Id;

	    // ��û�� �̸� 
	    private String proposer_Name;

	    // ��û�� �̸��� 
	    private String proposer_Email;

	    // ��û�� ��ȣ 
	    private String proposer_Number;

	    // ��û�� �ּ� 
	    private String proposer_Address;

	    // ���� ���� 
	    private String land_Type;

	    // ���� 
	    private int area;

	    // ��� ���� 
	    private String pesticide;

	    // ���� 
	    private String pest_Name;

	    // �۹��� 
	    private String crop_Name;

		
}