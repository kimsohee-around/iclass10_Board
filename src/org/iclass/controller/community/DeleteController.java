package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityDao;
import org.iclass.vo.Community;
import org.iclass.vo.NewMember;

//요청 매핑 : mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );
public class DeleteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글 삭제 구현해 보세요.
		CommunityDao dao = CommunityDao.getInstance();
		long idx = Long.parseLong(request.getParameter("idx"));   
		//NumberFormatException 은 web.xml 설정으로 처리(UpdateViewController와 비교하는 코드)
		
		HttpSession session = request.getSession();
		NewMember user = (NewMember) session.getAttribute("user");
		Community vo = dao.selectByIdx(idx);
		if(vo==null || !vo.getWriter().equals(user.getId())) throw new RuntimeException();
		
		int result = dao.delete(idx);
		if(result == 1) {
			//삭제한 글이 있던 페이지로 돌아가기(요청 리다이렉트)
			response.sendRedirect("list?page="+request.getParameter("page"));   //현재페이지 번호 전달 - 순서7)
		}else {
			response.sendRedirect(request.getContextPath());
		}

	}

}
