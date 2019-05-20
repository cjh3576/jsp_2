<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키의 값 확인
	Cookie [] cookie = request.getCookies();
	String rid="";
	for(Cookie c : cookie){
		if(c.getName().equals("check")){
			rid = c.getValue();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main {
	min-height: 800px;
}
</style>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<h2>Login</h2>
		<form action="./memberLoginProcess.jsp" method="post">
			<div class="form-group">
				<label for="id">ID:</label> 
				<input type="text" class="form-control"value="<%=rid %>"	name="id">
			</div>
			<div class="form-group">
				<label for="pw">Password:</label> <input type="password"
					class="form-control" name="pw">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="check"  value="true"> Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>

	</div>
	
	<%@include file="../temp/footer.jsp"%>
</body>
</html>