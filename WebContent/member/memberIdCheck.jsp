<%@page import="com.jh.member.memberDAO"%>
<%@page import="com.jh.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String id= request.getParameter("id");
	
	memberDTO memberdto = new memberDTO();
	memberDAO memberdao = new memberDAO();
	int result = memberdao.idCheck(id);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#iduse').click(function(){
			id = document.getElementById('id').value;
			opener.document.getElementById('iid').value = id;
			opener.document.getElementById('idConfirm').value = '1';
			close();
		});
		$('#id').change(function(){
			$('#iduse').remove();
		});
	});
</script>
</head>
<body>
<div class="container">
  <h2>아이디를 입력하세요</h2>
  <form action="./memberIdCheck.jsp">
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" id="id" value='<%=id %>' name="id">
      <button>중복확인</button>
    </div>
	<div id="idcheck" class="check">
		<%if(result == 0){ %>
      <input type="button" value="사용하기" id="iduse">
      <%} %>
  	</div>
  </form>
  </div>
</body>
</html>