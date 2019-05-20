<%@page import="com.jh.point.pointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jh.point.pointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pointDAO dao = new pointDAO();
	int curPage=1;
	//1. 페이지 초기화
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));//현재페이지번호
		if(curPage<1){
			curPage = 1;
		}

	} catch (Exception e){
		
	}
	String kind = request.getParameter("kind");
	if(kind == null){
		kind="name";
	}else {
		kind="name";
	}
	String search = request.getParameter("search");
	if(search == null){
		search="";
	}

	
	int perPage=10; //Integer.parseInt(request.getParameter("perPage")); DB 출력 단위
	int startRow = (curPage-1)*perPage+1; //시작 DB번호(num)
	int lastRow = curPage*perPage; //끝 DB번호
	
	//2. 페이지 DB 조회
	int totalCount = dao.getTotalCount(kind,search); //총글의 갯수
	int totalPage = totalCount/perPage; //총 페이지 갯수
	if(totalCount%perPage != 0){
		totalPage ++;
	}
	
	//3. block당 숫자의 갯수
	int perBlock = 5;
	
	//4. 총 블록수
	int totalBlock = totalPage/perBlock;
	if(totalPage%perBlock !=0 ){
		totalBlock ++;
	}
	
	//5. curPage 이용해서 현재 block번호 찾기
	int curBlock = curPage/perBlock;
	if(curPage%perBlock != 0){
		curBlock ++;
	}
	
	//6. curBlock에서 startNum과 lastNum찾기
	int startNum = (curBlock-1)*perBlock + 1; //블록 첫 번호
	int lastNum = curBlock*perBlock; //블록 마지막 번호
	//마지막 페이지번호는 현재블록과 총블록이 같을때 총페이지번호를 넣는다.
	if(curBlock == totalBlock){
		lastNum = totalPage;
	}
	
	ArrayList<pointDTO> ar = new ArrayList<pointDTO>();
	ar = dao.selectList(kind, search, startRow, lastRow);


%>
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
			<h1>Point Page</h1>
		</div>
		
		<!-- table -->
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어점수</th>
				<th>영어점수</th>
				<th>수학점수</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			</thead>
		<%for(pointDTO pointdto : ar){ %>
			<tbody>
			<tr>
				<td><%=pointdto.getNum() %>
				<td><a href="./pointSelect.jsp?num=<%= pointdto.getNum() %>"><%=pointdto.getName() %></a></td>
				<td><%=pointdto.getKor() %></td>
				<td><%=pointdto.getEng() %></td>
				<td><%=pointdto.getMath() %></td>
				<td><%=pointdto.getTotal() %></td>
				<td><%=pointdto.getAvg() %></td>
			</tr>
			</tbody>
			<%} %>
		
		</table>
		<div class="row">
			<form action="./point.jsp">
				<select name="kind">
					<option value="t">제목</option>
				</select>			
				<input type="text" name= "search">
				<button>Search</button>
			
			</form>
		</div>
		<div>
		<%if(curBlock>1){ %> <!--이전페이지 설정  -->
		<a href ="./point.jsp?curPage=<%=startNum-1 %>">[이전]</a>
		<%} %>
		
		<% for(int i=startNum;i<=lastNum; i++ ){%>
			| <a href = "./point.jsp?curPage=<%=i %>&kind=<%=kind%>&search=<%=search%>"><%=i %></a>
		<%} %>
		
		<%if(totalBlock > curBlock) {%> <!--다음 페이지 설정  -->
		<a href="./point.jsp?curPage=<%=lastNum+1 %>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
		<%} %>
		</div>
		
		
		<div class="row">
			<a href="<%=application.getContextPath() %>/point/pointWrite.jsp" class="btn btn-primary">Write</a>
		</div>
	</div>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>
		