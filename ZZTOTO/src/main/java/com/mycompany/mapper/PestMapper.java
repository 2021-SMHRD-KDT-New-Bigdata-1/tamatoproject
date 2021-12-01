package com.mycompany.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.domain.Drone_prevention;

// DB ¿¬µ¿
@Mapper
public interface PestMapper {

	public void droneInsert(Drone_prevention vo); // insert SQL
	
}
