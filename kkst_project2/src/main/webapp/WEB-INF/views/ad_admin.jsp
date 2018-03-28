<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
		font : bold 13pt "나눔스퀘어라운드 EXTRABOLD";
	}
	.ui{
		width: 150px;
		height: 150px;
		padding-top: 60px !important;
	}
	#logout{
		 width: 465px; 
		 height: 70px; 
		 padding-top : 5% !important;
		 margin-top: 8px;
	}
	
	#all{
		width : 500px;
		height: 170px;
		margin : 0 auto;
		padding-top : 10%;

	}
	img{
		width: 450px;
	}

	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	<%String msg=(String)request.getAttribute("msg"); %>
	window.onload=function(){
	    
	    if(<%=msg!=null%>){
	       alert('<%=msg%>');
	    }
	    
	 }

</script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>
<body>
<div id="line">
<div id="all">
<img src="img/Logo.jpg"/>
<div class="ui animated button" tabindex="0" onclick="location.href='ad_memberList.do?snum=1&cnum=10'">
  <div class="visible content">회원관리</div>
  <div class="hidden content">
    <i class="big users icon"></i>
  </div>
</div>
<div class="ui animated button" tabindex="0" onclick="location.href='ad_reviewChoice.do'">
  <div class="visible content">리뷰관리</div>
  <div class="hidden content">
    <i class="big list alternate outline icon"></i>
  </div>
</div>
<div class="ui animated button" tabindex="0" onclick="location.href='ad_restList.do?snum=1&cnum=10'">
  <div class="visible content">식당등록검토</div>
  <div class="hidden content">
    <i class="big calendar check outline icon"></i>
  </div>
</div>
<br/>
<div class="ui animated button" id="logout" tabindex="0" onclick="location.href='index.jsp'">
  <div class="visible content">로그아웃</div>
  <div class="hidden content">
    <i class="big power off icon" style="margin-top : -10px;"></i>
  </div>
</div>
</div>
</div>

<hr/>
<%@include file="footer.jsp" %>
<%-- <jsp:include page="footer.jsp"/> --%>
</body>
</html>