package kr.or.ddit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if (request.getSession().getAttribute("USER_LOGININFO") == null
				&& request.getSession().getAttribute("ADMIN_LOGININFO") == null ) {
			response.sendRedirect("/join/loginForm.do");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	
}
