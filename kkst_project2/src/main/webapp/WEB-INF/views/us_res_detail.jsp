<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pro.kkst.utils.Us_Utils"%>
<%@page import="com.pro.kkst.dtos.ResReviewDto"%>
<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%response.setHeader("Cache-Control","no-store");response.setHeader("Pragma","no-cache");response.setHeader("Expires","0");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<%	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){	pageContext.forward("ac_login.do");	}
	ResDto dto = (ResDto)request.getAttribute("dto");
	String cate = (String)request.getSession().getAttribute("cate");
	String mName = (String)request.getSession().getAttribute("mName");
	String seq = (String)request.getSession().getAttribute("seq");
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
	for(int i = 0; i < avgStarCount; i++){
		starIcon += "★";
	}
	for(int i = 0; i < 5-avgStarCount; i++){
		starIcon += "☆";
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>us_res_detail</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
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
	function chk() {
		var count=0;var star=0;
		$('input[name=star]').each(function() {if ($(this).prop('checked')) {star++;}else{count++;}});
		if (count==5) {alert("리뷰등록을 위해선 반드시 별점을 주셔야 합니다.");return false;}
		if ($('input[name=content]').val()=="") {var thestar = '★';for (var i = 1; i < star; i++) {thestar = thestar + '★';}$('input[name=content]').val(thestar);}
		
	}
	function goBack() {location.href="us_reslist.do?cate="+"<%=cate%>"+"&mName="+"<%=mName%>"+"&seq="+"<%=seq%>";
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
</script>
<style type="text/css">
#all{
		padding-top:0px;
		width: 1200px;
		margin : 0 auto;
		
}
input[type=checkbox] { display:none; }
input[type=checkbox] + label {display: inline-block;cursor: pointer;line-height: 22px;padding-left: 22px;background: url('resources/upload/starw.png') left/22px no-repeat;}
input[type=checkbox]:checked + label { background-image: url('resources/upload/stars.png');}
.replyIcon:hover{cursor: pointer;}
.modifyIcon:hover{cursor: pointer;}
.deleteIcon:hover{cursor: pointer;}
table{border-collapse: collapse;}
td{text-align: center;}
.likeyBtn{
    padding: 1px 4px;
    height: 18px;
    line-height: 15px;
    vertical-align: top;
    border: 1px solid #9f9f9f;
    font-size: 11px;
    background-color: #fff;
    letter-spacing: -1px;
    font-family: dotum,sans-serif;
    cursor: pointer;
    color: #e94a23;
    float: right;
}
.dislikeyBtn{
    padding: 1px 4px;
    height: 18px;
    line-height: 15px;
    vertical-align: top;
    border: 1px solid #9f9f9f;
    font-size: 11px;
    background-color: #fff;
    letter-spacing: -1px;
    font-family: dotum,sans-serif;
    cursor: pointer;
    color: #007acf;
    float: right;
}
.reportBtn{
    padding: 1px 4px;
    height: 18px;
    line-height: 15px;
    vertical-align: top;
    border: 1px solid #9f9f9f;
    font-size: 11px;
    background-color: #fff;
    letter-spacing: -1px;
    font-family: dotum,sans-serif;
    cursor: pointer;
    color: black;
    float: right;
}
#reviewTable td{
	max-width: 1000px;
}
#reviewTable{
	margin: 0 auto;
}
.deletes{
	color: gray; font-family: gulim, 굴림, Helvetica; font-size: 9pt;
}
.reports{
	color: gray; font-family: gulim, 굴림, Helvetica; font-size: 9pt;
}
.contents{
	font-family: gulim, 굴림, Helvetica;
	font-size: 9pt;
	line-height: 150%;
	word-wrap: break-word;
}
.showBlind{
	font-family: gulim, 굴림, Helvetica;
	font-size: 9pt;
}
#resNameLabel{
	font-size: 16px;
    text-align: center;
    width: 80px;
    height: 25px;
    background-color: #dddddd;
    padding-bottom: 2px;
    padding-top: 2px;
    padding-left: 20px;
    padding-right: 20px;
}
#resName{
	font-size: 25px;
    font-weight: bold;
    padding: 30px;
    vertical-align: middle;
}
#resNameTd{
	 vertical-align: middle;
}
#gobacks:hover{
	cursor: pointer;
	opacity: 0.8;
}
#t1{
	margin: 0 auto;
}
#t2{
	margin: 0 auto;
}
#t3{
	margin: 0 auto;
}
#t4{
	margin: 0 auto;
}
#menulists{
	margin: 0 auto;
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
<tr><td colspan="3">식당사진</td></tr>
<tr><td colspan="3"><%if(resPhoto==null){%><span>--등록된 식당사진이 없습니다---</span><%}else{%><img alt="<%=dto.getName() %>" src="resources/upload/<%=resPhoto%>" style="width: 200px; height: 200px;"><%}%></td></tr>
</table>
<table id="menulists" border="1">
<%if(menuList.size()==0){%>
<tr><td>메뉴 사진</td></tr>
<tr><td>---등록된 메뉴사진이 없습니다---</td></tr><%
}else{%><tr><th colspan="<%=menuList.size()%>">메뉴 사진</th></tr><tr><%
for(int i = 0; i < menuList.size(); i++){
%><td><img alt="<%=menuList.get(i).getName()%>" src="resources/upload/<%=menuList.get(i).getChange()%>" style="width: 100px; height: 100px;"><br/><%=menuList.get(i).getName()%></td><%}%></tr><%
}%>
</table>
<hr/>
<table id="t3" border="1">
<caption>식당정보</caption>
<col width="100px"><col width="200px"><col width="100px"><col width="200px">
<tr><th>카테고리</th><td><%=dto.getCate() %></td><th>전화번호</th><td><%=dto.getCall() %></td></tr>
<tr><th>주소</th>	<td colspan="3"><%=dto.getAddr() %></td></tr>
<tr><th>영업시간</th><td><%=dto.getStart() %> ~ <%=dto.getEnd() %></td><th>휴식시간</th><td><%=dto.getRest_start() %> ~ <%=dto.getRest_end() %></td></tr>
<tr><th>주차여부</th><td><%=dto.getParking().equals("Y")?"가능":(dto.getParking().equals("U")?"정보없음":"불가") %></td><th>영업상태</th><td><%=dto.getOpen().equals("Y")?"영업중":"휴업중" %></td></tr>
<tr><th>점주코멘트</th><td colspan="3"><%=dto.getComment() %></td></tr>
</table>
<hr/>
<table border="1" id="reviewTable">
<col width="150px;" ><col width="100px;"><col width="1000px;"><col width="200px;">
<%
	if(list.size()==0){
		%>
			<tr><td colspan="4">---등록된 리뷰가 없습니다---</td></tr>
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
						<span class="showBlind">[내용보기]</span><span class="blindContent"><span class="contents"><%=list2.get(i).getContent() %></span></span></span><%
				}else{%>
					<span><span class="contents"><%=list2.get(i).getContent() %></span></span>
					<input class="reportBtn" type="button" onclick="addReport('<%=ldto.getId()%>', '<%=list2.get(i).getReport()==null?0:(list2.get(i).getReport()) %>', '<%=list2.get(i).getSeq() %>')" value="신고 <%=list2.get(i).getReport_Count() %>">
					<input class="dislikeyBtn" type="button" onclick="addDislikey('<%=ldto.getId()%>','<%=list2.get(i).getDislikey()==null?0:(list2.get(i).getDislikey()) %>', '<%=list2.get(i).getSeq() %>')" value="비공감 <%=list2.get(i).getDislikey_Count() %>">
					<input class="likeyBtn" type="button" onclick="addLikey('<%=ldto.getId()%>','<%=list2.get(i).getLikey()==null?0:(list2.get(i).getLikey()) %>', '<%=list2.get(i).getSeq() %>')" value="공감 <%=list2.get(i).getLikey_Count()%>">
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
						<span class="showBlind">[내용보기]</span><span class="blindContent"><span class="contents"><%=list.get(i).getContent() %></span></span></span><%
				}else{%>
					<span class="contents"><%=list.get(i).getContent() %></span>
					<div style="display: inline-block; position: relative;" class="formDiv"><div style="position: absolute; top:-50px; left:50px; display: inline-block; width: 1000px;">
							<form action="us_reply.do" method="post" style="display: inline-block;">
								<input type="hidden" name="seq" value="<%=list.get(i).getSeq() %>" />
								<input type="text" name="content" maxlength="100" placeholder="답글을 입력해주세요" required="required" />
								<button type="submit">확인</button>
							</form></div></div>
					<img alt="답글쓰기아이콘" title="답글쓰기" src="resources/upload/reply.png" class="replyIcon"/>
					<%if(ldto.getNickName().equals(list.get(i).getId())){%>
					<div style="display: inline-block; position: relative;" class="formDiv"><div style="position: absolute; top:-50px; left:50px; display: inline-block; width: 1000px;">
							<form action="us_modify.do" method="post" style="display: inline-block;">
								<input type="hidden" name="seq" value="<%=list.get(i).getSeq() %>" />
								<input type="text" name="content" maxlength="100" placeholder="수정할 내용을 입력해주세요" required="required" />
								<button type="submit">수정완료</button>
							</form></div></div>
					<img alt="수정하기아이콘" title="수정" src="resources/upload/modify.png" class="modifyIcon"/>
					<div style="display: inline-block; position: relative;" class="formDiv"><div style="position: absolute; top:-50px; left:50px; display: inline-block; width: 300px;">
							<form action="us_delete.do" method="post" style="display: inline-block;">
								<input type="hidden" name="seq" value="<%=list.get(i).getSeq() %>" />
								<span>※삭제하시겠습니까?※</span>
								<button type="submit">예</button>
							</form></div></div>
					<img alt="삭제하기아이콘" title="삭제" src="resources/upload/delete.png" class="deleteIcon"/>
					<%}%>
				<%}%>
				<input class="reportBtn" type="button" onclick="addReport('<%=ldto.getId()%>', '<%=list.get(i).getReport()==null?0:(list.get(i).getReport()) %>', '<%=list.get(i).getSeq() %>')" value="신고 <%=list.get(i).getReport_Count() %>">
				<input class="dislikeyBtn" type="button" onclick="addDislikey('<%=ldto.getId()%>','<%=list.get(i).getDislikey()==null?0:(list.get(i).getDislikey()) %>', '<%=list.get(i).getSeq() %>')" value="비공감 <%=list.get(i).getDislikey_Count() %>">
				<input class="likeyBtn" type="button" onclick="addLikey('<%=ldto.getId()%>','<%=list.get(i).getLikey()==null?0:(list.get(i).getLikey()) %>', '<%=list.get(i).getSeq() %>')" value="공감 <%=list.get(i).getLikey_Count()%>">
				</td>
				<td><%=sdf.format(list.get(i).getRegDate()) %></td>
			</tr><%}%>
		<tr><td colspan="4" style="text-align: center"><%if(count>100){int starts = Integer.parseInt(start); int ends = Integer.parseInt(end);
			if(ends<101){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100-1)*100+1%>&end=<%=(starts/100-1)*100+10%>">prev</a><%}
			for(int j = (starts/100)*10; j < Math.ceil((double)count/10); j++){
				if(j>=(starts/100)*10+10){break;}%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=10*j+1%>&end=<%=10*j+10%>" style="font-size: 20px;"><%=(j+1)%></a><span>&nbsp;</span><%}
			if(((starts/100+1)*100)>=(count)){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100+1)*100+1%>&end=<%=(starts/100+1)*100+10%>">next</a><%}	
			}else{for(int j = 0; j < Math.ceil((double)count/10); j++){%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(j*10+1)%>&end=<%=j*10+10%>" style="font-size: 20px;"><%=j+1%></a><span>&nbsp;</span><%}}%>
		</td></tr><%}%>
</table>
<form action="us_write_review.do" method="post" onsubmit="return chk()">
<input type="hidden" name="id" value="<%=ldto.getSeq()%>"/><input type="hidden" name="res_Seq" value="<%=dto.getSeq()%>"/>
<table  id="t4" border="1">
<col width="500px"><col width="200px"><col width="100px">
<tr><th>리뷰내용</th><th>평점</th><th>*</th></tr>
<tr><td><input type="text" name="content" maxlength="100" placeholder="별점만 등록시 별점이 내용으로 입력됩니다." style="width: 480px;"/></td>
	<td>
	<input id="box1" class="star" type="checkbox" name="star" value="1" /><label for="box1">&nbsp; </label>
	<input id="box2" class="star" type="checkbox" name="star" value="2" /><label for="box2">&nbsp; </label>
	<input id="box3" class="star" type="checkbox" name="star" value="3" /><label for="box3">&nbsp; </label>
	<input id="box4" class="star" type="checkbox" name="star" value="4" /><label for="box4">&nbsp; </label>
	<input id="box5" class="star" type="checkbox" name="star" value="5" /><label for="box5">&nbsp;</label>
	</td>
	<td><button type="submit" >리뷰등록</button></td></tr>
</table>
</form>
</div>
</body>
</html>