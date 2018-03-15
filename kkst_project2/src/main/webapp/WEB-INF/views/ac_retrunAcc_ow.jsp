<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID/PW찾기</title>
</head>
<body>

<div id="idarea">
<form action="ac_idRetrun_ow.do"  method="post">
<table>
<tr>
<th>이름</th>
<td><input type="text" value="이름을 입력해주세요" name="name_id" /></td>
</tr>
<tr>
<th>이메일</th>
<td><input type="email" value="E-Mail을 입력해주세요" name="email_id" /></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><input type="submit" value="메일로 전송" /></td>
</tr>

</table>
</form>
</div>
<hr>
<div id="pwarea">
<form action="ac_pwRetrun_ow.do" method="post">
<table>
<tr>
<th>아이디</th>
<td><input type="text" value="아이디을 입력해주세요" name="id_pw" /></td>
</tr>
<tr>
<th>이름</th>
<td><input type="text" value="이름을 입력해주세요" name="name_pw" /></td>
</tr>
<tr>
<th>E-Mail</th>
<td><input type="email" value="E-Mail을 입력해주세요" name="email_pw" /></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><input type="submit" value="메일로 전송" /></td>
</table>
</form>
</div>

</body>
</html>