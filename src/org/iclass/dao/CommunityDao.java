package org.iclass.dao;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.Community;

import mybatis.SqlSessionBean;

public class CommunityDao {
	private static CommunityDao dao = new CommunityDao();
	private CommunityDao() {}
	public static CommunityDao getInstance() {
		return dao;
	}

	public long insert(Community vo) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		mapperSession.insert("community.insert",vo);
		mapperSession.commit();
		mapperSession.close();
		return vo.getIdx();
	}
	
	public int update(Community vo) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("community.update",vo);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("community.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	public Community selectByIdx(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Community vo = mapperSession.selectOne("community.selectByIdx",idx);
		mapperSession.close();
		return vo;
	}
}
