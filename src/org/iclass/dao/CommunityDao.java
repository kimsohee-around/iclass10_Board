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
		return vo.getIdx();			//매퍼xml에서 selectKey 로 시퀀스 값을 vo객체에 저장시킵니다.
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
	
	//주요한 기능
	//전체 글 갯수
	public int count() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("community.count");
		mapperSession.close();
		return result;
	}
	
	//읽은 메인글 조회수 증가
	public int setReadCount(int idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setReadCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
	//mref 메인글의 댓글 갯수
	public int commentsCount(int mref) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("community.commentsCount", mref);
		session.close();
		return result;
	}
	
	//메인글의 댓글 갯수 업데이트	
	public int setCommentCount(int idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setCommentCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
}
