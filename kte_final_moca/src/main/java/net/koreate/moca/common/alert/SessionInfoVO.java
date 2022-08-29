package net.koreate.moca.common.alert;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class SessionInfoVO {

	private int no; // 회원 번호
	private String id; // 회원 아이디
	private WebSocketSession session; // 웹소켓 세션

}
