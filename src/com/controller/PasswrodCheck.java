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


@WebServlet("/PasswrodCheck")
public class PasswrodCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		
		String pw = request.getParameter("pw");
		String board_num = request.getParameter("bbsID");
		
		HashMap pHm = new HashMap();
		
		pHm.put("pw", pw);
		pHm.put("board_num", board_num);
		
		BoardDAO dao = new BoardDAO();
		
		 String name = dao.passwordcheck(pHm);
		 
		 if (session.getAttribute("name").equals(name)) {
			 System.out.println(request.getParameter("flag"));
			if(request.getParameter("flag").equals("U")) {
				List<Map<String, String>> updatecontent = dao.boardcontent(board_num);
				session.setAttribute("updatecontent", updatecontent);
				response.sendRedirect("update.jsp");
			}else {
				response.sendRedirect("DeleteSevice?num="+board_num);
			}
			
		 }else {
			 response.sendRedirect("viewService?num="+board_num);
			 
		 }
		
		
	}

}
