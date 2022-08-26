package net.koreate.moca.invitation.chat;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.dao.InvitationDAO;
import net.koreate.moca.invitation.vo.ChatVO;

@RequiredArgsConstructor
public class ChattingHandler extends TextWebSocketHandler {

	private Hashtable<String, List<WebSocketSession>> sessionByCode = new Hashtable<>();
	private Hashtable<String, String> memberCode = new Hashtable<>();

	private final InvitationDAO dao;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 접속");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());

		Gson gson = new Gson();

		ChatVO vo = gson.fromJson(message.getPayload(), ChatVO.class);

		System.out.println(vo);

		List<WebSocketSession> sessionList = null;
		if (vo.getMessage().equals("OPENMESSAGE")) {
			memberCode.put(session.getId(), vo.getInvite_code());
			if (!sessionByCode.containsKey(vo.getInvite_code())) {
				System.out.println("새 세션 리스트 생성");
				sessionList = new ArrayList<>();
				sessionList.add(session);
				sessionByCode.put(vo.getInvite_code(), sessionList);
			} else {
				System.out.println("기존 세션 리스트에 추가");
				sessionList = sessionByCode.get(vo.getInvite_code());
				sessionList.add(session);
			}
		} else {
			dao.sendChat(vo);
			vo = dao.getOneChat(vo);

			sessionList = sessionByCode.get(vo.getInvite_code());

			for (WebSocketSession s : sessionList) {
				s.sendMessage(new TextMessage(gson.toJson(vo)));
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String code = memberCode.get(session.getId());
		List<WebSocketSession> sessionList = sessionByCode.get(code);
		sessionList.remove(session);
		memberCode.remove(session.getId());
		if (sessionList.isEmpty()) {
			sessionByCode.remove(code);
		}
		System.out.println("웹소켓 종료");
	}

}
