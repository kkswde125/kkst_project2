<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8");%>
<%String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	window.onload=function(){
		
		if(<%=msg!=null%>){
			alert('<%=msg%>');
		}
		
		
		
	}



	function chk() {
		var id= document.getElementById('idz').value;
		var name=document.getElementById('pwz').value;
		if (id.indexOf(" ")!=-1||id.indexOf(" ")!=-1) {
			alert('공백불가');
			return false;
		}
	}
</script>
<title>login.jsp</title>
<style type="text/css">
	div{
		margin-top: 10%;
		margin-left: 30%;
		margin-right: 30%;
	}
</style>
</head>
<body>
<div>
<form action="ac_onwerLogin_after.do" method="post" onsubmit="return chk()">
<fieldset>
<h1>점주 로그인</h1>
<legend>LOGIN</legend>
<label>ID:<input class="form-control" type="text" name="id" required="required" id="idz" /></label>
<label>PW:<input class="form-control" type="password" name="pw" required="required" id="pwz"/></label>
<button class="btn btn-default">OK</button>
</fieldset>
</form>

<div>
아이디나 패스워드를 잊어버리셨다면?
<a href="ac_retrunAccPage_ow.do">HERE</a>
</div>

</div>
</body>
</html>