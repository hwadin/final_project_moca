package net.koreate.moca.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeMenuVO;

public interface CafeMenuDAO {

	@Insert("INSERT INTO tbl_cafe_menu(name,price,discount,photo_url) VALUES(#{name}, #{price}, #{discount},#{photo_url})")
	int regist(CafeMenuVO vo) throws Exception;
	
	@Select("SELECT * FROM tbl_cafe_menu WHERE cafe_no = #{cafe_no}")
	List<CafeMenuVO> menuList(int cafe_no) throws Exception;
	
	@Update("UPDATE tbl_cafe_menu SET name=#{name}, price=#{price}, discount=#{discount}, photo_url=#{photo_url}")
	int update(CafeMenuVO vo) throws Exception; 

	@Delete("DELETE FROM tbl_cafe_menu WHERE no = #{no}")
	int delete(int no) throws Exception;
}
