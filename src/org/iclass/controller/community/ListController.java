package org.iclass.controller.community;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityDao;

public class ListController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//db에서 글목록 가져오기
		CommunityDao dao = CommunityDao.getInstance();
		request.setAttribute("list", dao.list());
		//현재날짜시간 저장-출력형식 2개 중 하나 고를때 비교값
		request.setAttribute("today", LocalDate.now());
		//요청링크가 /community/list 였고 원하는 jsp도 community 폴더에 있으므로 다음과 같음.
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);
		
	}

}
