package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityDao;
import org.iclass.vo.Community;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );  
public class UpdateController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 내용 저장  구현해 보세요.
		request.setCharacterEncoding("UTF-8");
		long idx = Long.parseLong(request.getParameter("idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String ip = request.getRemoteAddr();
		Community vo = Community.builder()
				.idx(idx)
				.title(title)
				.content(content)
				.ip(ip)
				.build();
		
		CommunityDao dao = CommunityDao.getInstance();
		int result = dao.update(vo);
		if(result==1) {
			response.sendRedirect("read?idx="+idx+"&page="+request.getParameter("page"));   
			//현재페이지 번호 전달 - 순서6)
		}else {
			//메인화면으로 이동
			response.sendRedirect(request.getContextPath());
		}
	}

}
