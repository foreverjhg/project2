package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;


@WebServlet("/updateAction")
public class updateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		HashMap pHm = new HashMap();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String board_num = request.getParameter("board_num");
		
		pHm.put("title", title);
		pHm.put("content", content);
		pHm.put("board_num", board_num);
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.update(pHm);
		
		if (cnt>0) {
			response.sendRedirect("bbsService");
		}
		
	}

}
