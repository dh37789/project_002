package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.vo.MemberVO;



public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		
		Pattern pattern = Pattern.compile("(projectView|applyView|contractList|projectForm|inspectionList|temporaryList|projectForm2|refuseList).do");
		String requestURI = request.getRequestURI();
		requestURI = requestURI.substring(request.getContextPath().length());
		Matcher matcher = pattern.matcher(requestURI);
		
		if(matcher.find()){
			//로그인을 해야 되는 경우
			MemberVO client = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
			MemberVO admin = (MemberVO) request.getSession().getAttribute("ADMIN_LOGININFO");
			MemberVO freelancer = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
			if(client!=null||admin!=null||freelancer!=null){
				// 정상적으로 로그인된 경우
				chain.doFilter(servletRequest, servletResponse);
			}else{
				// 로그인 하지 않은 경우
				HttpServletResponse response = (HttpServletResponse) servletResponse;

				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script> ");
				out.println("<script type='text/javascript'> ");
				out.println("$(function(){");
				out.println("location.href='/join/loginForm.do';");
				out.println("});");
				out.println("</script>");
				out.println("<body>");
				out.println("</body>");
				out.println("</html>");
			}
		}else{
			// 로그인하지 않아도 되는 경우
			chain.doFilter(servletRequest, servletResponse);
		}
		

	}


}
