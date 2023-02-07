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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//new RequestKeyValue("/login", "POST")
public class LoginActionController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(LoginActionController.class);
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
		
		String url= request.getContextPath();
		String back = (String) session.getAttribute("back");
		logger.info("::::::::: LoginActionController back={} ::::::::",back);
		if(vo != null) {		
			//로그인 성공
			session.setAttribute("user",vo);  //핵심.
			if(back!=null) { 
				url=back;
				session.removeAttribute("back");	//back 이름의 애트리뷰트 삭제
			}	
		}else {			//로그인 실패
			url="login?incorrect=y";
		}
		
		response.sendRedirect(url);		
	}

}
