//package com.pro.kkst.ajax;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//import net.sf.json.JSONObject;
//
//@WebServlet("/IsChkAjax.do")
//public class ac_IsChkAjax extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
//		
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/json; charset=utf-8");
//		
//		String id=request.getParameter("id");
//		System.out.println("전달되는 값:"+id);
//		
//		KkstDao dao =new KkstDao();
//		boolean isS= dao.isChk(id);
//		Map<String, Boolean> map=new HashMap<String, Boolean>();
//		map.put("isChk", isS);
//		
//		JSONObject obj=JSONObject.fromObject(map);//=자료: java의 map객체를 json객체로 변환(JSONObject는 라이브러리에 있는 객체임. 해당 객체엔 req, res객체가 없음!)
//		
//		PrintWriter pw= response.getWriter(); //=프린터: 응답을 위한 전용 프린터 만듬.(브라우저에 출력하기 위한)
//		
//		obj.write(pw);//=프린터로 자료를 출력하는 사람: JSONObject객체에 write()메서드가 전용프린터를 이용해서 변환된 JSON객체를 브라우저(body)에 출력한다. -> success속성이 받는다.
//		
//		
//	}
//}
