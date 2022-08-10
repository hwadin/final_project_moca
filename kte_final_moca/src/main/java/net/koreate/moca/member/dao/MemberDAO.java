package net.koreate.moca.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.moca.member.vo.MemberVO;

public interface MemberDAO {

	// 로그인
	@Select("SELECT * FROM tbl_member WHERE id=#{id} AND pw=#{pw}")
	MemberVO logIn(MemberVO vo) throws Exception;

	// 회원가입
	@Insert("INSERT INTO tbl_member(id,pw,name,age,gender,addr) VALUES(#{id},#{pw},#{name},#{age},#{gender},#{addr})")
	void signUp(MemberVO vo)throws Exception;

	// id로 검색
	MemberVO searchId(String id);
	
}
