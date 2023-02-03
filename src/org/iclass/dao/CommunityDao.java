package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.Community;
import org.iclass.vo.CommunityComments;

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
	
	public int delete(long idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("community.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	public Community selectByIdx(long idx) {
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
	public int setReadCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setReadCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
	//mref 메인글의 댓글 갯수
	public int commentsCount(long mref) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("community.commentsCount", mref);
		session.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("community.maxOf");
		session.close();
		return result;
	}
	
	//mref 메인글의 댓글목록 가져오기
	public List<CommunityComments> comments(long mref){
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<CommunityComments> commentList = mapperSession.selectList("community.comments",mref);
		mapperSession.close();
		return commentList;
	}
	

	public List<Community> list() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<Community> list = mapperSession.selectList("community.list");
		mapperSession.close();
		return list;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
	public List<Community> pagelist(Map<String,Integer> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<Community> list = mapperSession.selectList("community.pagelist",map);
		mapperSession.close();
		return list;
	}
}
