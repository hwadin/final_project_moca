package net.koreate.moca.member.service;

import net.koreate.moca.member.vo.MemberVO;

public interface MemberService {
	
	// 로그인
	MemberVO logIn(MemberVO vo) throws Exception;
	
	// 회원가입
	void signUp(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	void memberUpdate(MemberVO vo) throws Exception;

}
