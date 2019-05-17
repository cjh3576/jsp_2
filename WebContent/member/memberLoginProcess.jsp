<%@page import="com.jh.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="dto" class="com.jh.member.memberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%

	memberDAO dao = new memberDAO();
	dto = dao.memberLogin(dto);
	String msg = "Login Fail";
	if(dto != null){
		session.setAttribute("member", dto);
		response.sendRedirect("../index.jsp");
	}else{
		request.setAttribute("message", msg);
		request.setAttribute("path", "./memberLogin.jsp");
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