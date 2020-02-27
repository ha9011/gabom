package icia.project.gabom.websocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	
	
	//test용임 나중엔 map형태
	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override  //연결 됐을때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session );
		sessions.add(session);
		
	}

	@Override//메시지 쐇을때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
		
		

		// httpsession에 ("userIdSession", userid );로 반드시 만들어야함
		// 그래야 실제 로그인 여부를 알 수 있고 그걸 토대로 알림 할 수 있음 ( ** socket session으로 착각하지말기);;
		// loginpostajax 예제 보기;  ( https://github.com/indiflex/swp )
		Map<String,Object> test =session.getAttributes(); 
		for(String k : test.keySet()) {
			System.out.println("???");
			System.out.println("k : " + k);
			System.out.println("v : " +test.get(k));
		}
		
		String senderId = session.getId();
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + " :  " + message.getPayload()));
		}
		
		
	}

	@Override//연결 끈어졌을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
	}
	
	
	
}
