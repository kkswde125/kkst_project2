<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setHeader("Expires","0");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
		
	@SuppressWarnings("unchecked")
	List<MenuzDto> list=(List<MenuzDto>)request.getAttribute("list");
	
	String[] hateRs = request.getParameterValues("hateRs");
	String hateRs_str="";
	if(hateRs!=null){
		for (int i = 0; i < hateRs.length; i++) {
			if (i!=hateRs.length-1) {
				hateRs_str += hateRs[i]+"_";
			}else {
				hateRs_str += hateRs[i];
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var hateMenuCodes = [];
	
	
	
	function choiceThis(cate,seq,mName) {
		location.href= "us_customize_taste.do?cate="+cate+"&seq="+seq+"&mName="+mName+"&hateRs="+hateMenuCodes;
	}
	
	var ii = 1;	
	var maxSize = <%=list.size()%>; 
	var first = null;
	var second = null;
	var third = null;
	$(function() {

		if (maxSize==1) {
			ii=0;
			$('#firstz').css('display','none');
			$('#thirdz').css('display','none');
			$('#prev').css('display','none');
			$('#next').css('display','none');
		}
		
		if (maxSize==2) {
			ii=0;
			$('#firstz').css('display','none');
		}
		
		first = $('table img').eq(ii-1<0?maxSize:ii-1);
		second = $('table img').eq(ii);
		third = $('table img').eq(ii+1>maxSize?0:ii+1);
		
		var qwer= "<%=hateRs_str%>";
		if (qwer!="") {
			hateMenuCodes=qwer.split("_");
		}
		$('#hateList').text(hateMenuCodes.toString());
		
		
		first.clone().appendTo('#firstz');
		second.clone().appendTo('#secondz');
		third.clone().appendTo('#thirdz');
		
		
	});
	
	function nextList() {
		if (ii+1>maxSize-1) {
			ii=0;
		}else{
			ii++;
		}
		first = $('table img').eq(ii-1<0?maxSize-1:ii-1);
		second = $('table img').eq(ii);
		third = $('table img').eq(ii+1>maxSize-1?0:ii+1);
		$('#firstz').empty();
		$('#secondz').empty();
		$('#thirdz').empty();
		first.clone().appendTo('#firstz');
		second.clone().appendTo('#secondz');
		third.clone().appendTo('#thirdz');
	}
	
	function prevList() {
		if (ii-1<0) {
			ii=maxSize-1;
		}else{
			ii--;
		}
		first = $('table img').eq(ii-1<0?maxSize-1:ii-1);
		second = $('table img').eq(ii);
		third = $('table img').eq(ii+1>maxSize-1?0:ii+1);
		$('#firstz').empty();
		$('#secondz').empty();
		$('#thirdz').empty();
		first.clone().appendTo('#firstz');
		second.clone().appendTo('#secondz');
		third.clone().appendTo('#thirdz');
	}
</script>
<style type="text/css">
#all{
	padding-top:0px;
	width: 1200px;
	margin : 0 auto;
	position: relative;
	text-align: center;
}
table{
	display: none;
}
img{
	width: 500px;
	height: 300px;
}
img:hover{
	cursor: pointer;
	opacity: 0.9;
}
#firstz{
	display: inline-block;
	position: absolute;
	z-index: 1;
	top: 350px;
	left: 100px;
	
}
#secondz{
	display: inline-block;
	position: absolute;
	z-index: 2;
	top: 300px;
	left: 400px;
}
#thirdz{
	display: inline-block;
	position: absolute;
	z-index: 1;
	top: 350px;
	left: 700px;
}
#secondz>img{
	width: 600px;
	height: 400px;
}
#prev{
	display: inline-block;
	position: absolute;
	top: 400px;
	left: 0px;
}

#next{
	display: inline-block;
	position: absolute;
	top: 400px;
	left: 1200px;
}
#prev:hover {
	cursor: pointer;
	opacity: 0.5;
}
#next:hover {
	cursor: pointer;
	opacity: 0.5;
}
#hateListsP{
	display: none;
}
.imgs{
	border-radius: 50px;
}
#textz{
	margin-left: 15%;
}
#infoM:hover {
cursor: pointer;
opacity: 0.3;
}
</style>
</head>
<body>
<p id="hateListsP">hateList:<span id="hateList"></span></p>
<%
	for(int i = 0; i < list.size(); i++){
%>
<table>
	<tr>
		<td><img class="imgs" alt="<%=list.get(i).getName()%>" src="resources/Resimg/<%=list.get(i).getChange()%>" title="<%=list.get(i).getName()%>" onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>','<%=list.get(i).getSeq()%>','<%=list.get(i).getName()%>')"></td>
	</tr>
</table>
	<%
	}
	%>
<div id="all">
<div id="textz">
<h1 style="display: inline-block;">KeepList</h1>
<a href="#" id="infoM" title="음식 사진 클릭시: 입맛평점에 반영되며 식당지도페이지로 이동합니다."><img alt="정보창이미지" src="resources/images/infoM.png" style="width: 24px; height: 24px;"></a>
<br/>
<p style="display: inline-block;">※선택을 보류하신 메뉴리스트입니다. 원하시는 메뉴의 사진을 클릭하세요. </p><br/>
<button class="btn btn-default" onclick="location.href='us_usermain.do'">메인으로</button>
</div>
<img alt="prevIcon" src="resources/images/prev.png" onclick="prevList()" id="prev" style="width: 100px; height: 100px;">
<div id="firstz"></div>
<div id="secondz"></div>
<div id="thirdz"></div>
<img alt="nextIcon" src="resources/images/next.png" onclick="nextList()" id="next" style="width: 100px; height: 100px;">
</div>
</body>
</html>