package com.mycompany.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.domain.Member;

// DB ����
@Mapper
public interface PestMapper {

	public Member login(Member member);
	
}
