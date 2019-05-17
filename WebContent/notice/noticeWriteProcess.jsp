<%@page import="com.jh.notice.noticeDTO"%>
<%@page import="com.jh.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	noticeDAO dao = new noticeDAO();
    	noticeDTO dto = new noticeDTO();
    	dto.setTitle(request.getParameter("title"));
    	dto.setWriter(request.getParameter("writer"));
    	dto.setContents(request.getParameter("contents"));
    
    	int result = dao.insert(dto);
    	String msg="Insert Fail";
    	if(result>0){
    		msg="Insert Success";
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href ="./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>