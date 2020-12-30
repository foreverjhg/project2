package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");

		MemberDAO dao = new MemberDAO();
		
		HashMap pHm = new HashMap();
		pHm.put("id", id);
		pHm.put("pw", pw);
		pHm.put("name", name);
		pHm.put("sex", sex);
		pHm.put("email", email);

		int cnt = dao.join(pHm);
		 
		if (cnt > 0) { 
			response.sendRedirect("login.jsp"); 
		} else {
		    response.sendRedirect("index.jsp"); 
		}
	}
}
