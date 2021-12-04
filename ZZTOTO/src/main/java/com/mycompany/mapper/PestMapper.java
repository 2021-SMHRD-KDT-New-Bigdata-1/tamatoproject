package com.mycompany.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.domain.DateData;
import com.mycompany.domain.Drone_prevention;
import com.mycompany.domain.Farm_diary;
// DB ¿¬µ¿
import com.mycompany.domain.Member;
import com.mycompany.domain.Schedule;

@Mapper
public interface PestMapper {

	public Member login(Member member);
	public Member join(Member member);
	public int schedule_add(Schedule schedule);
	public int before_schedule_add_search(Schedule schedule);
	public ArrayList<Schedule> schedule_list(DateData dateData);

	public void droneInsert(Drone_prevention vo); // insert SQL
	public List<Farm_diary> Farm_diaryList();
	@Select("select * from members where member_id=#{member_id}")
	   public Member FarmLogin(Member member);
	
	@Delete("delete from farm_diaries where diary_num=#{diary_num}")
	public void diaryDeleteAjax(int diary_num);
	
	@Insert("insert into farm_diaries (diary_subject, diary_content, issue, reg_date, member_id) VALUES (#{diary_subject}, #{diary_content}, #{issue}, NOW(), #{member_id})")
	public void diaryInsertAjax(Farm_diary vo);
  	
  	@Update("update farm_diaries set diary_subject=#{diary_subject} where diary_num=#{diary_num}")
	public void diaryUpdateAjax(Farm_diary vo); // XML(X) -> update SQL~
  	
  	@Update("update farm_diaries set diary_content=#{diary_content}, issue=#{issue} where diary_num=#{diary_num}")
	public void diaryUpdateAjax1(Farm_diary vo); // XML(X) -> update SQL~

}
