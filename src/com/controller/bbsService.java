package com.controller;



import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;


@WebServlet("/bbsService")
public class bbsService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		BoardDAO dao = new BoardDAO();
		
		System.out.println("보드목록실행");
		List<Map<String, String>> boardlist = dao.boardlist();
		
		System.out.println(boardlist);
		
		System.out.println("커밋커밋");
		if(boardlist != null) {
			System.out.println("보드목록 불러오기성공");
			session.setAttribute("boardlist", boardlist);
			response.sendRedirect("bbs.jsp");
		}else {
			System.out.println("보드목록 불러오기 실패");
		}
		
		
	}

}
