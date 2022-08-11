package net.koreate.moca.cafe.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeScheduleVO;

public interface CafeScheduleDAO {

	@Insert("INSERT INTO tbl_cafe_schedule(dayofweek,start_time,end_time) VALUES(#{dayofweek}, #{start_time}, #{end_time})")
	int regist(CafeScheduleVO vo) throws Exception;
	
	@Select("SELECT * FROM tbl_cafe_schedule WHERE cafe_no = #{cafe_no}")
	CafeScheduleVO read(int cafe_no) throws Exception;
	
	@Update("UPDATE tbl_cafe_schedule SET dayofweek=#{dayofweek}, start_time=#{start_time}, end_time=#{end_time}")
	int update(CafeScheduleVO vo) throws Exception;
	
	@Delete("DELETE FROM tbl_cafe_schedule WHERE no = #{no}")
	int delete(int no) throws Exception;
}
