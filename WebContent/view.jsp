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
<%
  String name = (String)session.getAttribute("name");
%>
</head>
<body>
	<!-- ������̼� �� -->
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
				<li><a href="index.jsp">����</a></li>
				<li class="active"><a href="bbs.jsp">�Խ���</a></li>
			</ul>
			<%if(name != null){ %>
			<!--  �α��� �� ȭ�� -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">ȸ������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="LogoutService">�α׾ƿ�</a></li>
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
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">�Խ��� �� ����</th>
					</tr>
				</thead>
				<tbody>
	             <tr>
					<td><input type="text" class="form-control" placeholder="�� ����" name="bbsTitle" maxlength="50" disabled="disabled"></td>
				 </tr>
				 <tr>
					<td><textarea class="form-control" placeholder="�� ����" name="bbsContent" maxlength="2048" style="height: 350px;" disabled="disabled"></textarea></td>
				 </tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">���</a>
			<a href="update.jsp?bbsID=" class="btn btn-primary">����</a>
			<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href="deleteAction.jsp?bbsID=" class="btn btn-primary">����</a>
			<hr style="border: 1px solid grey;">
			<!-- ��� ���� ǥ�� -->
			<table class="table table-striped" style="border: 1px solid #dddddd;">
			  <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			  <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			  <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			   <tr>
			    <td style="text-align: center;" >������</td>
			    <td>�̷��� ��� �ۼ��� �ǿ�. �ѹ��غ�����.... </td>
			  </tr>
			</table>
			
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top: 20px">
			  <tbody>
				 <tr>
				   <td style="width: 150px;"><input type="text" class="form-control" placeholder="��� �ۼ���" name="bbsWrite" maxlength="25"></td>
				   <td><input type="text" class="form-control" placeholder="��� ����" name="bbsComment" maxlength="100"></td>
				   <td style="width: 150px;"><a href="" class="btn btn-primary form-control">���</a></td>
				 </tr>
			  </tbody>
			</table>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>