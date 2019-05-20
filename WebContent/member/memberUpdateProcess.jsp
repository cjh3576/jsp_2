<%@page import="com.jh.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="member" class="com.jh.member.memberDTO" scope="session"/>
	<jsp:setProperty property="*" name="member"/>
<% 
	memberDAO dao = new memberDAO();
	int result = dao.memberUpdate(member);
	
	
	String msg = "Update Fail";
	if(result >0){
		response.sendRedirect("./memberMyPage.jsp");
		session.setAttribute("member", member);
	}else{
		request.setAttribute("message", msg);
		request.setAttribute("path", "./memberMyPage.jsp");
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