package org.iclass.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.CommunityCommentsDao;
import org.iclass.vo.CommunityComments;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommentsController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");		//항상 맨앞에. 주석처리는 필터 적용 확인목적
		CommunityCommentsDao dao = CommunityCommentsDao.getInstance();
		String f = request.getParameter("f");
		String url=null;		//redirect url 변수
		long mref = Long.parseLong(request.getParameter("mref"));   //메인글의 idx 를 댓글테이블 mref 컬럼에 저장해야 함.(댓글추가)
		logger.info("::::::CommentesController  f={} :::::::",f);
		
		String page = request.getParameter("page");         // 현재페이지 번호 전달 - 순서9)
		// 댓글 작성 추가
		if(f.equals("1")) {
			CommunityComments vo =CommunityComments.builder()
									.mref(mref)
									.writer(request.getParameter("writer"))
									.content(request.getParameter("content"))
									.ip(request.getRemoteAddr())
									.build();
			if(dao.insert(vo)==1) url="read?idx="+mref + "&page="+page;   // 현재페이지 번호 전달 - 순서9)
			else url="list";
			
		}else if(f.equals("2")) {	
		//댓글 삭제 - 해보세요.
			int idx = Integer.parseInt(request.getParameter("idx"));	//삭제한 댓글idx
			if(dao.delete(idx)==1) url="read?idx="+mref + "&page="+page;   // 현재페이지 번호 전달 - 순서9)
			else url="list";
		}
		//댓글 갯수 변경 dao 메소드는 편의상 CommunityCommentsDao 로 옮기기
		//댓글 갯수 변경  
		dao.setCommentCount(mref);
		response.sendRedirect(url);
	}

}
