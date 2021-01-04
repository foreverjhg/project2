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
</head>
<body>
	
	<%  
		String bbsID = request.getParameter("bbsID");
		String flag = request.getParameter("flag");
	 	System.out.println("updatecon.jsp"+bbsID);
	%>
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
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	<!-- 로그인 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="PasswrodCheck">
					<h3 style="text-align: center;">비밀번호</h3>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20">
					</div>
					<input type="hidden" name = "bbsID" value="<%=bbsID %>">
					<input type="hidden" name = "flag" value="<%=flag %>">
					<input type="submit" class="btn btn-primary form-control" value="확인">
					
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>