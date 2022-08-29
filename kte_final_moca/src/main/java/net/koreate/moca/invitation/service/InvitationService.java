package net.koreate.moca.invitation.service;

import java.util.List;

import net.koreate.moca.invitation.vo.ChatVO;
import net.koreate.moca.invitation.vo.InvParticipantVO;
import net.koreate.moca.invitation.vo.InvitationVO;

public interface InvitationService {

	int regist(InvitationVO vo) throws Exception;

	InvitationVO findByNo(int no) throws Exception;

	List<InvitationVO> findByMember(int member_no) throws Exception;

	int delete(int no) throws Exception;

	int update(InvitationVO vo) throws Exception;

	List<InvParticipantVO> findByCode(int no) throws Exception;

	int deleteParticipant(int no) throws Exception;

	String sendInvite(int no, String id, Object memberInfo) throws Exception;

	int acceptInvite(int inv_no, int participant_no) throws Exception;

	int cancelInvite(int inv_no, int participant_no) throws Exception;

	List<ChatVO> getChatList(int no);

}
