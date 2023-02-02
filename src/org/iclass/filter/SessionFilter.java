package org.iclass.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@WebFilter("/*")
public class SessionFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(SessionFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		List<String> urls = List.of("/member/join","/login","/test");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		logger.info(":::::::: 요청 전 SessionFilter: {} ::::::::",httpRequest.getServletPath());
		HttpSession session = httpRequest.getSession();
		String user = (String) session.getAttribute("user");
		if(urls.contains(httpRequest.getServletPath()) && user != null) {
			httpResponse.sendRedirect(httpRequest.getContextPath()+"?login=yes");
			return;
		}
		chain.doFilter(request, response);
		logger.info(":::::::: 요청 후  SessionFilter: {} ::::::::",httpRequest.getServletPath());
	}



}
