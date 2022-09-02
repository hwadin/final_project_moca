package net.koreate.moca.member.dao;


import org.apache.ibatis.annotations.Delete;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.member.vo.MemberVO;

public interface MemberDAO {

	// 로그인
	@Select("SELECT * FROM tbl_member WHERE id=#{id} AND pw=#{pw}")
	MemberVO logIn(MemberVO vo) throws Exception;

	// 회원가입
	@Insert("INSERT INTO tbl_member(profile_url,id,pw,name,age,gender,post,addr,addr_detail,IsOwner) VALUES(#{profile_url},#{id},#{pw},#{name},#{age},#{gender},#{post},#{addr},#{addr_detail},#{IsOwner})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	void signUp(MemberVO vo) throws Exception;

	// 회원정보 수정 비밀번호,이름, 나이, 주소
	@Update("UPDATE tbl_member SET profile_url=#{profile_url},pw=#{pw}, name=#{name}, age=#{age}, post=#{post},addr=#{addr},addr_detail=#{addr_detail} WHERE no =#{no}")
	void memberUpdate(MemberVO vo) throws Exception;

	// id로 회원 검색
	@Select("SELECT * FROM tbl_member WHERE id=#{id}")
	MemberVO searchId(String id) throws Exception;


	// 비밀번호 확인
	@Select("SELECT * FROM tbl_member WHERE pw=#{pw}")
	MemberVO pwCheck(String pw) throws Exception;
	
	// 회원탈퇴
	@Delete("DELETE FROM tbl_member WHERE no=#{no}")
	void delete(int no) throws Exception;


	// 검색창 키워드로 회원 검색
	@Select("SELECT * FROM tbl_member WHERE id LIKE CONCAT('%',#{keyword},'%') OR name LIKE CONCAT('%',#{keyword},'%')")
	List<MemberVO> findByKeyword(String keyword);

}
