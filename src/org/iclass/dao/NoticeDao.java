package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.NewBooks;
import org.iclass.vo.Notice;
import org.iclass.vo.Paging;

import mybatis.SqlSessionBean;

public class NoticeDao {
	private static NoticeDao dao = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return dao;
	}

	public List<Notice> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<Notice> list = mapperSession.selectList("notice.getList",paging);
		mapperSession.close();
		return list;
	}
	
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("notice.count",map);
		mapperSession.close();
		return result;
	}
	
	public Notice read(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Notice vo = mapperSession.selectOne("notice.getOne",idx);
		mapperSession.close();
		return vo;
	}
	
	public int write(Notice notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("notice.insert",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int update(Notice notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("notice.update",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	
	
}
