package net.koreate.moca.invitation.service;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.dao.InvitationDAO;
import net.koreate.moca.invitation.vo.ChatVO;
import net.koreate.moca.invitation.vo.InvParticipantVO;
import net.koreate.moca.invitation.vo.InvitationVO;
import net.koreate.moca.member.dao.MemberDAO;
import net.koreate.moca.member.vo.MemberVO;

@Service
@RequiredArgsConstructor
public class InvitationServiceImpl implements InvitationService {

	private final InvitationDAO dao;
	private final MemberDAO memberDao;

	@Override
	public int regist(InvitationVO vo) throws Exception {
		// 랜덤 코드 생성 후 vo에 set 해서 dao 호출
		String code = makeRandCode();
		while (dao.countByCode(code) > 0) {
			code = makeRandCode();
		}
		vo.setCode(code);
		return dao.regist(vo);
	}

	@Override
	public InvitationVO findByNo(int no) throws Exception {
		return dao.findByNo(no);
	}

	@Override
	public List<InvitationVO> findByMember(int member_no) throws Exception {
		return dao.findByMember(member_no);
	}

	@Override
	public int delete(int no) throws Exception {
		return dao.delete(no);
	}

	@Override
	public int update(InvitationVO vo) throws Exception {
		return dao.update(vo);
	}

	private String makeRandCode() {
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();
		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
		return generatedString;
	}

	@Override
	public List<InvParticipantVO> findByCode(int no) throws Exception {

		return dao.findByCode(no);
	}

	@Override
	public int deleteParticipant(int no) throws Exception {
		return dao.deleteParticipant(no);
	}

	@Transactional
	@Override
	public String sendInvite(int no, String id, Object memberInfo) throws Exception {
		String code = findByNo(no).getCode();
		if (memberInfo instanceof MemberVO) {
			int loginMember = ((MemberVO) memberInfo).getNo();
			if (loginMember != (findByNo(no).getMember_no())) {
				return "FORBIDDEN";
			}
		}
		MemberVO member = memberDao.searchId(id);
		if (member != null) {
			int participant_no = memberDao.searchId(id).getNo();
			InvParticipantVO vo = new InvParticipantVO();
			vo.setCode(code);
			vo.setParticipant_no(participant_no);

			if (dao.checkDuplInvite(vo) != null) {
				return "DUPLICATED";
			}

			if (dao.checkSelfInvite(vo) != null) {
				return "SELFINVITED";
			}

			dao.sendRegist(vo);
			return member.getName();
		}
		return null;
	}

	@Override
	public int acceptInvite(int inv_no, int participant_no) throws Exception {
		InvParticipantVO vo = new InvParticipantVO();
		vo.setCode(dao.findByNo(inv_no).getCode());
		vo.setParticipant_no(participant_no);
		return dao.acceptInvite(vo);
	}

	@Override
	public int cancelInvite(int inv_no, int participant_no) throws Exception {
		InvParticipantVO vo = new InvParticipantVO();
		vo.setCode(dao.findByNo(inv_no).getCode());
		vo.setParticipant_no(participant_no);
		return dao.cancelInvite(vo);
	}

	@Override
	public List<ChatVO> getChatList(int no) {
		return dao.getChatList(no);
	}

}
