<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%String msg=(String)request.getAttribute("msg"); %>
<%String chk=(String)request.getAttribute("chk"); %>
<%Admin_OnwerDto AoDto =(Admin_OnwerDto)session.getAttribute("AoDto"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
    
    if(<%=msg!=null%>){
       alert('<%=msg%>');
    }
    
 }
</script>
</head>
<body>
<%
	if(chk.equals("Yes")){
		%>
<a href="#">소비자 선호도 통계조회</a>
<a href="#">개발 메뉴 추천</a>
<a href="#">지역별 최다 선호 음식 출력</a>
<a href="#">추가 식당 등록</a>
<a href="#">식당 정보 수정</a>
		<%
	}else if(chk.equals("No")){
		%>
		 <h1>아직 식당을 등록하지 않았군요!아래버튼을 눌러 등록해주세요!</h1>
		 <a href="ac_ResListAddPage.do?res_seq="+<%=AoDto.getRes_seq()%>>식당 등록</a>
		<%
	}

%>
</body>
</html>