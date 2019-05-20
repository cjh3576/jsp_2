<%@page import="com.jh.member.memberDAO"%>
<%@page import="com.jh.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.jh.member.memberDTO" scope="session"/>
<jsp:setProperty property="*" name="member"/>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	memberDAO dao = new memberDAO();
	
	int result = dao.memberDelete(member.getId());
	
	String msg = "Delete Fail";
	if(result >0){
		session.invalidate();
		response.sendRedirect("../index.jsp");
		
	}else{
		request.setAttribute("message", msg);
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>