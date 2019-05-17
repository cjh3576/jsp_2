<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
		$(function(){
			$('#checkAll').click(function(){
				var c = $(this).prop('checked');
				$('.check').prop('checked', c);
			}); 
			
			$('.check').click(function(){
				var c = true;
				$('.check').each(function(){ //반복문
					if(!$(this).prop('checked')){
						c=false;
					}
				});
				$('#checkAll').prop('checked',c);
			});
			
			$('#join').click(function(){
				var c = $('#checkAll').prop('checked');
				if(c){
					location.href = "./memberJoin.jsp";
				}else {
					alert('약관에 동의하세요');
				}
			});
			
		}); //끝
	
</script>
<style type="text/css">
.main{
	min-height: 800px;
}
</style>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<h2>약관동의</h2>

		<div class="checkbox">
			<label><input type="checkbox" id="checkAll"> 전체동의</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" class="check"> 동의A</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" class="check"> 동의B</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" class="check"> 동의C</label>
		</div>
		<input type="button" class="btn btn-default" value="Join" id="join">
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>