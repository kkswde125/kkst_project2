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
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" 
integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" 
crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
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

	img{
		cursor: pointer;
	}

	input {
		width: 300px;
	}		 	
	
	#all{
		padding-top:10%;
		width: 600px;
		margin : 0 auto;
	}
		 	
</style>
</head>
<body>
<div id="all">
<form action="ac_onwerLogin_after.do" method="post" onsubmit="return chk()">

<table>

<tr>
	<td colspan="3"><img style="text-align:center; width: 500px;" onclick="location.href='index.jsp'" src="img/Logo.jpg"></td>
</tr>

<tr>
<td colspan="3"><h2>점주 로그인</h2></td>
</tr>  

<tr>
<td>
<p>아이디</p>
</td><td>
<div class="ui left icon input"><i class="users icon"></i> <input type="text" style="" name="id" required="required" id="idz" /></div>
</td>


<td rowspan="2">
<button class="ui button" style="height: 100px; width: 150px;">OK</button>
</td>
</tr>


<tr>
<td>
<p>비밀번호</p>
</td><td>
<div class="ui left icon input"> <i class="key icon"></i><input class="form-control" type="password" name="pw" required="required" id="pwz"/></div>
</td>
</tr>



<tr>
<td colspan="3" >
<div class="ui animated button" tabindex="0" onclick="location.href='index.jsp'" >
  <div class="visible content">이전</div>
  <div class="hidden content">
    <i class="reply icon"></i>
  </div>
</div>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디나 패스워드를 잊어버리셨다면? <a href="ac_retrunAccPage.do">HERE</a>
</td>
</tr>

</table>

</form>

</div>
</body>
</html>