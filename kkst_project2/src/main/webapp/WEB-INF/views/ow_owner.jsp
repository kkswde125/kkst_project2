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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    

window.onload=function(){
	
    if(<%=msg!=null%>){
        alert('<%=msg%>');
    	return; 
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
<a href="#">소비자 선호도 통계조회</a>
<a href="devMenu.do?seq=<%=AoDto.getRes_seq()%>">개발 메뉴 추천</a>
<a href="#">지역별 최다 선호 음식 출력</a>
<a href="myRes.do?">내 가게 관리</a>
<a href="InfoView.do">내정보보기</a>
<button onclick="location.href='ac_ownerlogout.do'" >로그아웃</button>
		<%
	}else if(chk.equals("No")){
		%>
		 <h1>아직 식당을 등록하지 않았군요!아래버튼을 눌러 등록해주세요!</h1>
		 <button onclick="location.href='ac_ResListAddPage.do?res_seq=<%=AoDto.getRes_seq()%>'">식당 등록</button>
		 <button onclick="location.href='ac_ownerlogout.do'" >로그아웃</button>
		<%
	}

%>
</body>
</html>