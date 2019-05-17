<%@page import="com.jh.point.pointDTO"%>
<%@page import="com.jh.point.pointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	int num = Integer.parseInt(request.getParameter("num"));
	pointDAO dao = new pointDAO();
	pointDTO dto = dao.selectOne(num); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp" %>
<style type="text/css">
.main{
	min-height: 800px;
}
</style>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container main">
		<div class="row">
			<h1>Update</h1>
		</div>
		
		<form action="./pointUpdateProcess.jsp">
		<input type="hidden" name="num" value="<%= dto.getNum() %>">
			<div class="form-group">
				<label for="usr">Name:</label> <input type="text"	class="form-control" name="name" value="<%= dto.getName()%>">
			</div>
			<div class="form-group">
				<label for="kor">KOR:</label> <input type="text" 
					class="form-control" name="kor" value="<%= dto.getKor()%>">
			</div>
			<div class="form-group">
				<label for="eng">ENG:</label> <input type="text"
					class="form-control" name="eng" value="<%= dto.getEng()%>">
			</div>
			<div class="form-group">
				<label for="math">MATH:</label> <input type="text"
					class="form-control" name="math" value="<%= dto.getMath()%>">
			</div>
			<button type="submit" class="btn btn-danger">Update</button>
		</form>
		






</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>