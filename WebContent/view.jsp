<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial=scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
     .modal{ 
         position: fixed;
         top: 0; left: 0;
         width: 100%; height: 100%;
         display: flex;
         justify-content: center;
         align-items : center;
         
      }
      
      .md_overlay {
         background-color: rgba(0, 0, 0, 0.6);
         width: 100%; height: 100%;
         position: absolute;
      
      }

      .md_content {
         width: 40%;
         position: relative;
         padding: 50px 100px;
         background-color: #F05656;
         text-align: center;
         border-radius: 6px;
         box-shadow: 0 10px 20px rgba(0,0,0,0.20), 0 6px 6px rgba(0, 0, 0, 0.20);
      }
      
      
      .md_con {
      	 width: 40%;
         position: absolute;
         padding: 31px 31px;
         background-color: white;
         text-align: center;
         border-radius: 6px;
         margin-top: 390px;
         box-shadow: 0 10px 20px rgba(0,0,0,0.20), 0 6px 6px rgba(0, 0, 0, 0.20);
      }
      
      .hidden {
         display: none;
      }
      
      .modal_text { padding: 16px; }
</style>
<title>JSP</title>
<%
    String name = (String)session.getAttribute("name");
	List<Map<String, String>> list = (List<Map<String, String>>) session.getAttribute("boardcontent");
	List<Map<String, String>> ripplelist = (List<Map<String, String>>) session.getAttribute("ripplelist");
%>
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
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%if(name != null){ %>
			<!--  로그인 후 화면 -->
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
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
	             <tr>
					<td><input type="text" class="form-control" placeholder="글 제목" value = "<%=list.get(0).get("TITLE") %>" name="bbsTitle" maxlength="50" disabled="disabled"></td>
				 </tr>
				 <tr>
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" disabled="disabled"><%=list.get(0).get("CONTENT") %></textarea></td>
				 </tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<a href="updatecon.jsp?bbsID=<%=String.valueOf(list.get(0).get("BOARD_NUM")) %>&flag=U" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="updatecon.jsp?bbsID=<%=String.valueOf(list.get(0).get("BOARD_NUM")) %>&flag=D"class="btn btn-primary">삭제</a>
			<hr style="border: 1px solid grey;">
			<!-- 댓글 내용 표시 -->
			<%if (ripplelist != null) {%>
			<table class="table table-striped" style="border: 1px solid #dddddd;">
			<%for (int i=0; i<ripplelist.size(); i++) { %>
			  <tr>
			    <td style="text-align: center;" width="170px"><%=ripplelist.get(i).get("WRITEUSER") %></td>
			    <td><%=ripplelist.get(i).get("CONTENT") %></td>
			  </tr>
			 <%} %>  
			</table>
			<%} %>
			
			<form  action="ripplewrite" method="post" name="form">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top: 20px">
			  <tbody>
				 <tr>
				   <td width="150px"><input type="text" class="form-control" placeholder="댓글 작성자" name="writeuser" maxlength="25"></td>
				   <td><input type="text" class="form-control" placeholder="댓글 내용" name="content" maxlength="100"></td>
				   <td width="150px"><input type="button" id = "test" class="btn btn-primary form-control" value="등록" onclick="check()"></td>
				   
				 </tr>
			  </tbody>
			</table>
			<input type="hidden" name="board_num" value="<%=String.valueOf(list.get(0).get("BOARD_NUM")) %>">
			<input type="hidden" name="title" value="<%=list.get(0).get("TITLE") %>">
			</form>
		</div>
	</div>

	 <div class="modal hidden">
     <div class="md_overlay"></div>
	 <div class="md_content">
         <img src="images/alarm.png" width=50% height="150px">
         <div class="modal_text">
            <h2>성희롱 댓글이 감지되었습니다.</h2>
            <h2>계속 등록 하시겠습니까?</h2> 
         </div>
      </div>
      <div class="md_con">
         <div >
         <input id="submits" type="button" class="btn btn-danger" value="예">  <input id="cancels" type="button" class="btn btn-success" value="아니오">
         </div>
      
      
      </div>
      
      
   </div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function check() {
			var form = document.form;
			
			if (form.writeuser.value == "") {
				alert("댓글 작성자를 입력하세요.");
				form.writeuser.focus();
				exit();
			} else if (form.content.value == "") {
				alert("댓글 내용을 입력하세요.");
				form.content.focus();
				exit();
			}
			
			result();
		}

		function result() {
			var replySection = document.form.content; 

			 score(replySection.value, function(probability) {

				if(parseFloat(probability).toFixed(1) > 0.5){
					const modal = document.querySelector(".modal");
					modal.classList.remove("hidden");
					
				    const overlay = modal.querySelector(".md_overlay");
				    const closeButton = modal.querySelector("#cancels");
				    const submitButton = modal.querySelector("#submits")
				      
				    //동작함수
				    const closeModal = () => {
				       modal.classList.add("hidden");
				       replySection.value = "";
				    }
				      
				    const submitModal = () => {
				       modal.classList.add("hidden")
				       document.form.submit();
				    }
				    
				    //클릭 이벤트
				    closeButton.addEventListener("click", closeModal);
				    submitButton.addEventListener("click", submitModal) 
				}else{
					document.form.submit();
				}
				
				
				
			});
		}

		 //필요한 엘리먼트들을 선택한다.
	      
	</script>
	<script src="js/score.js"></script>
	
</body>
</html>