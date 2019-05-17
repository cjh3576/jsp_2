<%@page import="com.jh.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jh.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	noticeDAO dao = new noticeDAO();
    	ArrayList<noticeDTO> ar = new ArrayList<noticeDTO>();
    	ar = dao.selectList();
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main{
	min-height: 800px;
}
#title{
	cursor: pointer;
}

</style>

</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<h2>Notice</h2>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>SUBJECT</th>
					<th>NAME</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<%for(noticeDTO dto : ar){ %>
			<tbody>
				<tr>
					<td><%=dto.getNum()%></td>
					<td class="select" id="<%=dto.getNum()%>" title="<%=dto.getNum()%>"><%=dto.getTitle()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg_date()%></td>
					<td><%=dto.getHit()%></td>
				</tr>

			</tbody>
			<%} %>
		</table>
		<div>
			<form action="./noticeSelect.jsp" id="frm" method="post">
			<input type="hidden" id="n" name="num">
			</form>
		</div>
		
		<div class="row">
			<a href="<%=application.getContextPath() %>/notice/noticeWrite.jsp" class="btn btn-primary">Write</a>
		
		</div>
	</div>

	<%@include file="../temp/footer.jsp"%>
<script type="text/javascript">
	$('.select').click(function(){
		var n = $(this).attr('title');
		$('#n').val(n);
		$('#frm').submit();
	/* 	location.href = "./noticeSelect.jsp?num="+n; */
		
	}); 

</script>
</body>
</html>