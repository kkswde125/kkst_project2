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
</style>
</head>
<body>
<p id="hateListsP">hateList:<span id="hateList"></span></p>
<%
	for(int i = 0; i < list.size(); i++){
%>
<table>
	<tr>
		<td><img alt="<%=list.get(i).getName()%>" src="resources/upload/<%=list.get(i).getChange()%>" title="<%=list.get(i).getName()%>" onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>','<%=list.get(i).getSeq()%>','<%=list.get(i).getName()%>')"></td>
	</tr>
</table>
	<%
	}
	%>
<div id="all">
<img alt="prevIcon" src="resources/images/prev.png" onclick="prevList()" id="prev" style="width: 100px; height: 100px;">
<div id="firstz"></div>
<div id="secondz"></div>
<div id="thirdz"></div>
<img alt="nextIcon" src="resources/images/next.png" onclick="nextList()" id="next" style="width: 100px; height: 100px;">
</div>
</body>
</html>