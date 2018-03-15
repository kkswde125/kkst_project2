<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검토완료 창</title>
</head>
<body>

<h1>검토 완료!</h1>
<form action="sendEmail.do" method="POST">
<table>
	<tr>
		<td>검토 결과를 통보할 이메일 : </td>
		<td>
			<input type="text" value="${dto.email }" name="email" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="60" name="content">내용을 입력해주세요.</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="돌아가기" onclick="location.href='ad_restList.do?snum=1&cnum=10'">
			<input type="submit" value="메일 전송">
		</td>
	</tr>
</table>
</form>
</body>
</html>