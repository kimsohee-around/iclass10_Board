package org.iclass.controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.NewMemberDao;
import org.iclass.vo.NewMember;

//new RequestKeyValue("/login", "POST")
public class LoginActionController implements Controller {

	@Override
	public void handle(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		//할일 : dao 로 id,password 확인하는 메소드 실행
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		NewMemberDao dao = NewMemberDao.getInstance();
		NewMember vo = dao.login(map);
		
		String url=null;
		if(vo != null) {		
			//로그인 성공
			session.setAttribute("user",vo);  //핵심.
			url=request.getContextPath();
		}else {			//로그인 실패
			url="login?incorrect=y";
		}
		
		response.sendRedirect(url);		
	}

}
