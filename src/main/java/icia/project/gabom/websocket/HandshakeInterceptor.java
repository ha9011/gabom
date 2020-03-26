package icia.project.gabom.websocket;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
		Map<String, Object> attributes) throws Exception {
		
		System.out.println("Before Handshake");
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI:"+request.getURI());

		HttpServletRequest req =  ssreq.getServletRequest();
		 
		//이놈은 get으로 가져오는놈  (방번호 가져오기)
		String somoimNum = req.getParameter("somoim_number");
        System.out.println("param, somoim_number:"+somoimNum);
       // attributes.put("somoimNum", somoimNum);
		
       
        	
		// HttpSession 에 저장된 이용자의 아이디를 추출하는 경우  (세션으로 아이디 가져오기)
		String userID = (String)req.getSession().getAttribute("userID"); // 세션에서 값을 가져오는거
		System.out.println("HttpSession에 저장된 userID:"+userID);
		
        if(userID==null) {
        	
        }else {
        	attributes.put("userID", userID);
            	
        }

		return super.beforeHandshake(request, response, wsHandler, attributes);
	
	}

	
	
	

}
