package com.mycompany.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.domain.Drone_prevention;

// DB ¿¬µ¿
import com.mycompany.domain.Crop_calendar;
import com.mycompany.domain.Member;

@Mapper
public interface PestMapper {


	public void droneInsert(Drone_prevention vo); // insert SQL

	public Member login(Member member);
	public Member join(Member member);
	public void schedule_add(Crop_calendar calendar);

	
}
