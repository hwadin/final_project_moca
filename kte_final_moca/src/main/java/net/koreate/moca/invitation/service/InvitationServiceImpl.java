package net.koreate.moca.invitation.service;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.dao.InvitationDAO;
import net.koreate.moca.invitation.vo.InvitationVO;

@Service
@RequiredArgsConstructor
public class InvitationServiceImpl implements InvitationService {

	private final InvitationDAO dao;

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
		return null;
	}

	@Override
	public List<InvitationVO> findByMember(int member_no) throws Exception {
		return dao.findByMember(member_no);
	}

	@Override
	public int delete(int no) throws Exception {
		return 0;
	}

	@Override
	public int update(InvitationVO vo) throws Exception {
		return 0;
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

}
