package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.controller.RequestKeyValue;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );  
public class UpdateController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 내용 저장 

	}

}
