<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.check{
	color : red;
}
</style>
<script type="text/javascript">
$(function(){
    $('#c').click(function(){
    close();
    }); //close 클릭시 창 닫음


	$('#id').keyup(function() {
				var id = document.getElementById('id').value;
				var idcheck = document.getElementById('idcheck');
				
				if (id.length > 10) {
					idcheck.innerHTML = '아이디는 10자 미만으로 입력하세요';
					return false;
				}
				else if (id.length < 10) {
					idcheck.innerHTML = '';
					$('#iduse').click(function() {
					opener.document.getElementById('iid').value = id;
					opener.document.getElementById('idoverlap').value = '중복확인성공';
					close();
					});
				}
			
		})//사용하기 클릭시 입력된 값이 jquery_7의 id 입력란에 들어감
	});
</script>
</head>
<body>
<div class="container">
  <h2>아이디를 입력하세요</h2>
  <form action="/memberJoin.jsp">
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter Id" name="id">
    <div id="idcheck" class = "check"></div>
    </div>

      <input type="button" value="중복확인">
      <input type="button" value="사용하기" id="iduse">
      <input type="button" value="close" id="c">
  </form>
  </div>
</body>
</html>