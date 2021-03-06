<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<%  @SuppressWarnings("unchecked")
	List<ResDto> lists =(List<ResDto>)request.getAttribute("lists");
	@SuppressWarnings("unchecked")
	List<ResDto> lists2 =(List<ResDto>)request.getAttribute("lists2");
	
	String cate= (String)request.getAttribute("cate");
	String mName= (String)request.getAttribute("mName");
	String seq= (String)request.getAttribute("seq");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당지도</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//------------------- 원 반경 설정---------------------------------------------------------
	var cSize=1000;

	function go100() {
		cSize=100;
	}
	
	function go500() {
		cSize=500;
	}
	
	function go1000() {
		cSize=1000;
	}
	
	function go10000() {
		cSize=10000;
	}
	
	function go100000() {
		cSize=100000;
	}
	//------------------------------------------------------------------------------------
</script>
<style type="text/css">
#all{
		display: none;
		padding-top: 1%;
		width: 1200px;
		margin : 0 auto;
		text-align: center;
}
#headerz{
	font-size: 17px;
    font-weight: bold;
    line-height: 1.5em;
    text-align: center;
}
.h3z:hover{
	color: blue;
	text-decoration: underline;
}
.btn{
	margin: 1px;
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
#infoM:hover {
cursor: pointer;
opacity: 0.3;
}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=dxAelTQKShNPGfu0KuVB&submodules=geocoder"></script>
</head>
<body>
	<div id="all">
	<p id="headerz">식당을 선택하시면 상세 정보 보기로 넘어갑니다.
<a href="#" id="infoM" title="빨간색 마커: 선택하신 메뉴를 판매하는 식당입니다.
우클릭시: 우클릭한 지점을 중심으로 반경 100M의 원이 생성되며, 그 원 안에 선택하신 메뉴와 동일한 업종의 식당들이 파란색 마커로 표시됩니다.
좌클릭시: 생성하신 모든 원과 파란색 마커를 초기화하여 지도에서 보이지 않도록 합니다.
마커클릭시: 식당명이 표시되는 정보창이 마커위에 생성되며, 식당명 클릭시 식당상세정보보기 페이지로 이동합니다.
※현재 페이지 하단의 원 크기조절 버튼으로 원의 크기를 조절하실 수 있습니다."><img alt="정보창이미지" src="resources/images/infoM.png"></a></p>
    <div id="map" style="width:1200px; height:800px;"></div>
	<script>
	function goDetail(name,cate) {
		$('#loadingImg2').css('display','block');
		$('#all').css('display','none');
		setTimeout(function() {
			location.href="us_res_detail.do?name="+name+"&cate="+cate+"&mName="+"<%=mName%>"+"&seq="+"<%=seq%>"+"&start=1&end=10";	
		}, 3000);
	}
	  //------------------- 멥 생성---------------------------------------------------------  
	    var map = new naver.maps.Map('map');
	  //------------------------------------------------------------------------------------
		var str = '';
	    var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
	    map.getPanes().floatPane.appendChild(menuLayer[0]);
	  //--------------------해당 메뉴를 등록한 식당을 onload로 미리 마커로 표현하기----------------------------------------------------------------  	
	    $(function() {
	    	//추천메뉴가 있는 집 마커생성
	    	var name2=[];
	    	var markers2=[];
	    	var infowindowss=[];
		      <%
		      	for(int i=0; i< lists2.size(); i++){
		      %>
			      		var pp<%=i%>_2 = new naver.maps.LatLng(<%=lists2.get(i).getX()%>,<%=lists2.get(i).getY()%>);	      
			      		name2.push("<%=lists2.get(i).getName()%>");
						
						var marker = new naver.maps.Marker({
					            position: pp<%=i%>_2,
					            map: map,
					            icon: {
				        	        url: './img/redMarker.png'
				        	    },
				        	    animation: naver.maps.Animation.BOUNCE
					    });
// 					    marker.set('seq', i);
					    naver.maps.Event.addListener(marker, 'click', function() {
					        if (marker.getAnimation() !== null) {
					            marker.setAnimation(null);
					        } else {
					            marker.setAnimation(naver.maps.Animation.BOUNCE);
					        }
					    });
					    markers2.push(marker);
// 					    marker = null;
		        <%
		      	}
		      %>
		      //----------마커배열과 식당명배열이 순서대로 정렬되있으니, 이 순서대로 인포윈도우를 생성하고 매칭하는 for문--------------------------------------------------------------------------
				 for (var j = 0; j < name2.length; j++) {
						var infoWindow = new naver.maps.InfoWindow({
							content: "<div style='width:200px;text-align:center;padding:10px;'>"+
							"<h3 class='h3z' onclick='goDetail(this.innerHTML,\"<%=cate%>\")'>"+name2[j]+"</h3>"
							+"</div>",
						    maxWidth: 200,
						    backgroundColor: "#eee",
						    borderColor: "#2db400",
						    borderWidth: 5,
						    anchorSize: new naver.maps.Size(30, 30),
						    anchorSkew: true,
						    anchorColor: "#eee",
						    pixelOffset: new naver.maps.Point(20, -20)
						});
						infowindowss.push(infoWindow);
				 }	
		      //-----------식당마커를 클릭시 인포윈도우 보이기-------------------------------------------------------------------------
				function getClickHandler2(seq) {
				    return function(e) {
				        var marker = markers2[seq];
				        var infoWindow1 = infowindowss[seq];
				            infoWindow1.open(map, marker);
				    }
				}
				for (var i=0, ii=markers2.length; i<=ii; i++) {
					naver.maps.Event.addListener(markers2[i],'click',getClickHandler2(i));
				}
		});
	  //------------------------------------------------------
	  
	  //--------------------우클릭 메서드----------------------------------------------------------------
	   naver.maps.Event.addListener(map, 'rightclick', function(e) {
		   
	      //-----------------우클릭한 지점에 마커생성하고, 아이콘 객체 연결-------------------------------------------------------------------
	        var markerOptions = {
	        	    position: e.coord,
	        	    map: map,
	        	    icon: {
	        	        url: './img/bluePointer.png',
	        	    },
	        	    animation: naver.maps.Animation.DROP
	        };
			var markerz = new naver.maps.Marker(markerOptions);
		//----------------e.coord를 x,y의 좌표로 변환하는 과정--------------------------------------------------------------------
			str=e.coord.toString();
			var strAry= str.split(':');
		    var strX = strAry[1].split(',')[0];
		    var strY = strAry[2].split(')')[0];
		  //--------------우클릭 지점의 좌표로 새로운 멥 중앙점을 생성 및 설정----------------------------------------------------------------------
		    var newCenter = new naver.maps.LatLng(strX,strY);
		    map.setCenter(newCenter);
		  //--------------새로운 중앙점을 기준으로 원 생성----------------------------------------------------------------------
		    var circlez = new naver.maps.Circle({
	      	    map: map,
	      	    center: newCenter,
	      	    radius: cSize,
	      	    fillColor: 'crimson',
	      	    fillOpacity: 0.2
	      	});
		  //--------------원의 최소 최대 x,y좌표를 구함----------------------------------------------------------------------
	        var miniXz = circlez.getBounds().minX();
	        var miniYz = circlez.getBounds().minY();
	        var maxiXz = circlez.getBounds().maxX();
	        var maxiYz = circlez.getBounds().maxY();
	        var miniz = new naver.maps.Point(miniXz,miniYz);
	        var maxiz = new naver.maps.Point(maxiXz,maxiYz);
	      //--------------원의 최대,최소 x,y좌표를 통해 4각형의 Bounds객체 생성(cboudsz)----------------------------------------------------------------------
	        var cboundsz= new naver.maps.PointBounds(miniz,maxiz);
	      //--------------Bounds객체 범위 안에 식당DB가 있는지(hasPoint()메서드) 비교하기위한 사전작업(필요사항: 마커, 인포윈도우, 상호명)----------------------------------------------------------------------
	        var name1=[]; //상호명
			var markers=[]; // 마커 배열
			var infoWindows=[]; //정보창
			//-----------전국의 특정 카테고리 식당과 Bounds객체를 모두 비교-------------------------------------------------------------------------
	      <%for(int i=0; i< lists.size(); i++){%>
	   		 //------------pp0,pp1,pp2...등으로 DB식당을 모두 ppi객체로 만들기------------------------------------------------------------------------	      
	      		var pp<%=i%> = new naver.maps.LatLng(<%=lists.get(i).getX()%>,<%=lists.get(i).getY()%>);	      
	      	//-------------만든 객체들을 Bounds안에 있는지 비교-----------------------------------------------------------------------
				if(cboundsz.hasPoint(pp<%=i%>)){
					//---------안에 있다면 식당명을 배열에 담는다.---------------------------------------------------------------------------
					name1.push("<%=lists.get(i).getName()%>");
					//----------안에 있다면 그 식당위치에 마커를 생성--------------------------------------------------------------------------
					var marker = new naver.maps.Marker({
		    			position: pp<%=i%>,
		   			 	map: map,
		   				icon: {
		        	        url: './img/blueMarker.png',
		        	    },
		        	    animation: naver.maps.Animation.BOUNCE
		 			});
					
					naver.maps.Event.addListener(marker, 'click', function() {
				        if (marker.getAnimation() !== null) {
				            marker.setAnimation(null);
				        } else {
				            marker.setAnimation(naver.maps.Animation.BOUNCE);
				        }
				    });
					
					//----------그 마커를 배열에 담는다--------------------------------------------------------------------------
					markers.push(marker);
				}//hasPoint if문	      
	        <%
	      	}//hasPoint for문
	      %>
	 
	    //----------마커배열과 식당명배열이 순서대로 정렬되있으니, 이 순서대로 인포윈도우를 생성하고 매칭하는 for문--------------------------------------------------------------------------
			 for (var j = 0; j < name1.length; j++) {
					var infoWindow = new naver.maps.InfoWindow({
						content: "<div style='width:200px;text-align:center;padding:10px;'>"+
						"<h3 class='h3z' onclick='goDetail(this.innerHTML,\"<%=cate%>\")'>"+name1[j]+"</h3>"
						+"</div>",
					    maxWidth: 200,
					    backgroundColor: "#eee",
					    borderColor: "#2db400",
					    borderWidth: 5,
					    anchorSize: new naver.maps.Size(30, 30),
					    anchorSkew: true,
					    anchorColor: "#eee",
					    pixelOffset: new naver.maps.Point(20, -20)
					});
					infoWindows.push(infoWindow);
			 }	
		//---------map의 아무지점을 클릭하면 원, 마커, 인포윈도우 사라지는 이벤트---------------------------------------------------------------------------
		      	naver.maps.Event.addListener(map,'click',function(e){
		      	//----------새로운 중앙점의 마커, 인포윈도우, 원 사라지게하기--------------------------------------------------------------------------
		      		circlez.setVisible(false);
		      		markerz.setVisible(false);
		      	//-----------식당 마커, 인포윈도우 사라지게 하기-------------------------------------------------------------------------
			      	for (var i = 0; i < markers.length; i++) {
			      		if(markers!=null){
				      		markers[i].setVisible(false);
				      		infoWindows[i].close();
			      		}
					}	
		      	});
		      //-----------식당마커를 클릭시 인포윈도우 보이기-------------------------------------------------------------------------
				function getClickHandler(seq) {
				    return function(e) {
				        var marker = markers[seq];
				        var infoWindow1 = infoWindows[seq];
				            infoWindow1.open(map, marker);
				    }
				}
				for (var i=0, ii=markers.length; i<=ii; i++) {
					naver.maps.Event.addListener(markers[i],'click',getClickHandler(i));
				}
	      });
	      
	  	window.onload = function(){
	  		var t =performance.timing;
			  
			  setTimeout(function(){
				$('#loadingImg').css('display','none');
				$('#all').css('display','block');
			}, t.loadEventStart - t.responseEnd+1000);
			  
			  setTimeout(function(){
			    console.log(t.loadEventStart - t.responseEnd);
			  }, 0);
		}
	</script>
		<span style="font-weight: bold;">원 반경 조절:</span>
	  <button class="btn btn-primary" onclick="go100()" style="width: 70px;">100m</button>
      <button class="btn btn-success" onclick="go500()" style="width: 70px;">500m</button>
      <button class="btn btn-info" onclick="go1000()" style="width: 70px;">1000m</button>
      <button class="btn btn-warning" onclick="go10000()" style="width: 70px;">10km</button>
      <button class="btn btn-danger" onclick="go100000()" style="width: 70px;">100km</button>
      <br/>
      <button onclick="location.href='us_usermain.do'" class="btn btn-default" style="float: left;">메인으로</button>
</div>
<div id="loadingImg">
<img alt="로딩이미지" src="resources/images/giphy.gif"><br/>
<p id="loadingText">좋아요! 이제 식당을 찾아볼게요. . .</p>
</div>
<div id="loadingImg2">
<img alt="로딩이미지" src="resources/images/giphy.gif"><br/>
<p id="loadingText2">식당의 상세 정보 페이지로 이동합니다. . .</p>
</div>
</body>
</html>