<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pro.kkst.utils.Us_Utils"%>
<%@page import="com.pro.kkst.dtos.ResReviewDto"%>
<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%response.setHeader("Cache-Control","no-store");response.setHeader("Pragma","no-cache");response.setHeader("Expires","0");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<%	
	ResDto dto = (ResDto)request.getAttribute("dto");
	String seq = (String)request.getAttribute("seq");
	@SuppressWarnings("unchecked")
	List<MenuzDto> menuList = (List<MenuzDto>)request.getAttribute("menuList");
	@SuppressWarnings("unchecked")
	List<ResReviewDto> list = (List<ResReviewDto>)request.getAttribute("list");
	@SuppressWarnings("unchecked")
	List<ResReviewDto> list2 = (List<ResReviewDto>)request.getAttribute("list2");
	String resPhoto = (String)request.getAttribute("resPhoto");
	String start = (String)request.getSession().getAttribute("start");
	String end = (String)request.getSession().getAttribute("end");
	String res_Seq= (String)request.getSession().getAttribute("res_Seq");
	int count = Integer.parseInt((String)request.getAttribute("count"));
	Us_Utils util = new Us_Utils();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String avgStar = (String)request.getAttribute("avgStar");
	int avgStarCount = (int)Math.floor(Double.parseDouble(avgStar));
	String starIcon = "";
	for(int i = 0; i < avgStarCount; i++){starIcon += "★";}
	for(int i = 0; i < 5-avgStarCount; i++){starIcon += "☆";}
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점주 리뷰 보기페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var ii = 1;	
	var maxSize = <%=menuList.size()%>;
	var resPhoto = '<%=resPhoto%>';
	var first = null;var second = null;var third = null;
	$(function() {
		var submit = false;
		$('form').submit(function(e) {
			$('#loadingImg2').css('display','block');
			$('#all').css('display','none');
			var count=0;
			var star=0;
			setTimeout(function(e) {
				$('input[name=star]').each(function() {if ($(this).prop('checked')) {star++;}else{count++;}});
				if (count==5) {alert("리뷰등록을 위해선 반드시 별점을 주셔야 합니다."); $('#loadingImg2').css('display','none'); $('#all').css('display','block'); return false;}
				if ($('input[name=content]').val()=="") {var thestar = '★';for (var i = 1; i < star; i++) {thestar = thestar + '★';}$('input[name=content]').val(thestar);}
				submit = true;
				$('form').submit();
			}, 3000);
			if(!submit){
				e.preventDefault();
			}
		});
		if (resPhoto=='null' && maxSize==0) {
			$('#prev').css('display','none');$('#next').css('display','none');
			$('#southKorea').css('top','400px');
		}else if (resPhoto=='null' && maxSize!=0) {
			$('#southKorea').css('top','800px');
		}else if (resPhoto!='null' && maxSize==0) {
			$('#southKorea').css('top','800px');
		}
		if (maxSize==1) {
			ii=0;
			$('#firstz').css('display','none');$('#thirdz').css('display','none');
			$('#prev').css('display','none');$('#next').css('display','none');
		}
		if (maxSize==2) {
			ii=0;
			$('#firstz').css('display','none');
		}
		first = $('.menulistTD img').eq(ii-1<0?maxSize:ii-1);second = $('.menulistTD img').eq(ii);third = $('.menulistTD img').eq(ii+1>maxSize?0:ii+1);
		first.clone().appendTo('#firstz');second.clone().appendTo('#secondz');third.clone().appendTo('#thirdz');
		$('input[name=star]').click(function() {
			if ($(this).prop('checked')) {$(this).prevAll('input[name=star]').prop('checked',$(this).prop('checked'));}else{
				$(this).nextAll('input[name=star]').prop('checked',$(this).prop('checked'));
			}
		});
		$('.formDiv').hide();
		$('.replyIcon').click(function() {$(this).prev().toggle();});
		$('.modifyIcon').click(function() {$(this).prev().toggle();});
		$('.deleteIcon').click(function() {$(this).prev().toggle();});
		$('.blindContent').hide();
		$('.showBlind').hover(function() {
			$(this).css("color", "blue");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("color", "black");
			$(this).css("cursor", "default");
		});
		$('.showBlind').click(function() {
			$(this).next().toggle();
		});
	});
	function goBack() {
		location.href="myRes.do";
	}
	function addLikey(user_id, likey, review_seq) {
		if (likey=='0') {location.href="us_addLikey.do?id="+user_id+"&review_seq="+review_seq+"&likey=0";
		}else{var likeys = likey.split(",");	for (var i = 0; i < likeys.length; i++) {if (user_id==likeys[i]) {alert('이미 공감한 리뷰입니다.');return;	}}
			location.href="us_addLikey.do?id="+user_id+"&review_seq="+review_seq+"&likey=1";}
	}
	function addDislikey(user_id, dislikey, review_seq) {
		if (dislikey=='0') {location.href="us_addDislikey.do?id="+user_id+"&review_seq="+review_seq+"&dislikey=0";
		}else{var dislikeys = dislikey.split(",")
			for (var i = 0; i < dislikeys.length; i++) {if (user_id==dislikeys[i]) {alert('이미 비공감한 리뷰입니다.');	return;	}}
			location.href="us_addDislikey.do?id="+user_id+"&review_seq="+review_seq+"&dislikey=1";}
	}
	function addReport(user_id, report, review_seq) {
		if (report=='0') {location.href="us_addReport.do?id="+user_id+"&review_seq="+review_seq+"&report=0";
		}else{var reports = report.split(",")
			for (var i = 0; i < reports.length; i++) {if (user_id==reports[i]) {alert('이미 신고한 리뷰입니다.');return;}}
			location.href="us_addReport.do?id="+user_id+"&review_seq="+review_seq+"&report=1";}
	}
	function nextList() {
		if (ii+1>maxSize-1) {ii=0;}else{ii++;}
		first = $('.menulistTD img').eq(ii-1<0?maxSize-1:ii-1);
		second = $('.menulistTD img').eq(ii);
		third = $('.menulistTD img').eq(ii+1>maxSize-1?0:ii+1);
		$('#firstz').empty();$('#secondz').empty();$('#thirdz').empty();
		first.clone().appendTo('#firstz');second.clone().appendTo('#secondz');third.clone().appendTo('#thirdz');
	}
	function prevList() {
		if (ii-1<0) {ii=maxSize-1;}else{ii--;}
		first = $('.menulistTD img').eq(ii-1<0?maxSize-1:ii-1);
		second = $('.menulistTD img').eq(ii);
		third = $('.menulistTD img').eq(ii+1>maxSize-1?0:ii+1);
		$('#firstz').empty();$('#secondz').empty();$('#thirdz').empty();
		first.clone().appendTo('#firstz');second.clone().appendTo('#secondz');third.clone().appendTo('#thirdz');
	}
</script>
<style type="text/css">
#all{padding-top:0px;width: 1400px;margin : 0 auto;position: relative;}
input[type=checkbox] { display:none; }
input[type=checkbox] + label {display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url('resources/upload/starw.png') left/22px no-repeat;}
input[type=checkbox]:checked + label { background-image: url('resources/upload/stars.png');}
.replyIcon:hover{cursor: pointer;}
.modifyIcon:hover{cursor: pointer;}
.deleteIcon:hover{cursor: pointer;}
table{border-collapse: collapse;}
td{text-align: center;}
.likeyBtn{padding: 1px 4px;height: 18px;line-height: 15px;vertical-align: top;border: 1px solid #9f9f9f;font-size: 11px;background-color: #fff;letter-spacing: -1px;font-family: dotum,sans-serif;
    		cursor: pointer;color: #e94a23;float: right;margin: 1px;}
.dislikeyBtn{padding: 1px 4px;height: 18px;line-height: 15px;vertical-align: top;border: 1px solid #9f9f9f;font-size: 11px;background-color: #fff;letter-spacing: -1px;font-family: dotum,sans-serif;
    		cursor: pointer;color: #007acf;float: right;margin: 1px;}
.reportBtn{padding: 1px 4px;height: 18px;line-height: 15px;vertical-align: top;border: 1px solid #9f9f9f;font-size: 11px;background-color: #fff;letter-spacing: -1px;font-family: dotum,sans-serif;
    		cursor: pointer;color: black;float: right;margin: 1px;}
#reviewTable td{max-width: 1000px;}
#reviewTable{margin: 0 auto;}
.deletes{color: gray; font-family: gulim, 굴림, Helvetica; font-size: 9pt;}
.reports{color: gray; font-family: gulim, 굴림, Helvetica; font-size: 9pt;}
.contents{font-family: gulim, 굴림, Helvetica;font-size: 10pt;line-height: 150%;word-wrap: break-word;}
.showBlind{font-family: gulim, 굴림, Helvetica;font-size: 9pt;}
#resNameLabel{font-size: 16px;text-align: center;width: 80px;height: 25px;background-color: #dddddd;padding-bottom: 2px;padding-top: 2px;padding-left: 20px;padding-right: 20px;}
#resName{font-size: 25px;font-weight: bold;padding: 30px;vertical-align: middle;}
#resNameTd{vertical-align: middle;}
#gobacks{position: absolute;top: 10px;left: 0px;}
#gobacks:hover{cursor: pointer;opacity: 0.8;}
#t1{margin: 0 auto;}
#t2{margin: 0 auto;}
#t3{margin: 0 auto;}
#t3 th{padding: 10px;}
#t3 td{text-align: left;padding: 10px;}
#t4{margin: 0 auto;}
#menulists{margin: 0 auto;}
.menulistTD{display: none;}
#menuz{padding-top:0px;width: 1200px;margin : 0 auto;position: relative;}
#firstz{display: inline-block;position: absolute;z-index: -2;top: 100px;left: 0px;}
#secondz{display: inline-block;position: absolute;z-index: -1;top: 50px;left: 300px;}
#thirdz{display: inline-block;position: absolute;z-index: -2;top: 100px;left: 600px;}
#secondz>img{width: 600px;height: 400px;}
#prev{display: inline-block;position: absolute;top: 200px;left: -100px;}
#next{display: inline-block;position: absolute;top: 200px;left: 1100px;}
#prev:hover {cursor: pointer;opacity: 0.5;}
#next:hover {cursor: pointer;opacity: 0.5;}
#southKorea{position: absolute;top: 1300px;}
#rp{font-weight: bold;font-size: 32px;text-align: center;}
#mps{font-weight: bold;font-size: 32px;text-align: center;}
hr{width: 700px;}
.titlezz{font-weight: bold;font-size: 32px;text-align: center;}
th{text-align: center;}
#loadingImg2{
	padding-top: 1%;
		width: 800px;
		margin : 0 auto;
		text-align: center;
		display: none;
}
#loadingText2{
	font-size: 20px;
    font-weight: bold;
    text-align: center;
}
.imgs{
	border-radius: 50px;
}
</style>
</head>
<body>
<div id="all">
<table id="t1">
<tr><td><img alt="뒤로가기이미지" src="resources/images/goback.png" onclick="goBack()" id="gobacks" title="뒤로가기"></td>
	<td><img alt="상세보기이미지" src="resources/images/detail.png"></td>
	<td id="resNameTd"><span id="resNameLabel">식당명</span><span id="resName"><%=dto.getName() %>(<%=avgStar.equals("0.0")?"평점:평가없음":"평점: "+starIcon+"("+avgStar+")"%>)</span></td>
</tr>
</table>
<hr/>
<table id="t2">
<tr><td colspan="3" id="rp">RESTAURANT PICTURE</td></tr>
<tr><td colspan="3"><%if(resPhoto==null){%><span style="display: inline-block; ">※등록된 식당사진이 없습니다※</span><%}else{%><img class="imgs" alt="<%=dto.getName() %>" src="resources/Resimg/<%=resPhoto%>" style="width: 700px; height: 500px;"><%}%></td></tr>
</table>
<br/><br/>
<table id="menulists">
<tr><td id="mps">MENU PICTURES</td></tr>
<%if(menuList.size()==0){%>
<tr><td>※등록된 메뉴사진이 없습니다※</td></tr><%
}else{%><tr><%
for(int i = 0; i < menuList.size(); i++){
%><td class="menulistTD"><img class="imgs" alt="<%=menuList.get(i).getName()%>" src="resources/Resimg/<%=menuList.get(i).getChange()%>" title="<%=menuList.get(i).getName()%>"  style="width: 100%; height: 100%;"></td><%}%></tr>
<%}%></table>
<div id="menuz">
<img alt="prevIcon" src="resources/images/prev.png" onclick="prevList()" id="prev" style="width: 100px; height: 100px;">
<div id="firstz" style="width: 500px; height: 300px;"></div>
<div id="secondz" style="width: 600px; height: 400px;"></div>
<div id="thirdz" style="width: 500px; height: 300px;"></div>
<img alt="nextIcon" src="resources/images/next.png" onclick="nextList()" id="next" style="width: 100px; height: 100px;">
</div>
<div id="southKorea">
<hr/>
<p class="titlezz">INFORMATION</p>
<table id="t3">
<col width="100px"><col width="200px"><col width="100px"><col width="200px">
<tr><th>업종</th><td><%=dto.getCate() %></td><th>전화번호</th><td><%=dto.getCall() %></td></tr>
<tr><th>영업시간</th><td><%=dto.getStart() %> ~ <%=dto.getEnd() %></td><th>휴식시간</th><td><%=dto.getRest_start() %> ~ <%=dto.getRest_end() %></td></tr>
<tr><th>주차여부</th><td><%=dto.getParking().equals("Y")?"가능":(dto.getParking().equals("U")?"정보없음":"불가") %></td><th>영업상태</th><td><%=dto.getOpen().equals("Y")?"영업중":"휴업중" %></td></tr>
<tr><th>주소</th>	<td colspan="3"><%=dto.getAddr() %></td></tr>
<tr><th>코멘트</th><td colspan="3"><%=dto.getComment() %></td></tr>
</table>
<hr/>
<p class="titlezz">REVIEW</p>
<table id="reviewTable" class="table table-striped">
<col width="150px;" ><col width="100px;"><col width="1000px;"><col width="200px;">
<%
	if(list.size()==0){
		%>
			<tr><th>작성자</th><th>식당평점</th><th>리뷰</th><th>등록일시</th></tr>
			<tr><td colspan="4">※등록된 리뷰가 없습니다※</td></tr>
		<%		
	}else{
		%>
			<tr><th>작성자</th><th>식당평점</th><th>리뷰</th><th>등록일시</th></tr>
		<%
		if(list2==null||list2.size()==0){}else{
			for(int i = 0; i < list2.size(); i++){%>
			<tr>
				<td style="background-color: #FFF6F3;"><%=list2.get(i).getId() %></td>
				<td style="background-color: #FFF6F3;"><%=list2.get(i).getStar()==0.0?"-":list2.get(i).getStar() %></td>
				<td style="background-color: #FFF6F3; text-align: left;"><%util.setArrowNbsp(list2.get(i).getDepth());%><%=util.getArrowNbsp() %>
				<%if(list2.get(i).getDelFlag().equals("Y")){%>
					<span class="deletes">※삭제된 글입니다※</span><%
				}else if(Integer.parseInt(list2.get(i).getReport_Count())>=10){%>
					<span>
						<span class="reports">※다량의 신고로 블라인드된 글입니다※</span>
						<span class="showBlind">[내용보기]</span><span class="blindContent"><span class="contents"><%=list2.get(i).getContent() %>&nbsp;  </span></span></span><%
				}else{%>
					<span><span class="contents"><%=list2.get(i).getContent() %>&nbsp;  </span></span>
					<input class="reportBtn" type="button" onclick="" value="신고 <%=list2.get(i).getReport_Count() %>">
					<input class="dislikeyBtn" type="button" onclick="" value="비공감 <%=list2.get(i).getDislikey_Count() %>">
					<input class="likeyBtn" type="button" onclick="" value="공감 <%=list2.get(i).getLikey_Count()%>">
				</td><%}%>
				<td style="background-color: #FFF6F3;"><%=sdf.format(list2.get(i).getRegDate()) %></td>
			</tr><%}}
		for(int i = 0; i < list.size(); i++){%>
			<tr>
				<td><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getStar()==0.0?"-":list.get(i).getStar()%></td>
				<td style="text-align: left;"><%util.setArrowNbsp(list.get(i).getDepth());%><%=util.getArrowNbsp() %>
				<%if(list.get(i).getDelFlag().equals("Y")){%>
					<span class="deletes">※삭제된 글입니다※</span><%
				}else if(Integer.parseInt(list.get(i).getReport_Count())>=10){%>
					<span>
						<span class="reports">※다량의 신고로 블라인드된 글입니다※</span>
						<span class="showBlind">[내용보기]</span><span class="blindContent"><span class="contents"><%=list.get(i).getContent() %>&nbsp;  </span></span></span><%
				}else{%>
					<span class="contents"><%=list.get(i).getContent() %>&nbsp;  </span>
					<input class="reportBtn" type="button"  value="신고 <%=list.get(i).getReport_Count() %>">
					<input class="dislikeyBtn" type="button"  value="비공감 <%=list.get(i).getDislikey_Count() %>">
					<input class="likeyBtn" type="button" value="공감 <%=list.get(i).getLikey_Count()%>">	
							
							
							
				<%}%>

				</td>
				<td><%=sdf.format(list.get(i).getRegDate()) %></td>
			</tr><%}%>
		<tr><td colspan="4" style="text-align: center"><%if(count>100){int starts = Integer.parseInt(start); int ends = Integer.parseInt(end);
			if(ends<101){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100-1)*100+1%>&end=<%=(starts/100-1)*100+10%>">prev</a><%}
			for(int j = (starts/100)*10; j < Math.ceil((double)count/10); j++){
				if(j>=(starts/100)*10+10){break;}%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=10*j+1%>&end=<%=10*j+10%>" style="font-size: 20px;"><%=(j+1)%></a><span>&nbsp;</span><%}
			if(((starts/100+1)*100)>=(count)){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100+1)*100+1%>&end=<%=(starts/100+1)*100+10%>">next</a><%}	
			}else{for(int j = 0; j < Math.ceil((double)count/10); j++){%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(j*10+1)%>&end=<%=j*10+10%>" style="font-size: 20px;"><%=j+1%></a><span>&nbsp;</span><%}}%>
		</td></tr>
		<%}%>
</table>
<hr/>
<p>&nbsp;<br/>&nbsp;<br/>&nbsp;&nbsp;<br/>&nbsp;<br/>&nbsp;</p>
</div>
</div>
<div id="loadingImg2">
<img alt="로딩이미지2" src="resources/images/review.gif"><br/>
<p id="loadingText2">소중한 리뷰 작성 감사합니다!<br/>입력하신 별점은 해당 식당의 평점에 반영됩니다.</p>
</div>
</body>
</html>