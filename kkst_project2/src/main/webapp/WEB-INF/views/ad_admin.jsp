<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	<%String msg=(String)request.getAttribute("msg"); %>
	window.onload=function(){
	    
	    if(<%=msg!=null%>){
	       alert('<%=msg%>');
	    }
	    
	 }

</script>
</head>
<body>


<a href="ad_memberList.do?snum=1&cnum=10">회원관리</a>
<a href="ad_reviewChoice.do">리뷰관리</a>
<a href="ad_restList.do?snum=1&cnum=10">식당 등록 관리</a>


</body>
</html>