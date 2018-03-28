<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% Admin_OnwerDto AoDto=(Admin_OnwerDto)request.getSession().getAttribute("AoDto"); %>
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
	function pwChk(pw) {
	
		var ResultPw = $("input[name=pw]").val();
		
		if(pw!=ResultPw){
			alert("현재 비밀번호가 일치 하지 않습니다. 다시 확인해 주세요");
						
			$("input[name=pw]").prop("value","").focus();
			
			
			return false;
		}
		
		
	}
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
		padding-top:5%;
		width: 600px;
		margin : 0 auto;
	}
</style>
</head>
<body>
<div id="all">
<form action="ownerMyInfo.do" method="post" onsubmit="return pwChk('<%=AoDto.getPw()%>')">
<input type="hidden" value="<%=AoDto.getSeq()%>" name="seq" />
<table border="1"  class="ui celled table">
	<tr>
	<td colspan="3"><img style="text-align:center; width: 500px;" onclick="location.href='index.jsp'" src="img/Logo.jpg"></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
			<div class="ui input">
			<input value="<%=AoDto.getId()%>"  type="text" name="id" readonly="readonly"/>
			</div>
			<br/>
		</td>
	</tr>
	<tr>
		<th>현재 비밀번호</th>
		<td>
		<div class="ui input">
		<input  type="password" name="pw" required="required" />
		</div>
		</td>
	</tr>
	
	<tr>
		<th>바꿀 비밀번호</th>
		<td>
		<div class="ui input">
		<input type="password" name="pw_chk" required="required" />
		</div>
		</td>
	
	</tr>
	
	
	<tr>
		<th>이름</th>
		<td>
		<div class="ui input">
		<input  value="<%=AoDto.getName()%>"  type="text" name="name" readonly="readonly"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>휴대폰 번호</th>
		<td>
		<div class="ui input">
		<input value="<%=AoDto.getPhone()%>" type="text" name="phone" required="required"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>
		<div class="ui input">
		<input value="<%=AoDto.getEmail()%>" type="email" name="email" required="required"/>
		</div>
		</td>
	</tr>
	

	<tr>
		<td colspan="2">
			<input class="ui button" style="width: 100px;" type="submit" value="수정" />
			<input class="ui button" style="width: 100px;" type="button" value="이전" onclick="location.href='InfoView.do'"/>
		</td>
	</tr>
</table>
</form>
</div>

</body>
</html>