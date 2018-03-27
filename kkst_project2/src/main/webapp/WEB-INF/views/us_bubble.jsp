<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%!
	private String aryToString(double[] ary){
		String rs= String.valueOf(ary[0]);
		for(int i = 1; i < ary.length; i++){
			rs = rs +"," +ary[i];
		}
		return rs;
	}

	private String aryToString2(String[] ary){
		String rs= ary[0];
		for(int i = 1; i < ary.length; i++){
			rs = rs +"," +ary[i];
		}
		return rs;
	}
	
	private String aryToString3(String[] ary){
		String rs= ary[0];
		for(int i = 1; i < ary.length; i++){
			rs = rs +"," +ary[i];
		}
		return rs;
	}
%>
<%
	@SuppressWarnings("unchecked")
	List<MenuzDto> list = (List<MenuzDto>)request.getAttribute("list");
	String[] indexes = (String[])request.getAttribute("theLastIndex");
	double[] stars = new double[list.size()];
	String[] names = new String[list.size()];
	String[] changes = new String[list.size()];
	
	for(int i = 0; i < stars.length; i++){
		stars[i] = list.get(i).getStarz();
	}
	
	for(int i = 0; i < names.length; i++){
		names[i] = list.get(i).getName();
	}
	
	for(int i = 0; i < changes.length; i++){
		changes[i] = list.get(i).getChange();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>버블</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//d3js.org/d3.v3.min.js"></script>
<script>
$(function() {
var datas = [];
var dataz = [];
	
var width = 960,
    height = 800;
var nodes = d3.range(<%=list.size()+1%>).map(function() { return {radius:100}; });
	asdf('<%=aryToString(stars)%>');
	qwer('<%=aryToString2(names)%>');
	zxcv('<%=aryToString3(changes)%>');

function asdf(aryString) {
	var ary = aryString.split(",");
	for (var i = 0; i < ary.length; i++) {
		nodes[i+1].radius = ary[i];
	}
}

function qwer(aryString) {
	var ary = aryString.split(",");
	for (var i = 0; i < ary.length; i++) {
		datas[i]=ary[i];
	}
}

function zxcv(aryString) {
	var ary = aryString.split(",");
	for (var i = 0; i < ary.length; i++) {
		dataz[i]=ary[i];
	}
}
	
var root = nodes[0];
var color = d3.scale.category10();

root.radius = 0;
root.fixed = true;

var force = d3.layout.force()
    .gravity(0.10)
    .charge(function(d, i) { return i ? 0 : -2000; })
    .nodes(nodes)
    .size([width, height]);

force.start();

var svg = d3.select("#graphd3").append("svg")
    .attr("width", width)
    .attr("height", height);

svg.selectAll("circle")
    .data(nodes.slice(1))
  .enter().append("circle")
    .attr("r", function(d) { return d.radius*1.5; })
    .style("fill", function(d, i) {
			if (i<='<%=indexes[0]%>') {
				return color(1);
			}else if (i<='<%=indexes[1]%>') {
				return color(20);
			}else if (i<='<%=indexes[2]%>') {
				return color(30);
			}else if (i<='<%=indexes[3]%>') {
				return color(40);
			}else if (i<='<%=indexes[4]%>') {
				return color(50);
			}else if (i<='<%=indexes[5]%>') {
				return color(60);
			}else if (i<='<%=indexes[6]%>') {
				return color(70);
			}else if (i<='<%=indexes[7]%>') {
				return color(80);
			}else if (i<='<%=indexes[8]%>') {
				return color(90);
			}else if (i<='<%=indexes[9]%>') {
				return color(100);
			}else{
				return color(1000);
			}
    	 })
    	 .attr("opacity","0.05");
    	 
var text = d3.select("svg").selectAll("text")
.data(datas)
.enter()
.append("text")
.text(function(d) {
  return d;
})
.attr("x", function(d, i) {
  return 100;
})
.attr("y", function(d) {
  return 100;
})
.attr("font-family", "sans-serif")
.attr("font-size", "15px")
.attr("font-weight","bold")
.attr("fill", "black")
.attr("text-anchor", "middle");

svg.selectAll('image')
.data(dataz)
.enter()
.append('svg:image')
.attr("xlink:href", function(d){return "http://localhost:8090/kkst/resources/upload/"+d;})
.attr("x","300")
.attr("y","350")
.attr("width","128")
.attr("height","128");


force.on("tick", function(e) {
  var q = d3.geom.quadtree(nodes),
      i = 0,
      n = nodes.length;

  while (++i < n) q.visit(collide(nodes[i]));

  svg.selectAll("circle")
      .attr("cx", function(d) { return d.x; })
      .attr("cy", function(d) { return d.y; });
  svg.selectAll("image")
  .attr("x", function(d, i) { return svg.selectAll("circle").filter(function(d,j){return j===i;}).attr("cx")-64; })
  .attr("y", function(d, i) { return svg.selectAll("circle").filter(function(d,j){return j===i;}).attr("cy")+50; });
  svg.selectAll("text")
  .attr("x", function(d, i) { return svg.selectAll("circle").filter(function(d,j){return j===i;}).attr("cx"); })
  .attr("y", function(d, i) { return svg.selectAll("circle").filter(function(d,j){return j===i;}).attr("cy"); });
  		
});

svg.on("mousemove", function() {
  var p1 = d3.mouse(this);
  root.px = p1[0];
  root.py = p1[1];
  force.resume();
});
function collide(node) {
	  var r = node.radius + 300,
	      nx1 = node.x - r,
	      nx2 = node.x + r,
	      ny1 = node.y - r,
	      ny2 = node.y + r;
	  
	  return function(quad, x1, y1, x2, y2) {
		  
	    if (quad.point && (quad.point !== node)) {
			      var x = node.x - quad.point.x,
			          y = node.y - quad.point.y,
			          l = Math.sqrt(x * x + y * y),
			          r = node.radius + quad.point.radius;
			      
			      if (l < r) {
			        l = (l - r) / l * .5;
			        node.x -= x *= l;
			        node.y -= y *= l;
			        quad.point.x += x;
			        quad.point.y += y;
			      }
	    }
	    
	    return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
	    
	  };
	  
	}

});
</script>
</head>
<body>
<h1>bubblebubble</h1>
<!-- <p style="background-image: url(resources/upload/70b93912984249e98268e8899cea2e69.jpg); width: 200px; height: 200px; background-size: cover;">d</p> -->
<!-- <img alt="ok" src="resources/upload/70b93912984249e98268e8899cea2e69.jpg" style="width: 200px; height: 200px; background-size: cover; position: absolute;"> -->
<div id="graphd3">
</div>
</body>
</html>