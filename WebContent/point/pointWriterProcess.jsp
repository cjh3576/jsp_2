<%@page import="com.jh.point.pointDTO"%>
<%@page import="com.jh.point.pointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor+eng+math;
	double avg = total/3.0;
	
	pointDAO pointdao = new pointDAO();
	pointDTO pointdto = new pointDTO();
	pointdto.setName(name);
	pointdto.setKor(kor);
	pointdto.setEng(eng);
	pointdto.setMath(math);
	pointdto.setTotal(total);
	pointdto.setAvg(avg);
	int result = pointdao.insert(pointdto);
	
	
	
	String msg="Insert Fail";
	if(result>0){
		msg = "Insert Success";
	}
	
	request.setAttribute("message", msg);
	request.setAttribute("path", "./point.jsp");
	
	//forward
	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
	view.forward(request, response);

	//redirect
	//response.sendRedirect("../common/test/result.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href="./point.jsp";
</script>
</head>
<body>

</body>
</html>