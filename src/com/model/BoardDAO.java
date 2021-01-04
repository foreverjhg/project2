package com.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SqlSession.SqlSessionManager;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int boardwrite(HashMap pHm) {
		int cnt = sqlSession.insert("Board.getBoardWrite", pHm);
		sqlSession.commit();
		return cnt;		
	}
	
	public List<Map<String, String>> boardlist() {
		 return sqlSession.selectList("Board.boardlist");		
	}
	
	public List<Map<String, String>> boardcontent(String board_num) {
		return sqlSession.selectList("Board.boardcontent", board_num);
	}

	public int ripplewrite(HashMap pHm) {
		int cnt = sqlSession.insert("Board.ripplewrite", pHm);
		
		sqlSession.commit();
		return cnt;
	}
	
	public List<Map<String, String>> ripplelist(String board_num) {
		return sqlSession.selectList("Board.ripplelist", board_num);
		
	}

	public String passwordcheck(HashMap pHm) {
		return sqlSession.selectOne("Board.passwordcheck", pHm);
	}

	public int update(HashMap pHm) {
		int cnt = sqlSession.update("Board.update", pHm);
		sqlSession.commit();
		return cnt;
		
	}

	public int delete(String board_num) {
		int cnt = sqlSession.delete("Board.delete", board_num);
		sqlSession.commit();
		return cnt;
		
	}

	
	
	
	
	
}
