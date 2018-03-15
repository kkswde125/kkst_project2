<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="us_menu_photo_uploads.do" method="post" enctype="multipart/form-data">
<p>1<input type="file" name="uploadFile" multiple="multiple" /></p>
<input type="submit" value="파일 첨부">
</form>
</body>
</html>