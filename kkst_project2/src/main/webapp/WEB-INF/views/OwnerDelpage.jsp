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
<title>점주 탈퇴 페이지</title>

<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>


<script type="text/javascript">

function ChkPw(pw) {
	
	var ResultPw = "<%=AoDto.getPw()%>";
	
	
	if(pw==ResultPw){
		alert("비밀번호 확인 완료 안녕히가세요!");
	
	}else if(pw!=ResultPw){
		alert("비밀번호가 일치 하지 않습니다. 다시 확인해주세요");
		
		$("#Chkpw").prop("placeholder","").focus();
		
		return false;
	}
	
}


</script>


<style type="text/css">

	#all{
		padding-top:10%;
		width: 600px;
		margin : 0 auto;
	}

</style>
</head>
<body>

<form action="ow_ownerDel.do" method="post" onsubmit="return ChkPw(Chkpw.value)">
<input type="hidden" name="res_seq" value="<%=AoDto.getRes_seq()%>">


<div id="all">

<img src="img/Delwarring.jpg" />

<div class="ui left icon input" style="width: 300px;">
 <i class="key icon"></i>
  <input type="password" placeholder="비밀번호 확인" name="pw" id="Chkpw" required="required">
</div>

<button class="ui button">비밀번호 확인</button>
<div class="ui animated button" tabindex="0" onclick="location.href='ow_owner.do'" >
  <div class="visible content">이전</div>
  <div class="hidden content">
    <i class="reply icon"></i>
  </div>
</div>

</div>
</form>

</body>
</html>