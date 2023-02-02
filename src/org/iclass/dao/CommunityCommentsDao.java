package org.iclass.dao;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.Community;
import org.iclass.vo.CommunityComments;

import mybatis.SqlSessionBean;

public class CommunityCommentsDao {
	private static CommunityCommentsDao dao = new CommunityCommentsDao();
	private CommunityCommentsDao() {}
	public static CommunityCommentsDao getInstance() {
		return dao;
	}

	public int insert(CommunityComments vo) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int idx = mapperSession.insert("communityComments.insert",vo);
		mapperSession.commit();
		mapperSession.close();
		return idx;
	}
	
	public int delete(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("communityComments.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("communityComments.maxOf");
		session.close();
		return result;
	}

	//메인글의 댓글 갯수 업데이트	
	public int setCommentCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setCommentCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
}
