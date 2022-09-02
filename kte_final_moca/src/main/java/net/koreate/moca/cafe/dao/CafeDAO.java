package net.koreate.moca.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.common.utils.Criteria;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

public interface CafeDAO {

	// 테스트용 임시
	@Insert("INSERT INTO tbl_cafe(name,addr,addr_detail,owner_no,content,photo_url,tag,flag) VALUES(#{name}, #{addr}, #{addr_detail},#{owner_no},#{content},#{photo_url},#{tag},#{flag})")
	int regist(CafeVO vo) throws Exception;

	@Insert("INSERT INTO tbl_cafe(name,addr,addr_detail,owner_no,content,photo_url,tag,flag) VALUES(#{name}, #{addr}, #{addr_detail},#{owner_no},#{content},#{photo_url},#{tag},#{flag})")
	void origin_regist(CafeVO vo) throws Exception;

	@Select("SELECT C.*, S.start_date, S.end_date, S.start_time, S.end_time FROM " +
			  " tbl_cafe AS C LEFT JOIN tbl_cafe_schedule AS S ON C.no = S.cno " +
			  " LIMIT #{index}, 4")
	List<CafeVO> cafeList(int index) throws Exception;
	
	@Select("SELECT C.*, S.start_date, S.end_date, S.start_time, S.end_time FROM " +
			  " tbl_cafe AS C LEFT JOIN tbl_cafe_schedule AS S ON C.no = S.cno " +
			  " WHERE C.no = #{C.no}")
	CafeVO read(int no) throws Exception;

	@Update("UPDATE tbl_cafe SET addr=#{addr}, addr_detail=#{addr_detail}, content=#{content}, photo_url=#{photo_url}, tag=#{tag}, flag=#{flag}")
	int update(CafeVO vo) throws Exception; 
	
	@Update("UPDATE tbl_cafe SET likenum=likenum+1 WHERE no = #{no}")
	void updatelikenum(int no) throws Exception;
	
	@Update("UPDATE tbl_cafe SET likenum=likenum-1 WHERE no = #{no}")
	void cancellikenum(int no) throws Exception;
	
	@Delete("DELETE FROM tbl_cafe WHERE no = #{no}")
	int delete(int no) throws Exception;

	List<CafeVO> listPage(int no, Criteria cri) throws Exception;

	@Select("SELECT * FROM tbl_cafe WHERE name LIKE CONCAT('%',#{keyword},'%')")
	List<CafeVO> findByKeyword(String keyword);
	
	

		
}
