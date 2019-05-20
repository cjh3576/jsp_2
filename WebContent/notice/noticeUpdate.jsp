<%@page import="com.jh.notice.noticeDTO"%>
<%@page import="com.jh.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num= Integer.parseInt(request.getParameter("num"));
	noticeDAO dao = new noticeDAO();
	noticeDTO dto = dao.selectOne(num);
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
<%@include file="../temp/header_nav.jsp" %>
<div class="container main">
	<div class="row">
		<h1>Update</h1>
	</div>
	<form action="./noticeUpdateProcess.jsp" method="post">
	<input type="hidden" name="num" value="<%= dto.getNum() %>">
	<div class="form-group">
		<label for="title">Title:</label>
		<input type="text" class="form-control" name="title" value="<%=dto.getTitle()%>">
	</div>
	<div class="form-group">
		<label for="writer">Writer:</label><input type="text" class="form-control" name="writer" value="<%=dto.getWriter()%>" readonly="readonly">

	</div>
	<div class="form-group">
		<label for="contents">Contents:</label>
		<textarea class="form-control" rows="10" name="contents"><%=dto.getContents() %></textarea>
	</div>
		<button type="submit" class="btn btn-danger">Write</button>
	</form>


</div>


<%@include file="../temp/footer.jsp" %>
</body>
</html>