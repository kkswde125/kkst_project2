<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">

	*{
		text-align: center;
	}

	img{
		cursor: pointer;
	}

	input {
		width: 300px;
	}		 	
	
	#all{
		padding-top:7%;
		width: 600px;
		margin : 0 auto;
	}
</style>
</head>
<body>
<% LoginDto dto = (LoginDto)request.getAttribute("dto");
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy일 MM월 dd일");%>
<div id="all">
<input type="hidden" value="<%=dto.getSeq() %>" name="seq" />
<table border="1" class="ui celled table">
<tr>
	<td colspan="3"><img style="text-align:center; width: 500px;" onclick="location.href='index.jsp'" src="img/Logo.jpg"></td>
</tr>
	<tr>
		<th>아이디</th>
		<td>
			<div class="ui input">
			<input value="<%=dto.getId()%>"  type="text" name="id" readonly="readonly"/>
			</div>
			<br/>
		</td>
	</tr>
	<tr>
	
	<tr>
		<th>이름</th>
		<td>
		<div class="ui input">
		<input value="<%=dto.getName() %>"  type="text" name="name" readonly="readonly"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>닉네임</th>
		<td>
		<div class="ui input">
		<input value="<%=dto.getNickName() %>"  type="text" name="nickname" readonly="readonly"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>가입일시</th>
		<td>
		<div class="ui input">
		<input value="<%=sdf1.format(dto.getRegDate()) %>"  type="text" name="regdate" readonly="readonly"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>성별</th>
		<td>
		<div class="ui input">
		<input value="<%=dto.getSex().equals("M")?"남":"여" %>"  type="text" name="sex" readonly="readonly"/>
		</div>
		</td>
	</tr>

	<tr>
		<th>생년월일</th>
		<td>
		<div class="ui input">
		<input value="<%=sdf2.format(dto.getBirth()) %>"  type="text" name="birth" readonly="readonly"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>
		<div class="ui input">
		<input value="<%=dto.getEmail() %>" type="email" name="email"  readonly="readonly"/>
		</div>
		</td>
	</tr>
	

	<tr>
		<td colspan="2">
			<input class="ui button" style="width: 100px;" type="button" value="이전" onclick="location.href='us_usermain.do'"/>
			<input class="ui button" style="width: 100px;" type="button" value="수정하기" onclick="location.href='us_modifyMyinfo.do'" />
			<input class="ui button" style="width: 100px;" type="button" value="탈퇴하기" onclick="location.href='us_deleteAccount.do'"/>
		</td>
	</tr>
</table>
</div>

</body>
</html>