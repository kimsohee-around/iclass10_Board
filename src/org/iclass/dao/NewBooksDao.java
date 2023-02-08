package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.NewBooks;
import org.iclass.vo.NewMember;

import mybatis.SqlSessionBean;

public class NewBooksDao {
	private static NewBooksDao dao = new NewBooksDao();
	private NewBooksDao() {}
	public static NewBooksDao getInstance() {
		return dao;
	}

	public List<NewBooks> list() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<NewBooks> list = mapperSession.selectList("books.listAll");
		mapperSession.close();
		return list;
	}
	
	public int insert(NewBooks book) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("books.insert",book);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
}
