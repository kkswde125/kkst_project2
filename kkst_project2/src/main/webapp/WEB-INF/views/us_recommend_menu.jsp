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
	String rs="";
	for (int i = 0; i < seqs.length; i++) {
		if (i!=seqs.length-1) {
			rs= rs+seqs[i]+"_";
		}else {
			rs= rs+seqs[i];
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
	
	function goMore(start, end) {
		location.href="us_recommend_menu.do?start="+start+"&end="+end+"&seqs="+keepMenuSeqs;
	}
	function moreRcmd() {
			$('table').hide();
			$('#more').show();
	}
	
	function goKeepList() {
		var rs="";
		for (var i = 0; i < keepMenuSeqs.length; i++) {
			if (i!=keepMenuSeqs.length-1) {
				rs= rs+keepMenuSeqs[i]+"_";
			}else {
				rs= rs+keepMenuSeqs[i];
			}
		}
		
		var hateRs="";
		if (hateMenuCodes.length==0) {
			hateRs="null";
		}
		for (var i = 0; i < hateMenuCodes.length; i++) {
			if (i!=hateMenuCodes.length-1) {
				hateRs= hateRs+hateMenuCodes[i]+"_";
			}else {
				hateRs= hateRs+hateMenuCodes[i];
			}
		}
		
		location.href="us_keeplist.do?seqs="+rs+"&hateRs="+hateRs;
	}
	
	function theLast() {
		if (<%=list.size()%>==menuIndex) {
			$('table').hide();
			$('#theLast').show();
		}
	}
	
	function choiceThis(cate,seq,mName) {
		var hateRs="";
		if (hateMenuCodes.length==0) {
			hateRs="null";
		}
		
		for (var i = 0; i < hateMenuCodes.length; i++) {
			if (i!=hateMenuCodes.length-1) {
				hateRs= hateRs+hateMenuCodes[i]+"_";
			}else {
				hateRs= hateRs+hateMenuCodes[i];
			}
		}
		
		location.href= "us_customize_taste.do?cate="+cate+"&seq="+seq+"&mName="+mName+"&hateRs="+hateRs;
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
		$('#keepList').text(keepMenuNames.toString());
		$('#keepSeqs').text(keepMenuSeqs.toString());
		$('#hateList').text(hateMenuCodes.toString());
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
		$('#keepList').text(keepMenuNames.toString());
		$('#keepSeqs').text(keepMenuSeqs.toString());
		$('#hateList').text(hateMenuCodes.toString());
// 		alert(hateMenuCodes.toString());
	}
	
	$(function() {
		$('#more').hide();
		$('#theLast').hide();
		$('table').hide();
		$('#tables'+menuIndex).show();
		var asdf= '<%=rs%>';
		keepMenuSeqs=asdf.split(",");
		
		
		
		
	});
</script>
</head>
<body>
<p>listSize=<%=list.size()%> / </p>
<p>Keep리스트: <span id="keepList"></span></p>
<p>KeepSeqs: <span id="keepSeqs"></span></p>
<p>Hate리스트: <span id="hateList"></span></p>
<%
	for(int i = 0; i < list.size(); i++){
		
	
%>
<table id="tables<%=i%>">
	<tr>
		<td>음식사진</td>
	</tr>
	<tr>
		<td><%=list.get(i).getName() %></td>
	</tr>
	<tr>
		<td>
			<button onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>','<%=list.get(i).getSeq()%>','<%=list.get(i).getName()%>')">결정!</button>
			<button onclick="keepThis('<%=list.get(i).getName()%>','<%=list.get(i).getSeq()%>')">보류하고 다음메뉴보기</button>
			<button onclick="hateThis('<%=list.get(i).getCode()%>')">이건 싫음</button>
		</td>
	</tr>
</table>
	<%
	}
	%>
<button id="more" onclick="goMore('<%=start%>','<%=end%>')">더 추천받기</button>
<p id="theLast">모든 메뉴를 추천받으셨습니다. Keep리스트를 보시거나 메인페이지로 이동하세요.</p>
<hr/>
<button onclick="goKeepList()">KeepList보기</button>
<button onclick="location.href='us_usermain.do'">유저메인으로</button>
<hr/>
<hr/>
<h3>밑은개발용</h3>
<%
	for(int i = 0; i < list.size(); i++){
		%>
			<p>
				<span>
					<a href="us_reslist.do?cate=<%=(list.get(i).getCode()).substring(0, 1)%>">
						<%=list.get(i).getName()%>(<%=Math.round(list.get(i).getStarz())%>)
					</a>
				</span>
				<input type="button" value="안선택"/>
			</p>
		<%
	}
%>
<button onclick="location.href='us_usermain.do'">뒤로</button>
</body>
</html>