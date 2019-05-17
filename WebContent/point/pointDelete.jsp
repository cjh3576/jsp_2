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
    int result = dao.delete(num);
  	
    String msg="Delete Fail";
	if(result>0){
		msg = "Delete Success";
	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href="./point.jsp";
</script>
</head>
<body>

</body>
</html>