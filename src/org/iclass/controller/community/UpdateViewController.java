package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityDao;
import org.iclass.vo.Community;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","GET"), new UpdateViewController() );
public class UpdateViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 화면으로 데이터 보내기 구현해 보세요.
		//지정된 idx 메인글 가져오기
				String temp = request.getParameter("idx");			//메인글 글번호 파라미터로 받기
				long idx=0;
				try {
					idx = Long.parseLong(temp);
				}catch (NumberFormatException e) {
					response.sendRedirect("list");
				}
				
				CommunityDao dao = CommunityDao.getInstance();
				Community vo = dao.selectByIdx(idx);
				request.setAttribute("vo", vo);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
				dispatcher.forward(request, response);

	}

}
