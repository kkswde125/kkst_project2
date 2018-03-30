<%@page import="com.pro.kkst.dtos.AttrsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%	@SuppressWarnings("unchecked")
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
	for(int i = 0; i < lengthz.length; i++){if(i!=0){lengthzToString += ","+lengthz[i];}else{lengthzToString += lengthz[i];}}%>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/Nwagon.css" type="text/css">
<script src="resources/js/Nwagon.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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
</script>
</head>
<body>
<div id="t1"></div>
<div id="t2"></div>
<div id="t3"></div>
<div id="t4"></div>
<div id="t5"></div>
<script>
var options = {
		'legend':{
			names: attrs1,
			hrefs: attrs1
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
	
var options2 = {'legend':{names: attrs2,hrefs: attrs2},'dataset': {title: 'Web accessibility status2',values: [stars2],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't2','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options2);
var options3 = {'legend':{names: attrs3,hrefs: attrs3},'dataset': {title: 'Web accessibility status2',values: [stars3],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't3','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options3);
var options4 = {'legend':{names: attrs4,hrefs: attrs4},'dataset': {title: 'Web accessibility status2',values: [stars4],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't4','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options4);
var options5 = {'legend':{names: attrs5,hrefs: attrs5},'dataset': {title: 'Web accessibility status2',values: [stars5],bgColor: '#f9f9f9',fgColor: '#30a1ce',},
		'chartDiv': 't5','chartType': 'radar','chartSize': { width: 500, height: 300 }};
	Nwagon.chart(options5);
	
</script>
<button onclick="location.href='us_my_stats.do'">v1</button>
</body>
</html>