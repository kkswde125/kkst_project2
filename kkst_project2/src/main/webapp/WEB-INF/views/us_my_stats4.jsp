<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@page import="com.pro.kkst.dtos.AttrsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%	
	LoginDto ldto = (LoginDto)request.getSession().getAttribute("ldto");
	@SuppressWarnings("unchecked")
	List<AttrsDto> list = (List<AttrsDto>)request.getAttribute("list");
	String[] attrs = new String[list.size()];
	for (int i = 0; i < attrs.length; i++) {attrs[i] = list.get(i).getAttr();}
	int[] stars = new int[list.size()];
	for (int i = 0; i < stars.length; i++) {stars[i] = (int)Math.round(list.get(i).getStars());}
	String[] types = (String[])request.getAttribute("types");
	String[] typez = new String[types.length]; String[] lengthz = new String[types.length];
	for(int i = 0; i < types.length; i++){typez[i] = types[i].split(",")[0];lengthz[i] = types[i].split(",")[1];}
	String starsToString = "", typesToString = "", attrsToString = "", typezToString = "", lengthzToString = "";
	for(int i = 0; i < stars.length; i++){if(i!=0){starsToString += ","+stars[i];}else{starsToString += stars[i];}}
	for(int i = 0; i < types.length; i++){if(i!=0){typesToString += ","+types[i];}else{typesToString += types[i];}}
	for(int i = 0; i < attrs.length; i++){if(i!=0){attrsToString += ",,"+attrs[i];}else{attrsToString += attrs[i];}}
	for(int i = 0; i < typez.length; i++){if(i!=0){typezToString += ","+typez[i];}else{typezToString += typez[i];}}
	for(int i = 0; i < lengthz.length; i++){if(i!=0){lengthzToString += ","+lengthz[i];}else{lengthzToString += lengthz[i];}}
	int i = 1;
	
	%>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/Nwagon.css" type="text/css">
<script src="resources/js/Nwagon.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var starsToString = "<%=starsToString%>";
	var typesToString = "<%=typesToString%>";
	var attrsToString = "<%=attrsToString%>";
	var typezToString = "<%=typezToString%>";
	var lengthzToString = "<%=lengthzToString%>";
	var stars = [];	var types = [];	var attrs = [];	var typez =[];	var lengthz=[];
	stars=starsToString.split(",");	types=typesToString.split(",");	attrs=attrsToString.split(",,");	typez=typesToString.split(",");
	lengthz=lengthzToString.split(",");
	for (var i = 0; i < stars.length; i++) {stars[i] = parseInt(stars[i], 10);}
	for (var i = 0; i < lengthz.length; i++) {lengthz[i] = parseInt(lengthz[i], 10);}
	var attrs1 = [];	var attrs2 = [];	var attrs3 = [];	var attrs4 = [];	var attrs5 = [];
	var stars1 = [];	var stars2 = [];	var stars3 = [];	var stars4 = [];	var stars5 = [];
	for (var i = 0; i < attrs.length; i++) {
		if (i<lengthz[0]) {
			attrs1.push(attrs[i]);
		}else if(i<lengthz[1]+lengthz[0]){
			attrs2.push(attrs[i]);
		}else if(i<lengthz[2]+lengthz[1]+lengthz[0]){
			attrs3.push(attrs[i]);
		}else if(i<lengthz[3]+lengthz[2]+lengthz[1]+lengthz[0]){
			attrs4.push(attrs[i]);
		}else{
			attrs5.push(attrs[i]);
		}
	}
	for (var i = 0; i < stars.length; i++) {
		if (i<lengthz[0]) {
			stars1.push(stars[i]);
		}else if(i<lengthz[1]+lengthz[0]){
			stars2.push(stars[i]);
		}else if(i<lengthz[2]+lengthz[1]+lengthz[0]){
			stars3.push(stars[i]);
		}else if(i<lengthz[3]+lengthz[2]+lengthz[1]+lengthz[0]){
			stars4.push(stars[i]);
		}else{
			stars5.push(stars[i]);
		}
	}
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
#all{
padding-top:10%;
width: 800px;
margin : 0 auto;
text-align: center;
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
<div id="all">
<img id="prev" alt="이전버튼이미지" src="resources/images/prev.png" onclick="prev()">
<div id="graphz">
<div class="graphs" id="t1"><h1 style="text-align: center;">업종에 따른 <br/><%=ldto.getId() %>님의 입맛 평점</h1></div>
<div class="graphs" id="t2"><h1 style="text-align: center;">주재료에 따른 <br/><%=ldto.getId() %>님의 입맛 평점</h1></div>
<div class="graphs" id="t3"><h1 style="text-align: center;">조리방식에 따른 <br/><%=ldto.getId() %>님의 입맛 평점</h1></div>
<div class="graphs" id="t4"><h1 style="text-align: center;">매움정도에 따른 <br/><%=ldto.getId() %>님의 입맛 평점</h1></div>
<div class="graphs" id="t5"><h1 style="text-align: center;">온도에 따른 <br/><%=ldto.getId() %>님의 입맛 평점</h1></div>
</div>
<img id="next" alt="다음버튼이미지" src="resources/images/next.png" onclick="next()"><br/>
<button class="btn btn-default" onclick="location.href='us_usermain.do'">뒤로가기</button>
<button class="btn btn-primary" onclick="location.href='us_regist_moreTaste.do'">추가 입맛 설정</button>
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
<button onclick="location.href='us_my_stats.do'">v1</button>
<div id="hiddens" style="display: none;"></div>
</body>
</html>
