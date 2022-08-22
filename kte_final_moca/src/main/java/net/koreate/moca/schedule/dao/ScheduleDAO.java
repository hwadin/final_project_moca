package net.koreate.moca.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	@Insert("INSERT INTO tbl_member_schedule(member_no, start, end, title, detail, allDay) VALUES(#{member_no}, #{start}, #{end}, #{title}, #{detail}, #{allDay})")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int regist(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE member_no = #{member_no}")
	List<ScheduleVO> monthScheduleList(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE member_no = #{member_no} AND year(date) = year(#{date}) AND month(date) = month(#{date})")
	List<ScheduleVO> dayScheduleList(ScheduleVO vo) throws Exception;

	@Select("SELECT * FROM tbl_member_schedule WHERE id = #{no}")
	ScheduleVO read(int no) throws Exception;

	@Update("UPDATE tbl_member_schedule SET start=#{start}, end=#{end}, title=#{title}, detail=#{detail}, allDay = #{allDay} WHERE id=#{id}")
	void update(ScheduleVO vo) throws Exception;

	@Delete("DELETE FROM tbl_member_schedule WHERE id = #{no}")
	void delete(int no) throws Exception;

}
