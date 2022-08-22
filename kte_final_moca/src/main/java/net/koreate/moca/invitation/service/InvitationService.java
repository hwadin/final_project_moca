package net.koreate.moca.invitation.service;

import java.util.List;

import net.koreate.moca.invitation.vo.InvitationVO;

public interface InvitationService {

	int regist(InvitationVO vo) throws Exception;

	InvitationVO findByNo(int no) throws Exception;

	List<InvitationVO> findByMember(int member_no) throws Exception;

	int delete(int no) throws Exception;

	int update(InvitationVO vo) throws Exception;

}
