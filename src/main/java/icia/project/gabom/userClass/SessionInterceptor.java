package icia.project.gabom.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle call");
		if(request.getSession().getAttribute("id")==null) {
			response.sendRedirect("./"); //home.jsp
			return false;  // ��Ʈ�ѷ� ���� ����
		}
		
		return true; //��Ʈ�ѷ� ���� ���
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		System.out.println("postHandle call");
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
