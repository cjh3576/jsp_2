<%@page import="com.jh.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	/* memberDTO dto = (memberDTO)session.getAttribute("member"); */
	
	
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp"/>
<style type="text/css">
.main{
	min-height: 800px;
}
</style>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp"/>
<div class="container main">
<h1>My Page</h1>
<jsp:useBean id="member" class="com.jh.member.memberDTO" scope="session"></jsp:useBean>
<h1>Id:	<jsp:getProperty property="id" name="member"/> <%-- <%=dto.getId() %> --%></h1>
<h1>Name: <jsp:getProperty property="name" name="member"/><%-- <%=dto.getName() %> --%></h1>
<h1>Age: <jsp:getProperty property="age" name="member"/><%-- <%=dto.getAge() %> --%></h1>
<h1>Phone: <jsp:getProperty property="phone" name="member"/><%-- <%=dto.getPhone() %> --%></h1>
<h1>Email: <jsp:getProperty property="email" name="member"/><%-- <%=dto.getEmail() %> --%></h1>

<a href="./memberUpdate.jsp" class="btn btn-primary">Update</a>
<a href="./memberDelete.jsp" class="btn btn-danger">Delete</a>









</div>

<jsp:include page="../temp/footer.jsp"/>
</body>
</html>