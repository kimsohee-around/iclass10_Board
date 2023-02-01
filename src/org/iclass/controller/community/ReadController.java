package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityDao;
import org.iclass.vo.Community;

// 요청 매핑 : mapping.put(new RequestKeyValue("/community/read", "GET"), new ReadController() );
public class ReadController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//지정된 idx 메인글 읽기
		String temp = request.getParameter("idx");			//메인글 글번호 파라미터로 받기
		int idx=0;
		try {
			idx = Integer.parseInt(temp);
		}catch (NumberFormatException e) {
			response.sendRedirect("list");
		}
		
		CommunityDao dao = CommunityDao.getInstance();
		Community vo = dao.selectByIdx(idx);
		request.setAttribute("vo", vo);
		
		//idx 메인글의 댓글리스트를 애트리뷰트에 저장하기
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("read.jsp");
		dispatcher.forward(request, response);
	}

}
