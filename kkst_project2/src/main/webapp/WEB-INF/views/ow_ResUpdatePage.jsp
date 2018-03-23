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
		var countMenu=0;
		var countdefault=1;
	
	
	function AddMenu() {
		
		countMenu++;
		var copy = $("#menuAdd").clone().attr("id", "menuAdd"+countT++).css("display", "block");
		copy.find("#output").attr("id","output"+countdefault++)
		$("#line2").append(copy);
		
		
	}
	
	function loadfile(event) {

		var output = document.getElementById("output");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		 $('#outputs').attr('src', blobURL);
         $('#outputs').slideDown(); //업로드한 이미지 미리보기 
         $(this).slideUp(); //파일 양식 감춤
	}

	
	function loadfile2(event) {
		var count=1;
		var blobURL = URL.createObjectURL(event.target.files[0]);
	 	$(this).next("img").attr('src', blobURL);
	 	$(this).next("img").slideDown(); //업로드한 이미지 미리보기 
     	$(this).slideUp(); //파일 양식 감춤
}
	
	
	function loadfile3(event,i) {
		var blobURL = URL.createObjectURL(event.target.files[0]);
     	$("#menuAddDefault"+i).find('#outputs'+i).attr('src', blobURL);
     	$("#menuAddDefault"+i).find('#outputs'+i).slideDown(); 
		$(this).slideUp(); //파일 양식 감춤
	}
	
	
	function chekMenu(seq) {
		
		if(countMenu==0){
			alert("하나이상의 메뉴를 등록하세요!");
			location.href="ac_ResListAddPage.do?res_seq="+seq;
			return false;
		}
		
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
			},
			error:function(){
				alert("실패");
			}
			
		});

	}
	
	
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
</script>
</head>

<body>
<!-- 복제할 메뉴 폼 -->

<table id="menuAdd"  style="display: none;"  >
<tr>
<td>

<div style="width: 350px; height: 350px; padding: 40px;">
<input type="file" accept="image/*" required="required"  name="uploadFile" id="upload" onchange="loadfile2(event)" />
<img id="output" style="width: 350px; height: 350px;">
</div>

</td>
<td>


<table border="1" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2"><input type="text" name="menu_name" required="required"/></td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode" >
		<c:forEach items="${lists2}" var="dto">
			<option label="${dto.attr}" value="${dto.code}"/>
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode" >
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2"><input type="text" name="price" value="숫자만 입력해주세요" required="required" class="price1" /></td>
	</tr>
</table>
</td>
</tr>
</table>


<%----------/////////////////////////////////////////////////////////////////////////////  --%>


<form action="ResUpdate.do" method="post" id="newMenu" enctype="multipart/form-data">
<input type="hidden" name="res_seq" value="${rdto.seq}"/>
<table>
<!-- 사진 올라갈곳 -->
<tr>
<td>
<div style="width: 350px; height: 350px; padding: 40px;">
<input type="hidden" name="Photo_seq" value="<%=pDto.get(0).getSeq() %>" />
<input type="hidden" name="fileOname" value="<%=pDto.get(0).getOrigin()%>" />
<input type="hidden" name="fileSname" value="<%=pDto.get(0).getChange()%>" />
<input type="file" accept="image/*"  name="uploadFile_d" id="upload" onchange="loadfile(event)"/>
<img id="outputs" style=" width: 350px; height: 350px;" src="resources/Resimg/<%=pDto.get(0).getChange()%>">
</div>
</td>
<!-- 입력 부분 -->
<td>
<table border="1">
<tr>
	<th>식당명</th>
	<td><input type="text" name="name" required="required" value="${rdto.name}" /></td>
</tr>
<tr>
	<th>업종</th>
	<td>
	
	<select name="cate">
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
	<td><input type="text" name="addr" required="required" value="${rdto.addr}" /></td>
</tr>

	<tr>
		<th>영업시간 </th>
		<td>
		<!-- 영업시간 -->
			<select name="S_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq sHour? 'selected':''} >
				</c:forEach>
			</select> : 
			<select name="S_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}"${i eq sMin?'selected':''}>
				</c:forEach>
			</select>
			~
			<select name="E_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq eHour? 'selected':''}>
				</c:forEach>
			</select> : 
			<select name="E_min">
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
			<select name="Rs_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq RsHour? 'selected':'' }>
				</c:forEach>
			</select> : 
			<select name="Rs_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}" ${i eq RsMin? 'selected':'' }>
				</c:forEach>
			</select>
			~
			<select name="Re_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}" ${i eq ReHour? 'selected':'' } >
				</c:forEach>
			</select> : 
			<select name="Re_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}" ${i eq ReMin? 'selected':'' }>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<input type="text" value="${rdto.call}" name="call" required="required" class="reset"  />
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
			<select name="parking">
				<option label="가능" value="Y" ${rdto.parking eq "Y" ? 'selected':''}>
				<option label="불가능" value="N" ${rdto.parking eq "N" ? 'selected':''}>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>식당 설명</th>
		<td>
		<textarea rows="10" cols="60" name="comment" required="required">${rdto.comment}</textarea>
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
<table id="menuAdd<%="Default"+i%>">
<tr>
<td>

<div style="width: 350px; height: 350px; padding: 40px;">
<input type="file" accept="image/*"   name="uploadFile_A" id="upload" onchange="loadfile3(event,'<%=i%>')" />
<input type="hidden" name="menu_seq" value="<%=mDto.get(i).getSeq()%>" />
<input type="hidden" name="fileOname" value="<%=pDto.get(i+1).getOrigin()%>" />
<input type="hidden" name="fileSname" value="<%=pDto.get(i+1).getChange()%>" />
<img id="outputs<%=i%>" style="width: 350px; height: 350px;" src="resources/Resimg/<%=pDto.get(i+1).getChange()%>" >
</div>

</td>
<td>

<table border="1" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2"><input type="text" name="menu_name_d" required="required" value="<%=mDto.get(i).getName()%>" /></td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode_d" >
		<c:forEach items="${lists2}" var="dto" >
			<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cateCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode_d">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cookCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode_d">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq spicyCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode_d" >
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq tempCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2"><input type="text" name="price_d" value="<%=mDto.get(i).getPrice()%>" required="required" class="price1"  /></td>
	</tr>
</table>
	<input type="button" value="삭제" onclick="delectMenu('<%=mDto.get(i).getSeq()%>')" />
</td>
</tr>
</table>

	<%	
} 
%>
<!-- 메뉴 입력 끝 -->

<hr id="line2"/>
<input type="submit" value="식당 등록 완료!">
<input type="button" value="메뉴추가" onclick="AddMenu()" />
</form>



</body>
</html>