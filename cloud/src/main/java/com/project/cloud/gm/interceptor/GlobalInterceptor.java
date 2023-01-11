package com.project.cloud.gm.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class GlobalInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if (request.getSession().getAttribute("userId") == null) {
			PrintWriter writer = response.getWriter();
			
			response.setContentType("text/html; charset=utf-8");
			writer.println("<script>");
			writer.println("	alert('로그인이 필요한 서비스입니다. 로그인 화면으로 이동합니다.');");
			writer.println("	location.href='loginView';");
			writer.println("</script>");
			writer.close();
			
			return false;
		}
		return true;
	}
	
}
