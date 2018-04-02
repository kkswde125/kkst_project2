<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
	
	int start = Integer.parseInt((String)request.getAttribute("start"));
	int end = Integer.parseInt((String)request.getAttribute("end"));
	start=start+20;
	end=end+20;
	
	
	String[] seqs = request.getParameterValues("seqs");
	String[] hateRs = request.getParameterValues("hateRs");
	
	String seqs_str="";
	String hateRs_str="";
	
	if(seqs!=null){
		for (int i = 0; i < seqs.length; i++) {
			if (i!=seqs.length-1) {
				seqs_str += seqs[i]+"_";
			}else {
				seqs_str += seqs[i];
			}
		}
	}
	
	if(hateRs!=null){
		for (int i = 0; i < hateRs.length; i++) {
			if (i!=hateRs.length-1) {
				hateRs_str += hateRs[i]+"_";
			}else {
				hateRs_str += hateRs[i];
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	List<MenuzDto> list=(List<MenuzDto>)request.getAttribute("list");
	boolean isLast=false;
	if(list.size()<20){
		isLast=true;
	}
%>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>recommend_menu.jsp</title>
<script type="text/javascript">
	var menuIndex=0;
	var keepMenuNames = [];
	var keepMenuSeqs = [];
	var hateMenuCodes = [];
	
	$(function() {
		$('#more').hide();
		$('#theLast').hide();
		$('table').hide();
		$('#tables'+menuIndex).show();
		var asdf= "<%=seqs_str%>";
		if (asdf!="") {
			keepMenuSeqs=asdf.split("_");
		}
		
		var qwer= "<%=hateRs_str%>";
		if (qwer!="") {
			hateMenuCodes=qwer.split("_");
		}
		
// 		$('#keepList').text(keepMenuNames.toString());
// 		$('#keepSeqs').text(keepMenuSeqs.toString());
// 		$('#hateList').text(hateMenuCodes.toString());
	});
	
	function goMore(start, end) {
		location.href="us_recommend_menu.do?start="+start+"&end="+end+"&seqs="+keepMenuSeqs+"&hateRs="+hateMenuCodes;
	}
	function moreRcmd() {
			$('table').hide();
			$('#more').show();
	}
	
	function goKeepList() {
		if (keepMenuNames.length==0) {
			alert("keep한 메뉴가 없습니다.")
			return;
		}
		location.href="us_keeplist.do?seqs="+keepMenuSeqs+"&hateRs="+hateMenuCodes;
	}
	
	function theLast() {
		if (<%=list.size()%>==menuIndex) {
			$('table').hide();
			$('#theLast').show();
		}
	}
	
	function choiceThis(cate,seq,mName) {
		location.href= "us_customize_taste.do?cate="+cate+"&seq="+seq+"&mName="+mName+"&hateRs="+hateMenuCodes;
	}
		
	function keepThis(name, seq) {
		keepMenuNames.push(name);
		keepMenuSeqs.push(seq);
		menuIndex++;
		$('table').hide();
		$('#tables'+menuIndex).show();
		if (<%=isLast%>) {
			theLast();
		}
		if (menuIndex==20) {
			moreRcmd();
		}
// 		$('#keepList').text(keepMenuNames.toString());
// 		$('#keepSeqs').text(keepMenuSeqs.toString());
// 		$('#hateList').text(hateMenuCodes.toString());
// 		alert(keepMenuNames.toString());
		
	}
	
	function hateThis(code) {
		hateMenuCodes.push(code);
		menuIndex++;
		$('table').hide();
		$('#tables'+menuIndex).show();
		
		if (<%=isLast%>) {
			theLast();
		}
		if (menuIndex==20) {
			moreRcmd();
		}
// 		$('#keepList').text(keepMenuNames.toString());
// 		$('#keepSeqs').text(keepMenuSeqs.toString());
// 		$('#hateList').text(hateMenuCodes.toString());
// 		alert(hateMenuCodes.toString());
	}
	
	window.onload = function(){
  		var t =performance.timing;
		  setTimeout(function(){
		    console.log(t.loadEventStart - t.responseEnd);
		  }, 0);
		  
		  setTimeout(() => {
			$('#loadingImg').css('display','none');
			$('#all').css('display','block');
		}, t.loadEventStart - t.responseEnd+500);
		}
</script>
<style type="text/css">
#all{
		display:none;
		padding-top:0px;
		width: 1000px;
		margin : 0 auto;
	}
#loading01{
	width: 89px; height: 85px;
}
#mainH1{
	display: inline-block;
	font-weight: bold;
    font-size: 36px;
    width: 300px;
    height: 54px;
}
#headers{
	text-align: center;
}
table{
	text-align: center;
}
.btnImg{
	width: 220px;
	height: 254px;
}
.btnImg:hover {
	cursor: pointer;
	opacity: 0.7;
}
.namez{
	font-weight: bold;
    font-size: 32px;
    text-align: center;
}
#keepListBtn{
padding: 1px 4px;height: 18px;line-height: 15px;vertical-align: top;border: 1px solid #9f9f9f;font-size: 12px;background-color: #fff;letter-spacing: -1px;font-family: dotum,sans-serif;
cursor: pointer;color: blue;margin: 1px;width: 100px;
margin : 0 auto;
text-align: center;
}
#usermainBtn{
padding: 1px 4px;height: 18px;line-height: 15px;vertical-align: top;border: 1px solid #9f9f9f;font-size: 12px;background-color: #fff;letter-spacing: -1px;font-family: dotum,sans-serif;
cursor: pointer;color: blue;margin: 1px;width: 100px;
margin : 0 auto;
text-align: center;
}
#loadingImg{
	padding-top: 1%;
		width: 800px;
		margin : 0 auto;
		text-align: center;
}
#loadingText{
	font-size: 20px;
    font-weight: bold;
    text-align: center;
}
.imgs{
	border-radius: 100px;
}
</style>
</head>
<body>
<div id="all">
<p id="headers">
<img alt="이미지01" src="resources/images/loading01.gif" id="loading01">
<span id="mainH1">이 음식은 어때요?</span><br/>
</p>
<%
	for(int i = 0; i < list.size(); i++){
		
	
%>
<table id="tables<%=i%>">
	<tr>
		<td rowspan="2">
		<img alt="hateImage" src="resources/images/hate.jpg" title="먹기싫음" onclick="hateThis('<%=list.get(i).getCode()%>')" class="btnImg" >
		</td>
		<td><img class="imgs" alt="<%=list.get(i).getName()%>" src="resources/Resimg/<%=list.get(i).getChange()%>" style="width: 500px; height: 500px;"></td>
		<td rowspan="2">
		<img alt="choiceImage" src="resources/images/choice.jpg" title="선택하기" onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>','<%=list.get(i).getSeq()%>','<%=list.get(i).getName()%>')" class="btnImg">
		</td>
	</tr>
	<tr>
		<td><span class="namez"><%=list.get(i).getName() %></span></td>
	</tr>
	<tr>
		<td colspan="3">
			<img alt="keepImage" src="resources/images/keeping.jpg" title="보류하고 다음메뉴보기" onclick="keepThis('<%=list.get(i).getName()%>','<%=list.get(i).getSeq()%>')" class="btnImg" >
		</td>
	</tr>
</table>
	<%
	}
	%>
<button id="more" onclick="goMore('<%=start%>','<%=end%>')">더 추천받기</button>
<p id="theLast">모든 메뉴를 추천받으셨습니다. Keep리스트를 보시거나 메인페이지로 이동하세요.</p>
<hr/>
<div style="text-align: center;">
<button onclick="goKeepList()" id="keepListBtn">KeepList보기</button>
<button onclick="location.href='us_usermain.do'" id="usermainBtn">유저메인으로</button>
</div>
</div>
<%-- <p>listSize=<%=list.size()%> / </p> --%>
<!-- <p>Keep리스트: <span id="keepList"></span></p> -->
<!-- <p>KeepSeqs: <span id="keepSeqs"></span></p> -->
<!-- <p>Hate리스트: <span id="hateList"></span></p> -->
<div id="loadingImg">
<img alt="로딩이미지" src="resources/images/recommending.gif"><br/>
<p id="loadingText">좀 더 맛있어 할만한 음식 찾는 중 . . .</p>
</div>
</body>
</html>