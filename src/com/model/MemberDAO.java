package com.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.SqlSession.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int join(HashMap pHm) {
		int cnt = sqlSession.insert("Member.getJoin", pHm);
		sqlSession.commit();
		return cnt;
	}
}
