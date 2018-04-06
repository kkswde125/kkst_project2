<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<% @SuppressWarnings("unchecked")
List<MenuzDto> lists = (List<MenuzDto>)request.getAttribute("lists");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
*{
padding : 0px;
margin : 0px;
}
img{
width: 500px;
height: 300px;
}   
#form{
width: 600px;
height: 240px;
}
#all{
padding-top:1%;
width: 1300px;
height: 600px;
margin : 0 auto;
text-align: center;
position: relative;
}
p{
font-size: 13pt;
font-weight: bold;
}
.namez{
font-size: 15pt;
font-weight: bold;
}
.tablez{
margin-right: 150px;
margin-left: 50px;
}
h2{
display: inline-block;
}
.leftz{
display: inline-block;
float: left;
margin-left: 50px;
}
.rightz{
display: inline-block;
float: right;
margin-right: 150px;
}
#vs{
position: absolute;
top: 338px;
left: 624px;
font-size: 40pt;
font-weight: bold;
}
#restartBtn{
display: block;
margin : 0 auto;
text-align: center;
}
#nextBtn{
display: block;
margin : 0 auto;
text-align: center;
}
.tdzz:hover{
cursor: pointer;opacity: 0.8;
}
.imgs{
border-radius: 25px;
}
#infoM:hover {
cursor: pointer;
opacity: 0.3;
}
</style>
<script type="text/javascript">
   function load() {
      for (var i = 2; i < 32; i++) {
         $("#tab"+i).hide();
      }
   }
   function restart(){
      for (var i = 0; i < 32; i++) {
         $(".td"+i).show();
      }
      for (var i = 2; i < 32; i++) {
         $("#tab"+i).hide();
      }
   }
   function clickings(i,seq) {
      //0 , 짝수 일때 i+2 or i+3
      // 홀수 일때 i+1 or i+2
      var lists1 ="<%=lists.size()-1%>";
      var lists2 ="<%=lists.size()-2%>";
      if (i==0||i%2==0) {
         $(".td"+i).hide();
         $(".td"+(i+1)).hide();
         $("#tab"+(i+2)).show();
         $("#tab"+(i+3)).show();
         $("<input type='hidden' name='choiceSeq' />").appendTo("#fo").prop("value",seq);
         if(<%=lists.size()==2%>){
        	 location.href="us_winner.do?seq="+seq;
         }
         if(lists1==i||lists2==i){
         	$("#fo").css("display", "block");
         	$('#all').css("height","100px");
         	$("#form").css("display", "none");
         	$("#restartBtn").css("display", "none");
         }   
//          arrays(seq);
      }      
      else if(i==1||i%2==1){
         $(".td"+(i-1)).hide();
         $(".td"+i).hide();
         $("#tab"+(i+1)).show();
         $("#tab"+(i+2)).show();
         $("<input type='hidden' name='choiceSeq' />").appendTo("#fo").prop("value",seq);
         if(<%=lists.size()==2%>){
        	 location.href="us_winner.do?seq="+seq;
         }
         if(lists1==i||lists2==i){
          	$("#fo").css("display", "block");
          	$('#all').css("height","100px");
          	$("#form").css("display", "none");
          	$("#restartBtn").css("display", "none");
          }  
//          arrays(seq);
      } 
	}
   
</script>
</head>
<body onload="load()">
<div id="all">
<h1>FOOD OLYMPIC</h1>
<p><%=lists.size()==2?"결승":lists.size()+"강"%>
<a href="#" id="infoM" title="다시하기 클릭시: 출전하는 음식리스트는 변경되지 않으며, 현재 라운드에서만 다시 시작됩니다.
예시) 16강에서 다시하기를 클릭하면 16강 첫 대전으로 돌아감."><img alt="정보창이미지" src="resources/images/infoM.png" style="width: 24px; height: 24px;"></a></p>
<div id="form">
<span id="vs">VS</span>
<table>
<tr>
<td><div class="leftz"><img alt="이게좋아요이미지1" src="resources/images/likeThisL.jpg" style="width: 150px; height: 120px;"><h2> &nbsp;이게 좋아요!<br/><br/></h2></div></td>
<td><div class="rightz"><h2>이게 좋아요! &nbsp;<br/><br/></h2><img alt="이게좋아요이미지2" src="resources/images/likeThisR.jpg" style="width: 150px; height: 120px;"></div></td>
</tr>
<tr>
         <%for (int i = 0; i < lists.size(); i++) {%>
         <td class="td<%=i%>">
            <table id="tab<%=i%>" class="tablez">
               <tr>
                  <td onclick="clickings(<%=i%>,<%=lists.get(i).getSeq()%>)" class="tdzz">
					 <div id="choice<%=i%>">
                        <img class="imgs" alt="<%=lists.get(i).getName()%>" src="resources/Resimg/<%=lists.get(i).getChange()%>" style="width: 500px; height: 300px;">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div id="name<%=i%>">
                       <span class="namez"><%=lists.get(i).getName()%></span>
                     </div>
                  </td>
               </tr>
            </table>
           <%}%>
         </td>
      </tr>
</table>
</div>
</div>
<br/>
<form action="us_nextOlympic.do" id="fo" style="display: none;">
<input id="nextBtn" type="submit" value="<%=lists.size()==4?"결승":lists.size()/2+"강"%>으로 가기" class="btn btn-primary"/><br/>
</form>
<input type="button" value="다시하기" onclick="restart()" id="restartBtn" class="btn btn-warning">
</body>
</html>