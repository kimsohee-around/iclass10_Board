package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.controller.RequestKeyValue;
import org.iclass.dao.CommunityDao;

//요청 매핑 : mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );
public class DeleteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글 삭제 구현해 보세요.
		CommunityDao dao = CommunityDao.getInstance();
		long idx = Long.parseLong(request.getParameter("idx"));
		int result = dao.delete(idx);
		if(result == 1) {
			response.sendRedirect("list");
		}else {
			response.sendRedirect(request.getContextPath());
		}

	}

}
