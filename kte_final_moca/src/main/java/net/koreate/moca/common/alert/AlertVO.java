package net.koreate.moca.common.alert;

import java.util.List;

import lombok.Data;
import net.koreate.moca.invitation.vo.InvitationVO;

@Data
public class AlertVO {

	private int no; // 회원의 번호
	private String id; // 회원의 아이디
	private String message;
	private List<InvitationVO> invitationAlert; // 해당 회원을 초대한 모임 목록

}
