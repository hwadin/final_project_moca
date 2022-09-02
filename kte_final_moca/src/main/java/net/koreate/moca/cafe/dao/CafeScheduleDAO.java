package net.koreate.moca.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeScheduleVO;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

public interface CafeScheduleDAO {

	@Insert("INSERT INTO tbl_cafe_schedule(start_date,end_date,start_time,end_time) VALUES(#{start_date}, #{end_date},#{start_time}, #{end_time})")
	int regist(CafeScheduleVO vo) throws Exception;
	
	@Select("SELECT * FROM tbl_cafe_schedule WHERE cno = #{cno}")
	CafeScheduleVO read(int cno) throws Exception;
	
	@Update("UPDATE tbl_cafe_schedule SET start_date=#{start_date}, end_date=#{end_date}, start_time=#{start_time}, end_time=#{end_time}")
	int update(CafeScheduleVO vo) throws Exception;
	
	@Delete("DELETE FROM tbl_cafe_schedule WHERE no = #{no}")
	int delete(int no) throws Exception;
	
	 @Select("SELECT C.*, S.start_date, S.end_date, S.start_time, S.end_time FROM " +
	  " tbl_cafe AS C LEFT JOIN tbl_cafe_schedule AS S ON C.no = S.cno " +
	  " WHERE C.addr_detail LIKE CONCAT('%',#{addr_detail},'%') " +
	  " LIMIT #{index}, 4")
	List<CafeVO> searchListbyLo(CafeSearchVO vo);
	 
	@Select("SELECT C.*, S.start_date, S.end_date, S.start_time, S.end_time FROM " +
			  " tbl_cafe AS C LEFT JOIN tbl_cafe_schedule AS S ON C.no = S.cno " +
			  " WHERE S.start_date <= #{start_date} AND S.end_date >= #{end_date} " +
			  " AND #{start_time} between S.start_time and S.end_time " +
			  " LIMIT #{index}, 4")
	List<CafeVO> searchListbyDt(CafeSearchVO vo);
	 
	 
	@Select("SELECT C.*, S.start_date, S.end_date, S.start_time, S.end_time FROM " +
			  " tbl_cafe AS C LEFT JOIN tbl_cafe_schedule AS S ON C.no = S.cno " +
			  " WHERE S.start_date <= #{start_date} AND S.end_date >= #{end_date} " +
			  " AND #{start_time} between S.start_time and S.end_time " +
			  " AND C.addr_detail LIKE CONCAT('%',#{addr_detail},'%') "+
			  " LIMIT #{index}, 4") 
	List<CafeVO> searchListbyLD(CafeSearchVO vo); 
	 
}
