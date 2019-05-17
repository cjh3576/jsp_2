<%@page import="com.jh.notice.noticeDAO"%>
<%@page import="com.jh.notice.noticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
    
	noticeDTO dto = new noticeDTO();
	noticeDAO dao = new noticeDAO();
	dto.setTitle(request.getParameter("title"));
	dto.setContents(request.getParameter("contents"));
	dto.setNum(Integer.parseInt(request.getParameter("num")));
    
	int result = dao.update(dto);
	String msg = "Update Fail";
	if(result>0){ 
		msg="Update Success";
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "./noticeList.jsp"
</script>
</head>
<body>

</body>
</html>