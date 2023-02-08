package org.iclass.controller;

import java.util.HashMap;
import java.util.Map;

import org.iclass.controller.book.NewFormController;
import org.iclass.controller.book.NewBookListController;
import org.iclass.controller.book.NewBookSaveController;
import org.iclass.controller.community.CommentsController;
import org.iclass.controller.community.DeleteController;
import org.iclass.controller.community.ListController;
import org.iclass.controller.community.ReadController;
import org.iclass.controller.community.UpdateController;
import org.iclass.controller.community.UpdateViewController;
import org.iclass.controller.community.WriteController;
import org.iclass.controller.community.WriteViewController;
import org.iclass.controller.login.LoginActionController;
import org.iclass.controller.login.LoginViewController;
import org.iclass.controller.login.LogoutController;

public class RequestControllerMapping {
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init() {
		//설계된 url,method 에 따라 처리할 controller 구현체를 Key,Value 로 HashMap에 저장합니다.
		mapping.put(new RequestKeyValue("/community/list", "GET"), new ListController() );
		mapping.put(new RequestKeyValue("/community/write","GET"), new WriteViewController() );
		mapping.put(new RequestKeyValue("/community/write","POST"), new WriteController() );
		//게시판 글 상세보기 ,수정하기,삭제하기
		mapping.put(new RequestKeyValue("/community/read", "GET"), new ReadController() );
		mapping.put(new RequestKeyValue("/community/update","GET"), new UpdateViewController() );
		mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );
		mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );		//오류 처리 위해 POST로 변경
		mapping.put(new RequestKeyValue("/community/comments","POST"), new CommentsController());
		//회원가입
		mapping.put(new RequestKeyValue("/member/join","GET"), null);
		mapping.put(new RequestKeyValue("/member/join","POST"), null);
		//회원정보수정
		mapping.put(new RequestKeyValue("/member/modify","GET"), null);
		mapping.put(new RequestKeyValue("/member/modify","POST"), null);
		//로그인
		mapping.put(new RequestKeyValue("/login", "GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout", "GET"), new LogoutController());
		//새로나온책 (파일업로드)
		mapping.put(new RequestKeyValue("/book/new", "GET"), new NewFormController());
		mapping.put(new RequestKeyValue("/book/new", "POST"), new NewBookSaveController());
		mapping.put(new RequestKeyValue("/book/list", "GET"), new NewBookListController());
	}
	//url,method 필드를 저장하는 key 를 전달받아 HashMap에서 value(컨트롤러)를 리턴
	public static Controller getController(RequestKeyValue key) {
		return mapping.get(key);
	}
}
