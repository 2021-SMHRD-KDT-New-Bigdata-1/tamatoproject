package com.mycompany.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone_prevention {
	  	private int reservation_Num;
	    private String reservation_Date;
	    private int member_Id;
	    private String proposer_Name;
	    private String proposer_Email;
	    private String proposer_Number;
	    private String proposer_Address;
	    private String land_Type;
	    private int area;
	    private String pesticide;
	    private String pest_Name;
	    private String crop_Name;
}