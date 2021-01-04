package com.controller;

import java.io.IOException;
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


@WebServlet("/rippleService")
public class rippleService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		
		
		HashMap pHm = new HashMap();
		String writeuser = request.getParameter("writeuser");
		String content = request.getParameter("content");
		String board_num = request.getParameter("board_num");
		String title = request.getParameter("title");
		
		System.out.println(writeuser+"   "+title);
		
		pHm.put("writeuser", writeuser);
		pHm.put("content", content);
		pHm.put("board_num", board_num);
		pHm.put("title", title);
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.ripplewrite(pHm);
		
		
		System.out.println("ripplelist¹® ½ÃÀÛ");
		if (cnt>0) {
			List<Map<String, String>> ripplelist = dao.ripplelist(board_num);
			System.out.println(ripplelist);
			session.removeAttribute("ripplelist");
			session.removeAttribute("boardcontent");
			session.setAttribute("ripplelist", ripplelist);
			response.sendRedirect("viewService?num="+board_num);
		}
		
	}

}
