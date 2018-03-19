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
	String resPhoto = (String)request.getAttribute("resPhoto");
	String start = (String)request.getSession().getAttribute("start");
	String end = (String)request.getSession().getAttribute("end");
	String res_Seq= (String)request.getSession().getAttribute("res_Seq");
	int count = Integer.parseInt((String)request.getAttribute("count"));
	Us_Utils util = new Us_Utils(); %>
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
	});
	function chk() {
		var count=0;var star=0;
		$('input[name=star]').each(function() {if ($(this).prop('checked')) {star++;}else{count++;}});
		if (count==5) {alert("리뷰등록을 위해선 반드시 별점을 주셔야 합니다.");return false;}
		if ($('input[name=content]').val()=="") {var thestar = '★';for (var i = 1; i < star; i++) {thestar = thestar + '★';}$('input[name=content]').val(thestar);}
		
	}
	function goBack() {location.href="us_reslist.do?cate="+"<%=cate%>"+"&mName="+"<%=mName%>"+"&seq="+"<%=seq%>";}
	function addLikey(user_id, likey, review_seq) {
		if (likey=='0') {location.href="us_addLikey.do?id="+user_id+"&review_seq="+review_seq+"&likey=0";
		}else{var likeys = likey.split(",")	for (var i = 0; i < likeys.length; i++) {if (user_id==likeys[i]) {alert('이미 공감한 리뷰입니다.');return;	}}
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
input[type=checkbox] { display:none; }
input[type=checkbox] + label {display: inline-block;cursor: pointer;line-height: 22px;padding-left: 22px;background: url('resources/upload/starw.png') left/22px no-repeat;}
input[type=checkbox]:checked + label { background-image: url('resources/upload/stars.png');}
.replyIcon:hover{cursor: pointer;}
</style>
</head>
<body>
<table>
<tr><td><%if(resPhoto==null){%><span>--등록된 식당사진이 없습니다---</span><%}else{%><img alt="<%=dto.getName() %>" src="resources/upload/<%=resPhoto%>" style="width: 200px; height: 200px;"><%}%></td></tr>
<tr><th><%=dto.getName() %></th></tr>
<tr><th>메뉴 사진</th></tr>
<%if(menuList.size()==0){%>
<tr><td>---등록된 메뉴사진이 없습니다---</td></tr><%
}else{%><tr><%
for(int i = 0; i < menuList.size(); i++){
%><td><img alt="<%=menuList.get(i).getName()%>" src="resources/upload/<%=menuList.get(i).getChange()%>" style="width: 100px; height: 100px;"><br/><%=menuList.get(i).getName()%></td><%}%></tr><%
}%>
</table>
<table>
<caption>식당정보</caption>
<tr><th>카테고리</th><td><%=dto.getCate() %></td></tr>
<tr><th>주소</th>	<td><%=dto.getAddr() %></td></tr>
<tr><th>전화번호</th><td><%=dto.getCall() %></td></tr>
<tr><th>영업시작</th><td><%=dto.getStart() %></td></tr>
<tr><th>영업종료</th><td><%=dto.getEnd() %></td></tr>
<tr><th>휴식시작</th><td><%=dto.getRest_start() %></td></tr>
<tr><th>휴식종료</th><td><%=dto.getRest_end() %></td></tr>
<tr><th>주차여부</th><td><%=dto.getParking().equals("Y")?"가능":(dto.getParking().equals("U")?"정보없음":"불가") %></td></tr>
<tr><th>영업상태</th><td><%=dto.getOpen().equals("Y")?"영업중":"휴업중" %></td></tr>
<tr><th>한줄설명</th><td><%=dto.getComment() %></td></tr>
</table>
<table>
<%
	if(list.size()==0){
		%>
			<tr><td>---등록된 리뷰가 없습니다---</td></tr>
		<%		
	}else{
		%>
			<tr><th>작성자</th><th>리뷰</th><th>식당평점</th>	<th>공감</th>	<th>비공감</th><th>신고</th><th>등록일시</th></tr>
		<%
		for(int i = 0; i < list.size(); i++){
			%>
				<tr>
					<td><%=list.get(i).getId() %></td>
					<%if(list.get(i).getDelFlag().equals("Y")){%><td>---삭제된 리뷰입니다---</td><%}else{%>
					<td>
						<%util.setArrowNbsp(list.get(i).getDepth());%><%=util.getArrowNbsp() %><%=list.get(i).getContent() %>
						<div style="display: inline-block; position: relative;" class="formDiv"><div style="position: absolute; top:-50px; left:50px; display: inline-block;">
								<form action="us_reply.do" method="post" style="display: inline-block;">
									<input type="hidden" name="seq" value="<%=list.get(i).getSeq() %>" />
									<input type="text" name="content" placeholder="답글을 입력해주세요" required="required" />
									<button type="submit">확인</button>
								</form></div></div>
						<img alt="답글쓰기아이콘" title="답글쓰기" src="resources/upload/review.png" class="replyIcon"/>
					</td><%}%>
					<td><%=list.get(i).getStar() %></td>
					<td><input type="button" onclick="addLikey('<%=ldto.getId()%>','<%=list.get(i).getLikey()==null?0:(list.get(i).getLikey()) %>', '<%=list.get(i).getSeq() %>')" value="공감">
						<span>(<%=list.get(i).getLikey()==null?0:(list.get(i).getLikey().split(",").length) %>)</span></td>
					<td><input type="button" onclick="addDislikey('<%=ldto.getId()%>','<%=list.get(i).getDislikey()==null?0:(list.get(i).getDislikey()) %>', '<%=list.get(i).getSeq() %>')" value="비공감">
						<span>(<%=list.get(i).getDislikey()==null?0:(list.get(i).getDislikey().split(",").length) %>)</span></td>
					<td><input type="button" onclick="addReport('<%=ldto.getId()%>', '<%=list.get(i).getReport()==null?0:(list.get(i).getReport()) %>', '<%=list.get(i).getSeq() %>')" value="신고">
						<span>(<%=list.get(i).getReport()==null?0:(list.get(i).getReport().split(",").length) %>)</span></td>
					<td><%=list.get(i).getRegDate() %></td>
				</tr><%}%>
		<tr><td colspan="7" style="text-align: center"><%if(count>100){int starts = Integer.parseInt(start); int ends = Integer.parseInt(end);
			if(ends<101){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100-1)*100+1%>&end=<%=(starts/100-1)*100+10%>">prev</a><%}
			for(int j = (starts/100)*10; j < Math.ceil((double)count/10); j++){
				if(j>=(starts/100)*10+10){break;}%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=10*j+1%>&end=<%=10*j+10%>"><%=(j+1)%></a><%}
			if(((starts/100+1)*100)>=(count)){}else{%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(starts/100+1)*100+1%>&end=<%=(starts/100+1)*100+10%>">next</a><%}	
			}else{for(int j = 0; j < Math.ceil((double)count/10); j++){%><a href="us_res_detail.do?res_Seq=<%=dto.getSeq()%>&start=<%=(j*10+1)%>&end=<%=j*10+10%>"><%=j+1%></a><%}}%>
		</td></tr><%}%>
</table>
<form action="us_write_review.do" method="post" onsubmit="return chk()">
<input type="hidden" name="id" value="<%=ldto.getSeq()%>"/><input type="hidden" name="res_Seq" value="<%=dto.getSeq()%>"/>
<table>
<tr><th>리뷰내용</th><th>평점</th><th>*</th></tr>
<tr><td><input type="text" name="content" max="30" placeholder="별점만 등록시 별점이 내용으로 입력됩니다."/></td>
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
<button onclick="goBack()" >돌아가기</button>
</body>
</html>