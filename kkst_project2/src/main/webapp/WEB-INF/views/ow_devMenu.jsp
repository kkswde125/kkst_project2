<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.AttrJoinDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% String msg = (String)request.getAttribute("msg"); %>
<% ResDto rDto=(ResDto)request.getSession().getAttribute("rDto");%>
<% 
	@SuppressWarnings("unchecked")
	List<menuDto> mDto=(List<menuDto>)request.getAttribute("mDto"); 
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr1 = (List<AttrJoinDto>) request.getAttribute("Attr1");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr2 = (List<AttrJoinDto>) request.getAttribute("Attr2");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr3 = (List<AttrJoinDto>) request.getAttribute("Attr3");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr4 = (List<AttrJoinDto>) request.getAttribute("Attr4"); 
	
	 List<AttrJoinDto> tast1=(List<AttrJoinDto>)request.getAttribute("tast1");
	 List<AttrJoinDto> tast2=(List<AttrJoinDto>)request.getAttribute("tast2");
	 List<AttrJoinDto> tast3=(List<AttrJoinDto>)request.getAttribute("tast3");
	 List<AttrJoinDto> tast4=(List<AttrJoinDto>)request.getAttribute("tast4");
	 List<AttrJoinDto> tast5=(List<AttrJoinDto>)request.getAttribute("tast5");
	
	 
	 String[] attrs1=new String[tast1.size()];
	 String[] attrs2=new String[tast2.size()];
	 String[] attrs3=new String[tast3.size()];
	 String[] attrs4=new String[tast4.size()];
	 String[] attrs5=new String[tast5.size()];
	 
	 for(int i=0; i<tast1.size(); i++){
		 attrs1[i] = tast1.get(i).getAttr();
	 }
	 for(int i=0; i<tast2.size(); i++){
		 attrs2[i] = tast2.get(i).getAttr();
	 }
	 for(int i=0; i<tast3.size(); i++){
		 attrs3[i] = tast3.get(i).getAttr();
	 }
	 for(int i=0; i<tast4.size(); i++){
		 attrs4[i] = tast4.get(i).getAttr();
	 }
	 for(int i=0; i<tast5.size(); i++){
		 attrs5[i] = tast5.get(i).getAttr();
	 }
	 
	 
	 int[] stars1=new int[tast1.size()];
	 int[] stars2=new int[tast2.size()];
	 int[] stars3=new int[tast3.size()];
	 int[] stars4=new int[tast4.size()];
	 int[] stars5=new int[tast5.size()];
	 
	 for(int i=0; i<tast1.size(); i++){
		 stars1[i] = tast1.get(i).getStars();
	 }
	 for(int i=0; i<tast2.size(); i++){
		 stars2[i] = tast2.get(i).getStars();
	 }
	 for(int i=0; i<tast3.size(); i++){
		 stars3[i] = tast3.get(i).getStars();
	 }
	 for(int i=0; i<tast4.size(); i++){
		 stars4[i] = tast4.get(i).getStars();
	 }
	 for(int i=0; i<tast5.size(); i++){
		 stars5[i] = tast5.get(i).getStars();
	 }
	 
	 
	 
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/Nwagon.css" type="text/css">
<script src="resources/js/Nwagon.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>점주 개발메뉴 페이지</title>
<script type="text/javascript">

	var attrs1=[]; var attrs2=[]; var attrs3=[]; var attrs4=[]; var attrs5=[];
	var stars1=[]; var stars2=[]; var stars3=[]; var stars4=[]; var stars5=[];
	
	<%for(int i =0; i< attrs1.length; i++){%>attrs1.push('<%=attrs1[i]%>');<%}%>
	<%for(int i =0; i< attrs2.length; i++){%>attrs2.push('<%=attrs2[i]%>');<%}%>
	<%for(int i =0; i< attrs3.length; i++){%>attrs3.push('<%=attrs3[i]%>');<%}%>
	<%for(int i =0; i< attrs4.length; i++){%>attrs4.push('<%=attrs4[i]%>');<%}%>
	<%for(int i =0; i< attrs5.length; i++){%>attrs5.push('<%=attrs5[i]%>');<%}%>
	<%for(int i =0; i< stars1.length; i++){%>stars1.push(parseInt('<%=stars1[i] %>'));<%}%>
	<%for(int i =0; i< stars2.length; i++){%>stars2.push(parseInt('<%=stars2[i]%>'));<%}%>
	<%for(int i =0; i< stars3.length; i++){%>stars3.push(parseInt('<%=stars3[i]%>'));<%}%>
	<%for(int i =0; i< stars4.length; i++){%>stars4.push(parseInt('<%=stars4[i]%>'));<%}%>
	<%for(int i =0; i< stars5.length; i++){%>stars5.push(parseInt('<%=stars5[i]%>'));<%}%>
	
	
	
	var count = 1;
	$(function() {
		$('#graphz').children().appendTo("#hiddens");
		$('#t1').appendTo('#graphz');
		
	});
	function prev() {
		var thiz = $('#graphz').children().eq(0);
		var thiz_id = thiz.attr("id");
		if (parseInt(thiz_id.substr(1, 2))-1<1) {
			count = 5;
		}else{
			count--;
		}
		$('#graphz').children().eq(0).appendTo('#hiddens');
		$("#t"+count).appendTo("#graphz");
	}
	function next() {
		var thiz = $('#graphz').children().eq(0);
		var thiz_id = thiz.attr("id");
		if(parseInt(thiz_id.substr(1, 2))+1>5){
			count = 1;
		}else{
			count++;
		}
		$('#graphz').children().eq(0).appendTo('#hiddens');
		$("#t"+count).appendTo("#graphz");
	}
</script>
<style type="text/css">
.all{
width: 800px;
margin : 0 auto;
text-align: center;
padding-bottom:2%;
}
#prev{
display: inline-block;
margin-bottom: 100px;
}
#graphz{
width: 500px;
display: inline-block;
}
#next{
display: inline-block;
margin-bottom: 100px;
}
#t1, #t2, #t3, #t4, #t5{
animation: mysecond 2s;-moz-animation: mysecond 2s;-webkit-animation: mysecond 2s;-o-animation: mysecond 2s;
width: 500px;
}
#prev:hover, #next:hover{
cursor: pointer;
opacity: 0.3;
}


@keyframes mysecond{0% { opacity: 0.1;}100% { opacity: 1;}}
@-moz-keyframes mysecond{0% { opacity: 0.1;}100% { opacity: 1;}}
@-webkit-keyframes mysecond{0% { opacity: 0.1;}100% { opacity: 1;}}
@-o-keyframes mysecond{0% { opacity: 0.1;}100% { opacity: 1;}}

</style>
</head>
<body>

<div class="all">
<img style="cursor: pointer;" src="img/Logo.jpg" onclick="location.href='ow_owner.do'">
<% 
if(mDto==null){
	%>

<h1><%=msg%></h1>
<br><br>
<table border="1" style="text-align: center; width: 800px; height: 300px;" class="ui celled table">
	<caption> 점주님의 식당은<strong><%=rDto.getCate()%></strong>입니다.</caption>
	<tr>
		<td>&nbsp;&nbsp;</td>
		<td>순위</td>
		<td>내용</td>
	</tr>
	
	<tr>
		<th>주재료</th>
		<td><%=Attr1.get(0).getRk() %></td>
		<td><%=Attr1.get(0).getAttr()%></td>
	</tr>
	
	<tr>
		<th>조리방식</th>
		<td><%=Attr2.get(0).getRk() %></td>
		<td><%=Attr2.get(0).getAttr()%></td>
	</tr>
	
		<tr>
		<th>매움정도</th>
		<td><%=Attr3.get(0).getRk() %></td>
		<td><%=Attr3.get(0).getAttr()%></td>
	</tr>
		<tr>
		<th>온도</th>
		<td><%=Attr4.get(0).getRk() %></td>
		<td><%=Attr4.get(0).getAttr()%></td>
	</tr>

</table>
<input type="button" value="이전"  onclick="location.href='ow_owner.do'" class="ui button" />

<%
}else if(mDto.size()>0){
	%>
	
	<h2><%=mDto.size()%>개의 추천 메뉴</h2>
	
	<div>
	<c:forEach items="${mDto}" var="mDto">
	<p>${mDto.name}</p>	
	</c:forEach>
	</div>
	<br><br>
	<table border="1" style="text-align: center; width: 800px; height: 300px;" class="ui celled table">
	<caption> 점주님의 식당은 <strong> <%=rDto.getCate()%></strong> 입니다.</caption>
	<tr>
		<td>&nbsp;&nbsp;</td>
		<td>순위</td>
		<td>내용</td>
	</tr>

	<tr>
		<th>주재료</th>
		<td><%=Attr1.get(0).getRk()%></td>
		<td><%=Attr1.get(0).getAttr()%></td>
	</tr>
	
	<tr>
		<th>조리방식</th>
		<td><%=Attr2.get(0).getRk() %></td>
		<td><%=Attr2.get(0).getAttr()%></td>
	</tr>
	
		<tr>
		<th>매움정도</th>
		<td><%=Attr3.get(0).getRk() %></td>
		<td><%=Attr3.get(0).getAttr()%></td>
	</tr>
		<tr>
		<th>온도</th>
		<td><%=Attr4.get(0).getRk() %></td>
		<td><%=Attr4.get(0).getAttr()%></td>
	</tr>

</table>


	<%
}
%>
</div>



<div class="all">
<img id="prev" alt="이전버튼이미지" src="resources/images/prev.png" onclick="prev()">
<div id="graphz" style="margin-right: 2%;">
<div class="graphs" id="t1"><h1 style="text-align: center;">업종에 따른 <br/>전체유저 입맛 평점</h1></div>
<div class="graphs" id="t2"><h1 style="text-align: center;">주재료에 따른 <br/>전체유저 입맛 평점</h1></div>
<div class="graphs" id="t3"><h1 style="text-align: center;">조리방식에 따른 <br/>전체유저 입맛 평점</h1></div>
<div class="graphs" id="t4"><h1 style="text-align: center;">매움정도에 따른 <br/>전체유저 입맛 평점</h1></div>
<div class="graphs" id="t5"><h1 style="text-align: center;">온도에 따른 <br/>전체유저 입맛 평점</h1></div>
</div>
<img id="next" alt="다음버튼이미지" src="resources/images/next.png" onclick="next()"><br/>
<input type="button" value="이전"  onclick="location.href='ow_owner.do'" class="ui button" />
</div>
<script>

var options = {
		'legend':{
			names: attrs1
		},
		'dataset': {
			title: 'Web accessibility status',
			values: [stars1],
			bgColor: '#f9f9f9',
			fgColor: '#30a1ce',
		},
		'chartDiv': 't1',
		'chartType': 'radar',
		'chartSize': { width: 500, height: 300 }
	};
	Nwagon.chart(options);
var options2 = {'legend':{names: attrs2},'dataset': {title: 'Web accessibility status2',values: [stars2],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't2','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options2);
var options3 = {'legend':{names: attrs3},'dataset': {title: 'Web accessibility status2',values: [stars3],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't3','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options3);
var options4 = {'legend':{names: attrs4},'dataset': {title: 'Web accessibility status2',values: [stars4],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't4','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options4);
var options5 = {'legend':{names: attrs5},'dataset': {title: 'Web accessibility status2',values: [stars5],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't5','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options5); 
</script>
<div id="hiddens" style="display: none;"></div>
</body>
</html>