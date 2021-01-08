package com.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SqlSession.SqlSessionManager;

public class GraphDAO {


	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	
	public List<Map<String, String>> selectScore(HashMap pHm) {
		return sqlSession.selectList("Graph.graphtop", pHm);
	}



	public List<Map<String, String>> selectmean(HashMap pHm) {
		return sqlSession.selectList("Graph.graphmean", pHm);
		
	}
	
}
