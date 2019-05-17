<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.jh.point.pointDTO"%>
<%@page import="com.jh.point.pointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pointDTO dto = new pointDTO();
	dto.setNum(Integer.parseInt(request.getParameter("num")));
	dto.setName(request.getParameter("name"));
	dto.setKor(Integer.parseInt(request.getParameter("kor")));
	dto.setEng(Integer.parseInt(request.getParameter("eng")));
	dto.setMath(Integer.parseInt(request.getParameter("math")));
	dto.setTotal(dto.getKor()+dto.getEng()+dto.getMath());
	dto.setAvg(dto.getTotal()/3.0);
	
	pointDAO dao = new pointDAO();
	int result = dao.update(dto);
	
	String msg = "Update Fail";
	if (result > 0) {
		msg = "Update Success";
		request.setAttribute("message", msg);
		request.setAttribute("path", "./point.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	} else{
		response.sendRedirect("./pointUpdate.jsp?num="+dto.getNum());
	}
	//수정이 성공하면 성공메시지를 alert으로하고 point.jsp로 이동
	//실패하면 pointUpdate.jsp로 리다이렉트로 이동
	
	
%>
