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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
</head>
<body>
<form action="ownerMyInfo.do" method="post" onsubmit="return pwChk('<%=AoDto.getPw()%>')">
<input type="hidden" value="<%=AoDto.getSeq()%>" name="seq" />
<table border="1" class="table table-striped">
	<tr>
		<th>아이디</th>
		<td>
			<div class="form-group">
			<input class="form-control" value="<%=AoDto.getId()%>"  type="text" name="id" readonly="readonly"/>
			</div>
			<br/>
		</td>
	</tr>
	<tr>
		<th>현재 비밀번호</th>
		<td><input class="form-control" type="password" name="pw" required="required" /></td>
	</tr>
	
	<tr>
		<th>바꿀 비밀번호</th>
		<td><input class="form-control" type="password" name="pw_chk" required="required" /></td>
	</tr>
	
	
	<tr>
		<th>이름</th>
		<td><input class="form-control" value="<%=AoDto.getName()%>"  type="text" name="name" readonly="readonly"/></td>
	</tr>
	
	<tr>
		<th>휴대폰 번호</th>
		<td><input class="form-control" value="<%=AoDto.getPhone()%>" type="text" name="phone" required="required"/></td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td><input class="form-control" value="<%=AoDto.getEmail()%>" type="email" name="email" required="required"/></td>
	</tr>
	

	<tr>
		<td colspan="2">
			<input class="btn btn-default" type="submit" value="수정" />
			<input class="btn btn-default" type="button" value="이전" onclick="location.href='InfoView.do'"/>
		</td>
	</tr>
</table>
</form>

</body>
</html>