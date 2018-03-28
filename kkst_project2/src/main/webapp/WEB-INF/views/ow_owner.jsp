<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%String msg=(String)request.getAttribute("msg"); %>
<%String chk=(String)request.getSession().getAttribute("Chk"); %>
<%Admin_OnwerDto AoDto =(Admin_OnwerDto)session.getAttribute("AoDto"); %>
<%ResDto rDto=(ResDto)request.getSession().getAttribute("rDto"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

    

window.onload=function(){
	
    if(<%=msg!=null%>){
        alert('<%=msg%>');
	}
    
    if(<%=rDto.getChk().equals("N")%>){
    	$("a").attr("hidden","hidden");
    	$("body").append("<h1>아직 승인 대기중 입니다. 관리자에게 문의하세요!</h1>");
    }
    
    
 }
</script>
</head>
<body>
<%
	if(chk.equals("Yes")){
		%>	

<div class="ui animated button" tabindex="0" onclick="location.href='InfoView.do'">
  <div class="visible content">내정보 보기</div>
  <div class="hidden content">
<i class="big address book outline icon"style="margin-top : -10px;"></i>		
  </div>
</div>		

<div class="ui animated button" tabindex="0" onclick="location.href='myRes.do'">
  <div class="visible content">내 가게 관리</div>
  <div class="hidden content">
<i class="big warehouse icon"  style="margin-top : -10px;"></i>
  </div>
</div>	

<div class="ui animated button" tabindex="0" onclick="location.href='devMenu.do?seq=<%=AoDto.getRes_seq()%>'">
  <div class="visible content">개발 메뉴 추천</div>
  <div class="hidden content">
<i class="big clipboard list icon"  style="margin-top : -10px;"></i>
  </div>
</div>	

<div class="ui animated button" tabindex="0" onclick="location.href='ac_ownerlogout.do'">
 <div class="visible content">로그아웃</div>
  <div class="hidden content">
<i class="big power off icon" style="margin-top : -10px;"></i>
  </div>
</div>

		<%
	}else if(chk.equals("No")){
		%>
		 <h1>아직 식당을 등록하지 않았군요!아래버튼을 눌러 등록해주세요!</h1>
		 
		 <div class="ui animated button" tabindex="0" onclick="location.href='ac_ResListAddPage.do?res_seq=<%=AoDto.getRes_seq()%>'">
 			<div class="visible content">식당 등록</div>
  			<div class="hidden content">
		 	<i class=" big cart plus icon"  style="margin-top : -10px;"></i>
    		</div>
		</div>
		 

		 <div class="ui animated button" tabindex="0" onclick="location.href='InfoView.do'">
  			<div class="visible content">내정보 보기</div>
  			<div class="hidden content">
			<i class="big address book outline icon"style="margin-top : -10px;"></i>		
  			</div>
		</div>		
			
		<div class="ui animated button" tabindex="0" onclick="location.href='ac_ownerlogout.do'">
 			<div class="visible content">로그아웃</div>
  			<div class="hidden content">
			<i class="big power off icon" style="margin-top : -10px;"></i>
  			</div>
		</div>
		 
		 
		<%
	}

%>
</body>
</html>