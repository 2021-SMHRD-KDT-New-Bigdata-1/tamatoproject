package com.mycompany.domain;

import java.util.Date;

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

		/*public int getReservation_Num() {
			return reservation_Num;
		}

		public void setReservation_Num(int reservation_Num) {
			this.reservation_Num = reservation_Num;
		}

		public Date getReservation_Date() {
			return reservation_Date;
		}
		

		public void setReservation_Date(Date reservation_Date) {
			this.reservation_Date = reservation_Date;
		}
		public int getProposer_Number() {
			return proposer_Number;
		}

		public void setProposer_Number(int proposer_Number) {
			this.proposer_Number = proposer_Number;
		}*/
	    public int getReservation_Num() {
			return reservation_Num;
		}

		public void setReservation_Num(int reservation_Num) {
			this.reservation_Num = reservation_Num;
		}

		public String getReservation_Date() {
			return reservation_Date;
		}
		

		public void setReservation_Date(String reservation_Date) {
			this.reservation_Date = reservation_Date;
		}
		public String getProposer_Number() {
			return proposer_Number;
		}

		public void setProposer_Number(String proposer_Number) {
			this.proposer_Number = proposer_Number;
		}

		public int getMember_Id() {
			return member_Id;
		}

		public void setMember_Id(int member_Id) {
			this.member_Id = member_Id;
		}

		public String getProposer_Name() {
			return proposer_Name;
		}

		public void setProposer_Name(String proposer_Name) {
			this.proposer_Name = proposer_Name;
		}

		public String getProposer_Email() {
			return proposer_Email;
		}

		public void setProposer_Email(String proposer_Email) {
			this.proposer_Email = proposer_Email;
		}

		

		public String getProposer_Address() {
			return proposer_Address;
		}

		public void setProposer_Address(String proposer_Address) {
			this.proposer_Address = proposer_Address;
		}

		public String getLand_Type() {
			return land_Type;
		}

		public void setLand_Type(String land_Type) {
			this.land_Type = land_Type;
		}

		public int getArea() {
			return area;
		}

		public void setArea(int area) {
			this.area = area;
		}

		public String getPesticide() {
			return pesticide;
		}

		public void setPesticide(String pesticide) {
			this.pesticide = pesticide;
		}

		public String getPest_Name() {
			return pest_Name;
		}

		public void setPest_Name(String pest_Name) {
			this.pest_Name = pest_Name;
		}

		public String getCrop_Name() {
			return crop_Name;
		}

		public void setCrop_Name(String crop_Name) {
			this.crop_Name = crop_Name;
		}

		/*public Drone_prevention(int reservation_Num, Date reservation_Date, String member_Id, String proposer_Name,
				String proposer_Email, int proposer_Number, String proposer_Address, String land_Type, int area,
				String pesticide, String pest_Name, String crop_Name) {
			super();
			this.reservation_Num = reservation_Num;
			this.reservation_Date = reservation_Date;
			this.member_Id = member_Id;
			this.proposer_Name = proposer_Name;
			this.proposer_Email = proposer_Email;
			this.proposer_Number = proposer_Number;
			this.proposer_Address = proposer_Address;
			this.land_Type = land_Type;
			this.area = area;
			this.pesticide = pesticide;
			this.pest_Name = pest_Name;
			this.crop_Name = crop_Name;
		}*/
	    
	    public Drone_prevention() {};
		
}