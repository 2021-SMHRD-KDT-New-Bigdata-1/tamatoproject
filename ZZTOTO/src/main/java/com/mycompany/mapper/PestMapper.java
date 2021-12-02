package com.mycompany.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.domain.Drone_prevention;

// DB ¿¬µ¿
import com.mycompany.domain.DateData;
import com.mycompany.domain.Member;
import com.mycompany.domain.Schedule;

@Mapper
public interface PestMapper {

	public void droneInsert(Drone_prevention vo); // insert SQL

	public Member login(Member member);
	public Member join(Member member);
	public int schedule_add(Schedule schedule);
	public int before_schedule_add_search(Schedule schedule);
	//public ArrayList<Schedule> schedule_list(DateData dateData);

}
