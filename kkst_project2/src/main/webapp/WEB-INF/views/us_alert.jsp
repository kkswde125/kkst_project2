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
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}';
if (message==null||message=="") {
}else{
alert(message); 
}
document.location.href = returnUrl; 
</script>
</body>
</html>