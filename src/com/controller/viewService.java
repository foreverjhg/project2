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

@WebServlet("/viewService")
public class viewService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();

		String board_num = request.getParameter("num");

		System.out.println(board_num);

		BoardDAO dao = new BoardDAO();

		List<Map<String, String>> list = dao.boardcontent(board_num);
		
		System.out.println(list.get(0).get("CONTENT"));

		
		if (list != null) {
			session.removeAttribute("ripplelist");
			session.removeAttribute("boardcontent");
			session.setAttribute("boardcontent", list);
			response.sendRedirect("view.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
		 
	}

}
