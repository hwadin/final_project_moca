package net.koreate.moca.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeVO;

public interface CafeDAO {

	//테스트용 임시
	@Insert("INSERT INTO tbl_cafe(name,addr,addr_detail,owner_no) VALUES(#{name}, #{addr}, #{addr_detail},#{owner_no})")
	int regist(CafeVO vo) throws Exception;
	
	@Insert("INSERT INTO tbl_cafe(name,addr,addr_detail) VALUES(#{name}, #{addr}, #{addr_detail})")
	void origin_regist(CafeVO vo) throws Exception;
	
	@Select("SELECT C.name, C.addr_detail FROM "
			+ " tbl_cafe AS C INNER JOIN tbl_cafe_schedule AS S "
			 + " WHERE S.dayofweek = #{dayofweek}")
	List<CafeVO> cafeList(CafeVO vo) throws Exception;
	
	@Select("SELECT * FROM tbl_cafe WHERE owner_no = #{owner_no}")
	CafeVO read(int owner_no) throws Exception;
	
	@Update("UPDATE tbl_cafe SET addr=#{addr}, addr_detail=#{addr_detail}")
	int update(CafeVO vo) throws Exception; 

	@Delete("DELETE FROM tbl_cafe WHERE no = #{no}")
	int delete(int no) throws Exception;
}
