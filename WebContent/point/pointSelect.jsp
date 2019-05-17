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
	pointDTO dto = new pointDTO();
	dto = dao.selectOne(num); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main{
	min-height: 800px;
}
#list{
	float: right;
}
</style>
</head>
<body>
	<%@ include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<!-- table -->
		<% if(dto != null){ %>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>국어점수</th>
					<th>영어점수</th>
					<th>수학점수</th>
					<th>총점</th>
					<th>평균</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=dto.getNum()%>
					<td><%=dto.getName()%></td>
					<td><%=dto.getKor()%></td>
					<td><%=dto.getEng()%></td>
					<td><%=dto.getMath()%></td>
					<td><%=dto.getTotal()%></td>
					<td><%=dto.getAvg()%></td>
				</tr>
			</tbody>


		</table>
		<div>
			<a href="./pointUpdate.jsp?num=<%= num %>" class="btn btn-primary">update</a>
			<a href="./pointDelete.jsp?num=<%= num%>" class="btn btn-danger">Delete</a>
		</div>
		<%} else { %>
			<h1> 번호가 없습니다.</h1>
		<%} %>
		<a href="./point.jsp" class="btn btn-info" id="list">List</a>
	</div>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>