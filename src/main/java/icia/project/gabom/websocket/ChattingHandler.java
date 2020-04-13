package icia.project.gabom.websocket;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import icia.project.gabom.dao.ISomoimDao;
import icia.project.gabom.dto.Member;

@Service
public class ChattingHandler extends TextWebSocketHandler {
	@Autowired
	private ISomoimDao sDao;
	
	Gson gs = new Gson();
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<Integer, Map<String, WebSocketSession>> userChatMember = new HashMap<Integer, Map<String,WebSocketSession>>();
	// 해당 방번호에 / 아이디 - 세션 값을 저장
	
	@Override  //연결 됐을때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//System.out.println("afterConnectionEstablished : " + session );
		sessions.add(session);
		
        Map<String, Object> map = session.getAttributes();  // 담긴 친구 부르기 handler에서
        
        String userID = (String)map.get("userID");  // 유저 아이디// 방//
        System.out.println("userID : " +userID);
        Integer somoimNum = Integer.parseInt((String)map.get("somoimNum"));  // 유저 아이디// 방//
        System.out.println("somoimNum : " +somoimNum);
        
        
       if(userChatMember.containsKey(somoimNum)) {  //키를 포함하고 있다면 바로 map으로 넣기
           userChatMember.get(somoimNum).put(userID,session);
       }else { //키가 없으면 만들고 넣기 
    	   Map<String, WebSocketSession> personalMember = new HashMap<String, WebSocketSession>();
    	   personalMember.put(userID, session);  //session.getId로 아이디 뽑기가능
    	   userChatMember.put(somoimNum,personalMember);
       }
        
       
	}

	@Override//메시지 쐇을때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
		System.out.println(message.getPayload());
		
		Map<String,String> chatMap = new HashMap<String, String>();
		System.out.println("?1");
		chatMap = gs.fromJson(message.getPayload(), new TypeToken<Map<String,String>>() {}.getType());
		System.out.println("2?");
		for(String s : chatMap.keySet()) {
			System.out.println("schatMap : " + s);
			System.out.println("schatMap get : " + chatMap.get(s));
			
		}
		
		
		String id = chatMap.get("id");
		String msg = chatMap.get("msg");
		int number = Integer.parseInt(chatMap.get("somoimnumber"));
		System.out.println("3?");
		System.out.println("id : " + id);
		System.out.println("msg : " + msg);
		System.out.println("number : " + number);
		
		//현재 somoimnumber 방에 접속 중인 유저들의 LIST
		Map<String, WebSocketSession> somoimMember = userChatMember.get(number);
		System.out.println("4?");
		System.out.println((Integer)number);
		System.out.println(userChatMember.containsKey(number));
		
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		
		for(String userID : somoimMember.keySet() ) {
			
			System.out.println("맴버 : " + userID);
			
			somoimMember.get(userID).sendMessage(new TextMessage(message.getPayload()) );
		}
		
		
		
	}

	@Override//연결 끈어졌을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
		System.out.println("....나가기.........");
		
		System.out.println("나가기: " + session );
		Map<String, Object> map = session.getAttributes();  // 담긴 친구 부르기 handler에서
		String userID = (String)map.get("userID");  //소켓 유저의 아이디 가져오기(로그인한 아이디)
        System.out.println("userID : " +userID);
        
        String somoimNum = (String)map.get("somoimNum");
        System.out.println("somoim_number : " +somoimNum);
		
        //Map<Integer, Map<String, WebSocketSession>> userChatMember
        
        userChatMember.get(Integer.parseInt(somoimNum)).remove(userID);
		
		
		
	}
	
	
	
	
}
