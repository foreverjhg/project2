package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.MemberDAO;


@WebServlet("/writeActionService")
public class writeActionService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");
		
	
		List<Map<String, String>> username = (List<Map<String, String>>) session.getAttribute("username");
		
		
		
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writeuser = username.get(0).get("NAME");
		
		System.out.println(title+" "+content);
		
		
		BoardDAO dao = new BoardDAO();
		
		HashMap pHm = new HashMap();
		
		
		
		pHm.put("title", title);
		pHm.put("content", content);
		pHm.put("writeuser", writeuser);
		
		System.out.println(writeuser);
		int cnt = dao.boardwrite(pHm);
		
		
		if (cnt > 0) {
			System.out.println("글작성 성공");
			response.sendRedirect("bbs.jsp");
		}else {
			System.out.println("글작성 실패");
			response.sendRedirect("index.jsp");
		}
		
	}

}
