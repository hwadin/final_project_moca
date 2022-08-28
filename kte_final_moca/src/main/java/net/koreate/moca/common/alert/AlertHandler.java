package net.koreate.moca.common.alert;

import java.util.Hashtable;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.dao.InvitationDAO;

@RequiredArgsConstructor
public class AlertHandler extends TextWebSocketHandler {

	// 세션의 아이디를 키 값으로 해당 세션의 정보(회원번호, 회원아이디, 세션)를 저장하는 객체
	private Hashtable<String, SessionInfoVO> alertUser = new Hashtable<>();

	private final InvitationDAO dao;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("알림 웹소켓 접속");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(message.getPayload());

		Gson gson = new Gson();
		AlertVO vo = gson.fromJson(message.getPayload(), AlertVO.class);

		if (vo.getMessage() != null && vo.getMessage().equals("OPENALERTSESSION")) {
			SessionInfoVO sessionVO = new SessionInfoVO();
			sessionVO.setId(vo.getId());
			sessionVO.setSession(session);
			alertUser.put(session.getId(), sessionVO);
		} else {
			System.out.println(vo);
			// 사용자 아이디로 알림 리스트 받아오는 dao 메소드 호출
			vo.setInvitationAlert(dao.getAlertList(vo));
			vo.setMessage("ALERT");
			for (SessionInfoVO si : alertUser.values()) {
				if (si.getId().equals(vo.getId())) {
					si.getSession().sendMessage(new TextMessage(gson.toJson(vo)));
				}
			}
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("알림 웹소켓 종료");
		if (alertUser.containsKey(session.getId())) {
			alertUser.remove(session.getId());
		}
	}

}
