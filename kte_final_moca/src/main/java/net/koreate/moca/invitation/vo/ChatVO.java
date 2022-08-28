package net.koreate.moca.invitation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {

	private int no; // 채팅 목록 키
	private String invite_code; // 모임 코드
	private int member_no; // 채팅 보낸 사람 회원 번호
	private String message; // 메시지
	private Date time; // 채팅 보낸 시각

	private String name; // 채팅 보낸 사람 이름

}
