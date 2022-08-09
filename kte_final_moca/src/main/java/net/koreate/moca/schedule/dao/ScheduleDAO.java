package net.koreate.moca.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	@Insert("INSERT INTO tbl_member_schedule(member_no, date, start_time, end_time, title, detail) VALUES(#{member_no}, #{date}, #{start_time}, #{end_time}, #{title}, #{detail})")
	void regist(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE member_no = #{member_no} AND date BETWEEN last_day(#{date} - interval 1 month) AND last_day(#{date})")
	List<ScheduleVO> monthScheduleList(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE member_no = #{member_no} AND year(date) = year(#{date}) AND month(date) = month(#{date})")
	List<ScheduleVO> dayScheduleList(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE no = #{no}")
	ScheduleVO read(int no) throws Exception;

	@Update("UPDATE tbl_member_schedule SET date=#{date}, start_time=#{start_time}, end_time=#{end_time}, title=#{title}, detail=#{detail} WHERE no=#{no}")
	void update(ScheduleVO vo) throws Exception;

	@Delete("DELETE FROM tbl_member_schedule WHERE no = #{no}")
	void delete(int no) throws Exception;

}