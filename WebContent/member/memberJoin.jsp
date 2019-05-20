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
<style type="text/css">
.main{
	min-height: 800px;
}
.check{
	color : red;
}
</style>
<script type="text/javascript">
	$(function() {
		var f = document.boardform;
		var id;
		var pw;
		
		var overlapcheck;
		$('#iid').keyup(function() {
			id = document.getElementById('iid');
			var idcheck = document.getElementById('idcheck');
			if (id.value.length > 9) {
				idcheck.innerHTML = '아이디는 10자 미만으로 입력하세요';
			} else if (id.value.length < 10) {
				idcheck.innerHTML = '';
			} else if (id.value == '') {
				idcheck.innerHTML = '필수 입력 항목입니다.';
			}

		});//Id 글자수 체크
		
		$('#idoverlap').click(function() {
			id = document.getElementById('iid').value;
			open("./memberIdCheck.jsp?id="+id , "myWindow", "width=400, height=300");
			
		});//Id 중복확인 창 띄우기
		
		
			$('#iid').change(function(){
			document.getElementById('idoverlap').value = '중복확인';
			id = document.getElementById('iid');
			var idcheck = document.getElementById('idcheck');
			if (id.value.length > 9) {
				idcheck.innerHTML = '아이디는 10자 미만으로 입력하세요';
			} else if (id.value.length < 10) {
				idcheck.innerHTML = '';
			} else if (id.value == '') {
				idcheck.innerHTML = '필수 입력 항목입니다.';
			}
			
			}); //id 변경시 재 확인

			
		
		$('#ipw').blur(function() {
			pw = document.getElementById('ipw');
			var pwcheck = document.getElementById('pwcheck');
			if (pw.value.length < 6&& pw.value.length>1) {
				pwcheck.innerHTML = '패스워드는 6자 이상으로 입력하세요';
			} else if (pw.value.length > 5) {
				pwcheck.innerHTML = '';
			} else if(pw.value ==''){
				pwcheck.innerHTML='필수 입력 항목입니다.';
			}

		});//비밀번호 6자 이상 체크
		

		$('#ipwd1').blur(function() {
			pwd1 = document.getElementById('ipwd1');
			var pwdoverlap = document.getElementById('pwdoverlap');
			if (ipw.value == pwd1.value) {
				pwdoverlap.innerHTML = '비밀번호가 일치합니다';
			} else if(ipwd1.value ==''){
				pwdoverlap.innerHTML = '필수 입력 항목입니다.';
			} 
			else if(ipw.value != pwd1.value){
				pwdoverlap.innerHTML = '비밀번호가 일치하지 않습니다';
			}
		});//비밀번호 일치확인
		$('#iname').blur(function() {
			var name = document.getElementById('iname');
			var namec = document.getElementById('namecheck');
			if (name.value == '') {
				namec.innerHTML = '필수 입력 항목입니다';
			} else if (name.value.length > 5) {
				namec.innerHTML = '';

			}
		}); //이름 입력 확인
		
		
		$('#iage').blur(function() {
			var age = document.getElementById('iage');
			var agec = document.getElementById('agecheck');
			if (age.value == '') {
				agec.innerHTML = '필수 입력 항목입니다';
			} else if (age.value.length > 5) {
				agec.innerHTML = '';

			}
		}); //나이 입력 확인
		
		$('#iemail').blur(function() {
			var email = document.getElementById('iemail');
			var emailc = document.getElementById('emailcheck');
			if (email.value == '') {
				emailc.innerHTML = '필수 입력 항목입니다';
			} else if (email.value.length > 5) {
				emailc.innerHTML = '';

			}
		});//이메일 입력 확인
		

		$('#iphone').blur(function() {
			var phone = document.getElementById('iphone');
			var phonec = document.getElementById('phonecheck');
			if (phone.value == '') {
				phonec.innerHTML = '필수 입력 항목입니다';
			} else if (phone.value.length > 5) {
				phonec.innerHTML = '';
			}
		})//폰 입력 확인
		
		$('#join').click(function() {
			var str = f.iid.value;
			if(!str || str.length>9) {
				alert("ID를 입력하세요.  ");
				f.id.focus();
				return false;
			}
			
			str = document.getElementById('idConfirm').value;
			if(str !="1") {
				alert('ID 중복 확인을 하세요.  ');
				f.id.focus();
				return false;
			}
			
			str = f.ipw.value;
			if(!str||str.length<6) {
				alert("PW를 입력하세요.  ");
				f.pw.focus();
				return false;
			}
			
			str = f.ipwd1.value;
			var str1 = f.pwd.value;
			if(!str|| str != str1){
				alert("PW를 재확인하세요.  ");
				f.pwd1.focus();
				return false;
			}
			
			str = f.iname.value;
			if(!str){
				alert("Name을 입력하세요.  ");
				f.name.focus();
				return false;
			}
			
			str = f.iage.value;
			if(!str){
				alert("age을 입력하세요.  ");
				f.age.focus();
				return false;
			}
			
			str = f.iphone.value;
			if(!str){
				alert("Phone을 입력하세요.  ");
				f.phone.focus();
				return false;
			}
			str = f.iemail.value;
			if(!str){
				alert("Email을 입력하세요.  ");
				f.email.focus();
				return false;
			}
			
			location.href = "./memberJoinProcess.jsp";
			
		}); //조인 폼

	});//끝
</script>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	
	<div class="container main">
		<h2>Join form</h2>
		<form action="./memberJoinProcess.jsp" name = "boardform" method="post">
			<div class="form-group">
				<label for="id">Id:</label> 
				<input type="text" class="form-control" id="iid" placeholder="Enter Id" name="id"  >
				<input type="hidden" id="idConfirm" value="0">
				<input type="button" value="중복확인" id="idoverlap" >
				<div id="idcheck" class = "check"></div>
			</div>
			<div class="form-group">
				<label for="pw">Password:</label> 
				<input type="password" class="form-control" id="ipw" placeholder="Enter password" name="pw">
				<div id="pwcheck" class = "check"></div>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> 
				<input type="password" class="form-control" id="ipwd1" placeholder="Enter password" name="pwd1">
				<div id="pwdoverlap" class="check"></div>
			</div>
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" id="iname" placeholder="Enter name"
					name="name">
				<div id="namecheck" class = "check"></div>
			</div>
			<div class="form-group">
				<label for="age">Age:</label> <input type="text"
					class="form-control" id="iage" placeholder="Enter age" name="age">
				<div id="agecheck" class = "check"></div>
			</div>
			<div class="form-group">
				<label for="phone">Phone:</label> <input type="text"
					class="form-control" id="iphone" placeholder="Enter Phone"
					name="phone">
				<div id = "phonecheck" class="check"></div>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> 
				<input type="email"	class="form-control" id="iemail" placeholder="Enter email"
					name="email">
				<div id="emailcheck" class = "check"></div>
			</div>
			<input type="submit" class="btn btn-primary" value="Join" id = "join">
		</form>
	</div>
	

	
	<%@include file="../temp/footer.jsp"%>
</body>
</html>