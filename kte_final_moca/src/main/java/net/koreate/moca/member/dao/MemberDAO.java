package net.koreate.moca.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.member.vo.MemberVO;

public interface MemberDAO {

	// 로그인
	@Select("SELECT * FROM tbl_member WHERE id=#{id} AND pw=#{pw}")
	MemberVO logIn(MemberVO vo) throws Exception;

	// 회원가입
	@Insert("INSERT INTO tbl_member(id,pw,name,age,gender,addr) VALUES(#{id},#{pw},#{name},#{age},#{gender},#{addr})")
	void signUp(MemberVO vo)throws Exception;
	
	// 회원정보 수정 비밀번호,이름, 나이, 주소
	@Update("UPDATE tbl_member SET pw=#{pw}, name=#{name}, age=#{pw}, addr=#{addr} WHERE no =#{no}")
	void memberUpdate(MemberVO vo) throws Exception;

	// id로 회원 검색
	@Select("SELECT * FROM tbl_memeber WHERE id=#{id}")
	MemberVO searchId(String id) throws Exception;

	
}
