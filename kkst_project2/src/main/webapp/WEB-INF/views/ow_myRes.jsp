<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%ResDto rDto=(ResDto)request.getSession().getAttribute("rDto"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 가게 관리 페이지</title>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>



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
	
	.all{
		width : 500px;
		height: 170px;
		margin : 0 auto;
		padding-top : 10%;

	}
	img{
		width: 450px;
	}
</style>
</head>
<body>
<div class="line">
<div class="all">
<img src="img/Logo.jpg"/>

<div class="ui animated button" tabindex="0" onclick="location.href='ResInfoPage.do?res_seq=<%=rDto.getSeq()%>'">
  <div class="visible content">내 식당 상세보기</div>
  <div class="hidden content">
<i class="big search icon" style="margin-top : -10px;"></i>		
  </div>
</div>	

<%
	if(rDto.getChk().equals("Y")){
		%>
<div class="ui animated button" tabindex="0" onclick="location.href='ow_Res_Review.do?seq=<%=rDto.getSeq()%>&name=<%=rDto.getName()%>&start=1&end=10'">
  <div class="visible content">내 식당 리뷰보기</div>
  <div class="hidden content">
<i  class="big thumbs up outline icon" style="margin-top : -10px;"></i>		
  </div>
</div>	
		<%
		
	}else if(rDto.getChk().equals("N")){
		%>
<div class="ui animated button" tabindex="0" onclick="">
  <div class="visible content">내 식당 리뷰보기</div>
  <div class="hidden content"> 현재 다시 검토중인 식당입니다.</div>
</div>	
		<%
	}
%>

<div class="ui animated button" tabindex="0" onclick="location.href='ResUpdatePage.do?res_seq=<%=rDto.getSeq()%>'">
  <div class="visible content">내 식당 정보 수정</div>
  <div class="hidden content">
  <i class="big edit outline icon"style="margin-top : -10px;"></i>
  </div>
</div>	
<br><br>
<div class="ui animated button" tabindex="0" style="width: 467px;"  class="logout" onclick="location.href='ow_owner.do'">
 <div class="visible content">메인 페이지로</div>
  <div class="hidden content">
<i class="big undo alternate icon" style="margin-top : -10px;"></i>
  </div>
</div>

</div>
</div>


</body>
</html>