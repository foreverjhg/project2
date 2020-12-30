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
	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="JoinService" name="jform">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary">
								<input type="radio" name="sex" autocomplete="off" value="m">남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="sex" autocomplete="off" value="f">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="20">
					</div>
					<input type="button" class="btn btn-primary form-control" value="회원가입" onclick="checkfield()">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function checkfield(){
			var form = document.jform;
			
			if(form.id.value == ""){
				 alert("아이디를 입력하세요"); 
				 form.id.focus(); 
				 exit;
			}else if(form.pw.value == ""){
				 alert("비밀번호를 입력하세요"); 
				 form.pw.focus(); 
				 exit;
			}else if(form.name.value == ""){
				 alert("이름을 입력하세요"); 
				 form.name.focus(); 
				 exit;
			}else if(form.sex.value == ""){
				 alert("성별을 선택하세요"); 
				 form.sex.focus(); 
				 exit;
			}else if(form.email.value == ""){
				 alert("이메일을 입력하세요"); 
				 form.email.focus(); 
				 exit;
			}
			
			form.submit();
		}
	</script>
</body>
</html>