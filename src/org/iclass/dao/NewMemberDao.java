package org.iclass.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.NewMember;

import mybatis.SqlSessionBean;

public class NewMemberDao {
	private static NewMemberDao dao = new NewMemberDao();
	private NewMemberDao() {}
	public static NewMemberDao getInstance() {
		return dao;
	}

	public NewMember login(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		NewMember vo = mapperSession.selectOne("newmember.login",map);
		mapperSession.close();
		return vo;
	}
	
}
