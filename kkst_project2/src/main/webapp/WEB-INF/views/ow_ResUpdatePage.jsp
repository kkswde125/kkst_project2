<%@page import="com.pro.kkst.utils.ow_onwerUtil"%>
<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@page import="com.pro.kkst.dtos.PhotoDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8");%>
<%List<PhotoDto> pDto=(List<PhotoDto>)request.getAttribute("pDto"); %>
<%List<menuDto> mDto=(List<menuDto>)request.getAttribute("mDto"); %>
<%ResDto rDto=(ResDto)request.getSession().getAttribute("rDto"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%

ow_onwerUtil util=new ow_onwerUtil();

String sHour= util.isOne(rDto.getStart().substring(0,2));
String sMin= util.isOne(rDto.getStart().substring(3));

String eHour= util.isOne(rDto.getEnd().substring(0,2));
String eMin= util.isOne(rDto.getEnd().substring(3));

String RsHour=util.isOne(rDto.getRest_start().substring(0,2));
String RsMin=util.isOne(rDto.getRest_start().substring(3));

String ReHour=util.isOne(rDto.getRest_end().substring(0,2));
String ReMin=util.isOne(rDto.getRest_end().substring(3));

String [] cateCode= new String[mDto.size()];
String [] cookCode=new String[mDto.size()];
String [] spicyCode=new String[mDto.size()];
String [] tempCode=new String[mDto.size()];


for(int j=0; j<mDto.size(); j++){
	
	String[] code = new String[mDto.size()];
		code[j]=mDto.get(j).getCode();
	
	cateCode[j] = code[j].substring(1,2);
	cookCode[j]= code[j].substring(2,3);
	spicyCode[j]= code[j].substring(3,4);
	tempCode[j]= code[j].substring(4,5);
}


%>


<!DOCTYPE html>

<c:set scope="session" var="rdto" value="${rDto}"/>
<c:set var="sHour" value="<%=sHour %>" />
<c:set var="sMin" value="<%=sMin %>"/>
<c:set var="eHour" value="<%=eHour %>"/>
<c:set var="eMin" value="<%=eMin%>"/>
<c:set var="RsHour" value="<%=RsHour%>"/>
<c:set var="RsMin" value="<%=RsMin%>"/>
<c:set var="ReHour" value="<%=ReHour%>"/>
<c:set var="ReMin" value="<%=ReMin%>"/>

<c:set var="cateCode" value="<%=cateCode%>"/>
<c:set var="cookCode" value="<%=cookCode%>"/>
<c:set var="spicyCode" value="<%=spicyCode%>"/>
<c:set var="tempCode" value="<%=tempCode%>"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카탈리스트 점주식당 수정 페이지 입니다.</title>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


	window.onload=function(){
		$(".reset").on("click", function() {
			$(this).attr("value", "");
		});
		
		$("body").on("click",".price1",function() {
			$(this).attr("value", "");
		});
		
		
	}

	
		var countT=1;
		var countM=1;
		
		
		
		
		var countdefault=1;
	
		
		var count=$("#line2").find("img").size();
		
	function AddMenu() {
		
		var copy = $("#menuAdd").clone().attr("id", "menuAdd"+countT++).css("display", "block");
				$("#line2").append(copy);
				
		var position = $("#offset").offset();		
		
		
// 		alert(position.top);
		
//  		$("menuAdd"+countT++).stop().animate({
			
// 			"scrollTop": position.top+"px"
			
//  		},500);


	}
	
	function loadfile(event) {

		var output = document.getElementById("output");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		 $('#outputs').attr('src', blobURL);
         $('#outputs').slideDown(); //업로드한 이미지 미리보기 
         $(this).slideUp(); //파일 양식 감춤
	}

	///////////
	function loadfile2(event) {
		var tableId=$(event.target).parents("table").eq(0).attr("id");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		$("#"+tableId).find("img").attr('src', blobURL);
	 	$("#"+tableId).find("img").slideDown(); //업로드한 이미지 미리보기 
     	$(this).slideUp(); //파일 양식 감춤
}
	
	
	function loadfile3(event,i) {
		var blobURL = URL.createObjectURL(event.target.files[0]);
     	$("#menuAddDefault"+i).find('#outputs'+i).attr('src', blobURL);
     	$("#menuAddDefault"+i).find('#outputs'+i).slideDown(); 
		$(this).slideUp(); //파일 양식 감춤
	}
	
	

	
	function delectMenu(seq) {
		$("#menuAddDefault").remove();
// 		location.href="deleteMenu.do?seq="+seq;

		$.ajax({
			url:"deleteMenu.do",
			type:"post",
			data:"seq="+seq,
			dataType:"json",
			success : function() {
				alert("메뉴삭제 성공");
				location.reload();
			},
			error:function(){
				alert("실패");
			}
			
		});

	}
	
	$(function(){
		$("form").submit(function(){
			var bool=true;
			$("#line2").find("input[name]").each(function(){
				if($(this).val()==""){
					alert("새로 추가한 메뉴는 빈 공간 없이 입력해주세요");
					$(this).focus();
					bool=false;
					return false;
				}
			});

			return bool;
		})
	})	

	
		function action() {
		$("form:first").submit();
		}
	
	 function remove(){
		 
		 var ddd= $("input[name=uploadFile]").find("table").attr("id");
		 
		 alert(ddd);
	 }
	
	 
	 
	
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
</script>

<style type="text/css">

	*{
		margin : 0;
		padding : 0;
	}
	
	input[type=text]{
		width: 500px;
	}
	
	#all{
		width: 70%;
		margin : 0 auto;
	}
	
</style>
</head>

<body>
<!-- 복제할 메뉴 폼 -->

<table id="menuAdd"  style="display: none;"  class="ui celled table"  >
<tr>
<td>
<div class="ui input" style="padding-bottom: 20px;">
<div style="width: 567px; height: 400px; padding: 40px;">
<input type="file" accept="image/*" required="required"  name="uploadFile" id="upload" onchange="loadfile2(event)" class="ui basic button" />
<img id="newMenu" style="width: 510px; height: 300px;" class=" medium ui image" src="img/image.png">
</div>
</div>

</td>
<td>


<table border="1" class="ui celled table" style="width: 620px; text-align: center;" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2">
		<div class="ui input">
		<input type="text" name="menu_name" required="required"/>
		</div>
		</td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode"  class="ui dropdown" >
		<c:forEach items="${lists2}" var="dto">
			<option label="${dto.attr}" value="${dto.code}"/>
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode" class="ui dropdown">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode" class="ui dropdown">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode" class="ui dropdown" >
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2">
	<div class="ui input">
	<input type="text" name="price" value="숫자만 입력해주세요" required="required" class="price1" />
	</div>
	</td>
	</tr>
</table>
</td>
</tr>
</table>


<%----------/////////////////////////////////////////////////////////////////////////////  --%>

<div id="all">

<form action="ResUpdate.do" method="post" id="newMenu" enctype="multipart/form-data">
<input type="hidden" name="res_seq" value="${rdto.seq}"/>
<table class="shopDiv">
<!-- 사진 올라갈곳 -->
<tr>
<td>
<div class="ui input"  style="padding-bottom: 20px;">
<div style="width: 620px; height: 350px; padding: 40px;">
<input type="hidden" name="Photo_seq" value="<%=pDto.get(0).getSeq() %>" />
<input type="hidden" name="fileOname" value="<%=pDto.get(0).getOrigin()%>" />
<input type="hidden" name="fileSname" value="<%=pDto.get(0).getChange()%>" />
<input type="file" accept="image/*"  name="uploadFile_d" id="upload" onchange="loadfile(event)"/>
<img id="outputs"  class=" medium ui image" style=" width: 700px; height: 400px;" src="resources/Resimg/<%=pDto.get(0).getChange()%>">
</div>
</div>
</td>
<!-- 입력 부분 -->
<td>
<table border="1" class="ui celled table" style="width: 710px; text-align: center;">
	<tr>
		<td colspan="2" style="text-align: center;"><h1>식당 수정 하기</h1></td>
	</tr>

<tr>
	<th>식당명</th>
	<td>
	<div class="ui input">
	<input type="text" name="name" required="required" value="${rdto.name}" />
	</div>
	</td>
</tr>
<tr>
	<th>업종</th>
	<td>
	
	<select name="cate" class="ui dropdown">
		<option label="한식" value="한식"${rdto.cate=="한식"?"selected":""}>
		<option label="중식" value="중식"${rdto.cate=="중식"?"selected":""}>
		<option label="일식" value="일식"${rdto.cate=="일식"?"selected":""}>
		<option label="양식" value="양식"${rdto.cate=="양식"?"selected":""}>
		<option label="횟집" value="횟집"${rdto.cate=="횟집"?"selected":""}>
		<option label="분식" value="분식"${rdto.cate=="분식"?"selected":""}>
		<option label="냉면집" value="냉면집"${rdto.cate=="냉면집"?"selected":""}>
		<option label="인도,태국" value="인도,태국"${rdto.cate=="인도,태국"?"selected":""}>
		<option label="치킨" value="치킨"${rdto.cate=="치킨"?"selected":""}>
		<option label="식육(숯불구이)" value="식육(숯불구이)"${rdto.cate=="식육(숯불구이)"?"selected":""}>
		<option label="보신용" value="보신용"${rdto.cate=="보신용"?"selected":""}>
	</select>
	</td>
</tr>
<tr>
	<th>주소</th>
	<td>
	<div class="ui input">
	<input type="text" name="addr" required="required" value="${rdto.addr}" />
	</div>
	</td>
</tr>

	<tr>
		<th>영업시간 </th>
		<td>
		<!-- 영업시간 -->
			<select name="S_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq sHour? 'selected':''} >
				</c:forEach>
			</select> : 
			<select name="S_min" class="ui dropdown" >
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}"${i eq sMin?'selected':''}>
				</c:forEach>
			</select>
			~
			<select name="E_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq eHour? 'selected':''}>
				</c:forEach>
			</select> : 
			<select name="E_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}"${i eq eMin? 'selected':'' }>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>휴식시간</th>
		<td>
				<!-- 휴식시간 -->	
			<select name="Rs_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq RsHour? 'selected':'' }>
				</c:forEach>
			</select> : 
			<select name="Rs_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}" ${i eq RsMin? 'selected':'' }>
				</c:forEach>
			</select>
			~
			<select name="Re_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq ReHour? 'selected':'' } >
				</c:forEach>
			</select> : 
			<select name="Re_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i" >
				<option label="${i}" value="${i}" ${i eq ReMin? 'selected':'' }>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<div class="ui input">
	<input type="text" value="${rdto.call}" name="call"  required="required" class="reset"  />
	</div>
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
			<select name="parking" class="ui dropdown">
				<option label="가능" value="Y" ${rdto.parking eq "Y" ? 'selected':''}>
				<option label="불가능" value="N" ${rdto.parking eq "N" ? 'selected':''}>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>식당 설명</th>
		<td>
		<textarea rows="10" cols="80" name="comment" required="required">${rdto.comment}</textarea>
		</td>
	</tr>
	
		<tr>
		<td colspan="8" style="text-align: center;">
			<div class="ui animated button" onclick="location.href='myRes.do'" tabindex="0" style="width: 75px;">
  			<div class="visible content">이전</div>
  			<div class="hidden content"> <i class="arrow left icon"></i></div>
			</div>
			
			<div class="ui animated button" onclick="AddMenu()" tabindex="0" style="width: 250px;">
  			<div class="visible content">메뉴 추가</div>
  			<div class="hidden content"> 하단에 메뉴 등록창이 추가됩니다.</div>
			</div>
			
			
			<div class="ui animated button" onclick="action()" tabindex="0" style="width: 250px;">
  			<div class="visible content">식당 등록 완료!</div>
  			<div class="hidden content">메인 페이지로 이동 합니다</div>
			</div>
		</td>
	</tr>
	
</table>
</td>
</table>

<!-- 식당 입력 끝 -->
<!-- 메뉴 입력 시작 -->
<hr id="line"/>
<% for(int i=0; i< mDto.size(); i++){
	%>
<c:set var="i" value="<%=i%>" />
<table id="menuAdd<%="Default"+i%>" class="ui celled table" >
<tr>
<td>

<div style="width: 630px; height: 350px;">
<div class="ui input" style="padding-bottom: 20px;">
<input type="file" accept="image/*"   name="uploadFile_A" id="upload" onchange="loadfile3(event,'<%=i%>')" />
<input type="hidden" name="menu_seq" value="<%=mDto.get(i).getSeq()%>" />
<input type="hidden" name="fileOname" value="<%=pDto.get(i+1).getOrigin()%>" />
<input type="hidden" name="fileSname" value="<%=pDto.get(i+1).getChange()%>" />
</div>
<img id="outputs<%=i%>" style="width: 600px; height: 300px;"  class=" medium ui image" src="resources/Resimg/<%=pDto.get(i+1).getChange()%>" >
</div>

</td>
<td>

<table border="1"  class="ui celled table" style="width: 620px; text-align: center;" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2">
		<div class="ui input">
		<input type="text" name="menu_name_d" required="required" value="<%=mDto.get(i).getName()%>" />
		</div>
		</td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode_d" class="ui dropdown" >
		<c:forEach items="${lists2}" var="dto" >
			<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cateCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode_d" class="ui dropdown">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cookCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode_d" class="ui dropdown">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq spicyCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode_d" class="ui dropdown" >
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq tempCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2">
	<div class="ui input">
	<input type="text" name="price_d" value="<%=mDto.get(i).getPrice()%>" required="required" class="price1"  />
	</div>
	</td>
	</tr>
</table>
	<div style="text-align: right;">
	<input  class="ui button" type="button" value="삭제" onclick="delectMenu('<%=mDto.get(i).getSeq()%>')" />
	</div>
</td>
</tr>
</table>

	<%	
} 
%>
<!-- 메뉴 입력 끝 -->

<hr id="line2"/>



<div id="offset" style="height: 300px;"></div>

</form>
</div>



</body>
</html>