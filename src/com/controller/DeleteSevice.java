package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;


@WebServlet("/DeleteSevice")
public class DeleteSevice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String board_num = request.getParameter("num");
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.delete(board_num);
		
		if (cnt > 0) {
			response.sendRedirect("bbsService");
		}
	}

}
