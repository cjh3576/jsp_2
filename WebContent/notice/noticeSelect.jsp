<%@page import="com.jh.notice.noticeDTO"%>
<%@page import="com.jh.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	noticeDAO noticedao = new noticeDAO();
	noticeDTO noticedto = new noticeDTO();
	
	noticedto = noticedao.selectOne(num);
	
	noticedao.updateHit(num);//조회수 올리기
	
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
#list{
	float: right;
}
</style>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
	<div class="container main">
			<h2>NOTICE </h2>
		<!--table  -->
		<% if(noticedto!= null){ %>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>SUBJECT</th>
					<th>NAME</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=noticedto.getTitle() %></td>
					<td><%=noticedto.getWriter() %></td>
					<td><%=noticedto.getReg_date() %></td>
					<td><%=noticedto.getHit() %></td>
				</tr>
				<tr>
					<td colspan="4"><%=noticedto.getContents() %>
				</tr>
			</tbody>
		
		</table>
		<div>
			<%if(  memberdto != null && memberdto.getId().equals("admin")){ %>
			<a href="./noticeUpdateCheck.jsp?num=<%= num %>" class="btn btn-primary">Update</a>		
			<a href="./noticeDelete.jsp?num=<%= num %>" class="btn btn-danger">Delete</a>
			<%} %>
		</div>
		<%}else { %>
			<h1> 없는 메뉴 입니다.</h1>
		<%} %>
	<a href="./noticeList.jsp" class="btn btn-info" id="list">List</a>
	</div>



<%@ include file="../temp/footer.jsp" %>
</body>
</html>