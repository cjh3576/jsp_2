<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp"%>
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
		<form action="./pointWriterProcess.jsp">

			<div class="form-group">
				<label for="usr">Name:</label> <input type="text"
					class="form-control" name="name">
			</div>
			<div class="form-group">
				<label for="kor">KOR:</label> <input type="text"
					class="form-control" name="kor">
			</div>
			<div class="form-group">
				<label for="eng">ENG:</label> <input type="text"
					class="form-control" name="eng">
			</div>
			<div class="form-group">
				<label for="math">MATH:</label> <input type="text"
					class="form-control" name="math">
			</div>
			<button type="submit" class="btn btn-danger">Write</button>
		</form>
	</div>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>