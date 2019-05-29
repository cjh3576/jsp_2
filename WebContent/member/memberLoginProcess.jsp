<%@page import="com.jh.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="memberDTO" class="com.jh.member.memberDTO"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	memberDAO dao = new memberDAO();
	
	//체크박스 값 확인
	String check = request.getParameter("check");
	//쿠키생성,
	if(check != null){
		Cookie c = new Cookie("check",memberDTO.getId());
		c.setMaxAge(60*60*24*7);
		response.addCookie(c);
	} else{
		Cookie c = new Cookie("check","");
		response.addCookie(c);
	}
	
	
	memberDTO = dao.memberLogin(memberDTO);
	String msg = "Login Fail";
	if(memberDTO != null){
		session.setAttribute("member", memberDTO);
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