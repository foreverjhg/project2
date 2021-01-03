<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<%
  String name = (String)session.getAttribute("name");
%>
</head>
<body>
	
	<%  List<Map<String, String>> boardlist =  (List<Map<String, String>>) session.getAttribute("boardlist"); %>
	
	
	<!-- 내비게이션 바 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="index.jsp">JSP</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%if(name != null){ %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="LogoutService">로그아웃</a></li>
					</ul>
				</li>
			</ul>	
			<%} %>	
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
					
					
					
				</thead>
				<tbody>
					<!-- 게시판 글 목록 -->
					<% for (int i=0; i<boardlist.size(); i++) { %>
					
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"><%=String.valueOf(boardlist.get(i).get("BOARD_NUM")) %></th>
						<th style="background-color: #eeeeee; text-align: center;"><%=boardlist.get(i).get("TITLE") %></th>
						<th style="background-color: #eeeeee; text-align: center;"><%=boardlist.get(i).get("WRITEUSER") %></th>
						<th style="background-color: #eeeeee; text-align: center;"><%=String.valueOf(boardlist.get(i).get("WRITEDATE")) %></th>
					</tr>
					
					
					<%} %>
				</tbody>
			</table>
			<!-- 게시판 페이지 이동 버튼 -->
			<a href="bbs.jsp?pageNumber=" class="btn btn-success btn-arraw-left">이전</a>
			<a href="bbs.jsp?pageNumber=" class="btn btn-success btn-arraw-left">다음</a>
			<%if(name != null){ %>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			<%} %>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>