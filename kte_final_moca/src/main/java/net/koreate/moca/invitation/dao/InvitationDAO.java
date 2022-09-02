package net.koreate.moca.invitation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.common.alert.AlertVO;
import net.koreate.moca.invitation.vo.ChatVO;
import net.koreate.moca.invitation.vo.InvParticipantVO;
import net.koreate.moca.invitation.vo.InvitationVO;

public interface InvitationDAO {

	@Insert("INSERT INTO tbl_invite(code, title, member_no) VALUES(#{code}, #{title}, #{member_no})")
	int regist(InvitationVO vo) throws Exception;

	@Select("SELECT * FROM tbl_invite WHERE no = #{no}")
	InvitationVO findByNo(int no) throws Exception;

	@Select("SELECT DISTINCT i.*,  IF(i.member_no = #{member_no}, null, p.isAccepted) isAccepted, m.name FROM tbl_invite i LEFT JOIN tbl_invite_participant p ON i.code=p.code JOIN tbl_member m ON i.member_no = m.no WHERE i.isExpired = 0 AND i.isReserve = 0 AND (i.member_no=#{member_no} OR p.participant_no=#{member_no})")
	List<InvitationVO> findByMember(int member_no) throws Exception;

	@Delete("DELETE FROM tbl_invite WHERE no=#{no}")
	int delete(int no) throws Exception;

	@Update("UPDATE tbl_invite SET title=#{title} WHERE no=#{no}")
	int update(InvitationVO vo) throws Exception;

	@Select("SELECT count(*) FROM tbl_invite WHERE code=#{code}")
	int countByCode(String code) throws Exception;

	@Select("SELECT p.*, m.name FROM tbl_invite_participant p, tbl_member m WHERE p.participant_no = m.no AND code=(SELECT code FROM tbl_invite WHERE no=#{no})")
	List<InvParticipantVO> findByCode(int no) throws Exception;

	@Delete("DELETE FROM tbl_invite_participant WHERE no = #{no}")
	int deleteParticipant(int no) throws Exception;

	@Insert("INSERT INTO tbl_invite_participant(code, participant_no) VALUES(#{code}, #{participant_no})")
	void sendRegist(InvParticipantVO vo);

	@Select("SELECT * FROM tbl_invite_participant WHERE code=#{code} AND participant_no=#{participant_no}")
	InvParticipantVO checkDuplInvite(InvParticipantVO vo);

	@Select("SELECT * FROM tbl_invite WHERE code=#{code} AND member_no=#{participant_no}")
	InvitationVO checkSelfInvite(InvParticipantVO vo);

	@Update("UPDATE tbl_invite_participant SET isAccepted=1 WHERE code=#{code} AND participant_no=#{participant_no}")
	int acceptInvite(InvParticipantVO vo);

	@Update("UPDATE tbl_invite_participant SET isAccepted=0 WHERE code=#{code} AND participant_no=#{participant_no}")
	int cancelInvite(InvParticipantVO vo);

	@Select("SELECT c.*, m.name FROM tbl_invite_chat c, tbl_member m WHERE member_no = m.no AND invite_code=(SELECT code FROM tbl_invite WHERE no=#{no})")
	List<ChatVO> getChatList(int no);

	@Insert("INSERT INTO tbl_invite_chat(invite_code, member_no, message) VALUES(#{invite_code}, #{member_no}, #{message})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	void sendChat(ChatVO chat) throws Exception;

	@Select("SELECT c.*, m.name FROM tbl_invite_chat c, tbl_member m WHERE c.member_no = m.no AND c.no=#{no}")
	ChatVO getOneChat(ChatVO vo);

	@Select("SELECT * FROM tbl_invite WHERE code IN (SELECT code FROM tbl_invite_participant WHERE participant_no=(SELECT no FROM tbl_member WHERE id=#{id}) AND isAccepted is null)")
	List<InvitationVO> getAlertList(AlertVO vo);
}
