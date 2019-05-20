<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.jh.member.memberDTO" scope="session"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main {
	min-height: 800px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<div class="row">
			<h1>Input</h1>
		</div>
		<div class ="table">
			<form action="./noticeWriteProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text" value='<jsp:getProperty property="id" name="member"/>'
						class="form-control" name="writer" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="contents">Contents:</label>
					<textarea class="form-control" rows="10" name="contents"></textarea>
				</div>
				<button type="submit" class="btn btn-danger">Write</button>
			</form>

		</div>
	</div>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>