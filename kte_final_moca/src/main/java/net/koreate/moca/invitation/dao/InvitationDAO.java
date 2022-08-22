package net.koreate.moca.invitation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.moca.invitation.vo.InvitationVO;

public interface InvitationDAO {

	@Insert("INSERT INTO tbl_invite(code, title, member_no) VALUES(#{code}, #{title}, #{member_no})")
	int regist(InvitationVO vo) throws Exception;

	InvitationVO findByNo(int no) throws Exception;

	@Select("SELECT DISTINCT i.*, p.isAccepted FROM tbl_invite i LEFT JOIN tbl_invite_participant p ON i.code=p.code WHERE i.member_no=#{member_no} OR p.participant_no=#{member_no}")
	List<InvitationVO> findByMember(int member_no) throws Exception;

	int delete(int no) throws Exception;

	int update(InvitationVO vo) throws Exception;

	@Select("SELECT count(*) FROM tbl_invite WHERE code=#{code}")
	int countByCode(String code) throws Exception;
}
