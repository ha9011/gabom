package icia.project.gabom.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import icia.project.gabom.dto.AlarmJungmo;

@Service
public class EchoHandler extends TextWebSocketHandler{
	
	
	//test용임 나중엔 map형태
	//List<WebSocketSession> sessions = new ArrayList<>();
	Gson gs = new Gson();
	Map<String, WebSocketSession> loginMember = new HashMap<String, WebSocketSession>();
	
	@Override  //연결 됐을때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session );
		 Map<String, Object> map = session.getAttributes();   // 인터셉터에서 받아온 놈
		 
		 if(map.containsKey("userID")) {
			 String userID = (String)map.get("userID"); //유저아이디
			 loginMember.put(userID,session);  //접속중인 친구에게 보내기
		 }else {
			 
		 }
		 
		 
	}

	@Override //알림
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
		System.out.println(message.getPayload());
		Map<String,Object> memberList = new HashMap<String,Object>();
		memberList = gs.fromJson(message.getPayload(), new TypeToken<HashMap<String, Object>>() {}.getType());
		
		System.out.println("test : " );
		System.out.println(memberList.get("하하"));
		
		
		//정모로 알람할때
		if(memberList.get("type").equals("jungmo")) {  //정모 만들어 질때 게시판
			AlarmJungmo aj = new AlarmJungmo(); 
			ObjectMapper mapper =new ObjectMapper();
			aj = mapper.readValue(message.getPayload(), AlarmJungmo.class);
			System.out.println(aj.toString());
			
			List<String> members = aj.getMembers();
			
			for(String somoimMember : members) {  // 없는 놈들한테도 보낼라 하니깐 오류뜸. 있는지 없는지 확인 하고 해야함.
				System.out.println("맴버아이디 : " +somoimMember);
				if(loginMember.containsKey(somoimMember)) {
					System.out.println("로그인 중입니다 : " +somoimMember );
					loginMember.get(somoimMember).sendMessage(new TextMessage(message.getPayload()));
					//loginMember.get(somoimMember).sendMessage(message);
				}else {
					System.out.println("접속중이 아닙니다. : " +somoimMember );
				}
				
			}
		}

		
		
		
		System.out.println("??");
		
		
		
	}

	@Override//연결 끈어졌을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
	}
	
	
	
}
