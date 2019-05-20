<%@page import="com.jh.member.memberDTO"%>
<%@page import="com.jh.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	memberDAO dao = new memberDAO();
	memberDTO dto = new memberDTO();
	System.out.println(request.getParameter("id"));
	System.out.println(request.getParameter("pw"));
	System.out.println(request.getParameter("name"));
	System.out.println(Integer.parseInt(request.getParameter("age")));
	System.out.println((request.getParameter("phone")));
	System.out.println(request.getParameter("email"));
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("pw"));
	dto.setName(request.getParameter("name"));
	dto.setAge(Integer.parseInt(request.getParameter("age")));
	dto.setPhone(request.getParameter("phone"));
	dto.setEmail(request.getParameter("email"));
	
	
	int result = dao.memberJoin(dto);
	String msg = "Join Fail";
	if(result > 0){
		msg = "Join Success";
	}
	request.setAttribute("message", msg);
	request.setAttribute("path", "../index.jsp");

RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
	view.forward(request, response);
	
%>
<%-- <jsp:useBean id="dto" class="com.jh.member.memberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
 <!--dto.setId(request.getParameter("id"))  파라미터명이 같은걸 가져와서 request할 필요가 없다.  -->
<jsp:forward page="../common/test/result.jsp"></jsp:forward> <!--위에 포워딩 2문장과 같은 역할  --> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>