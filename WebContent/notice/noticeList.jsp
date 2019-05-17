<%@page import="com.jh.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jh.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	noticeDAO dao = new noticeDAO();
    	//1. 페이지 초기화 ,, 페이지에 몇개씩 출력할 것인지 정함
    	int curPage=1;
    	try{
    	curPage = Integer.parseInt(request.getParameter("curPage"));
    		if(curPage<1){
    			curPage = 1;
    		}
    	} catch(Exception e){
    		
    	}
    	String kind = request.getParameter("kind");
    	
    	if(kind==null){
    		kind="title";	
    	}
    	else if(kind.equals("c")){
    		kind="contents";
    	}else if(kind.equals("w")){
    		kind="writer";
    	}else {
    		kind="title";
    	}
    	
    	
    	String search = request.getParameter("search");
    	if(search == null){
    		search="";
    	}
    	
    	
    	int perPage = 10; //페이지당 몇개씩 출력할 것인가
    	int startRow = (curPage-1)*perPage + 1; //시작할 DB ROWNUM
    	int lastRow = curPage*perPage; //끝나는 DB ROWNUM
    	
    	//2. 페이지 DB 조회 ,,, 아래 페이지번호 
    	int totalCount = dao.getTotalCount(kind,search);
    	int totalPage = totalCount/perPage;
    	if(totalCount%perPage != 0){
    		totalPage++;
    	}
    	//3. block당 숫자의 개수
    	int perBlock = 5;
    	
    	//4. 총블록수
    	int totalBlock = totalPage/perBlock;
    	if(totalPage%perBlock != 0){
    		totalBlock++;
    	}
    	
    	//5. curPage이용해서 현재 block 번호 찾기
    	int curBlock = curPage/perBlock;
    	if(curPage%perBlock != 0){
    		curBlock ++;
    	}
    	//6. curBlock에서 startnum과 lastnum 찾기
    	int startNum = (curBlock-1)*perBlock + 1;
    	int lastNum = curBlock*perBlock;
    	
    	if(curBlock == totalBlock){
    		lastNum = totalPage;
    	}
    	
    	ArrayList<noticeDTO> ar = new ArrayList<noticeDTO>();
    	ar = dao.selectList(kind, search, startRow, lastRow); //범위내 출력
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main{
	min-height: 800px;
}
#title{
	cursor: pointer;
}

</style>

</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<h2>Notice</h2>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>SUBJECT</th>
					<th>NAME</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<%for(noticeDTO dto : ar){ %>
			<tbody>
				<tr>
					<td id="num"><%=dto.getNum()%></td>
					<td class="select"><%=dto.getTitle()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg_date()%></td>
					<td><%=dto.getHit()%></td>
				</tr>

			</tbody>
			<%} %>
		</table>
		<div class="row">
			<form action="./noticeList.jsp">
				<select name="kind">
					<option value="t">제목</option>
					<option value="w">작성자</option>
					<option value="c">내용</option>
				</select>			
				<input type="text" name= "search">
				<button>Search</button>
			
			</form>
		</div>
		<div>
		
		<%if(curBlock>1){ %>
		<a href="./noticeList.jsp?curPage=<%=startNum-1 %>">[이전]</a>
		<%} %>
		
		<%for(int i=startNum;i<=lastNum; i++){ %>
			| <a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a>
		<%} %>
		
		<%if(totalBlock > curBlock){ %>
		<a href="./noticeList.jsp?curPage=<%=lastNum+1 %>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
		<%} %>
		</div>
		<div class="row">
			<a href="<%=application.getContextPath() %>/notice/noticeWrite.jsp" class="btn btn-primary">Write</a>
		
		</div>
	</div>

	<%@include file="../temp/footer.jsp"%>
<script type="text/javascript">
	$('.select').click(function(){
		var n = $(this).prev().text();
		location.href = "./noticeSelect.jsp?num="+n;
		
	});

</script>
</body>
</html>