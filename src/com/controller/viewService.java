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


@WebServlet("/viewService")
public class viewService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		System.out.println("目乖目乖");
		System.out.println("目乖目乖");
		List<Map<String, String>> boardcontent = dao.boardlist();
		System.out.println("目乖目乖");
		if (boardcontent != null) {
			System.out.println("焊靛能刨明 己傍");
			session.setAttribute("boardcontent", boardcontent);
			response.sendRedirect("view.jsp");
		}else {
			System.out.println("焊靛能镁明 角菩");
		}
		
	}

}
