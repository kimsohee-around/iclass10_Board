package org.iclass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	//서블릿(프론트 컨트롤러)으로부터 처리해야할 요청 request, 응답 response 를 인자로 받습니다.
	void handle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException ;
}
