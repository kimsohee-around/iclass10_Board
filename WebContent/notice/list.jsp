<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice.css?v=3">  <!-- 절대경로 -->
</head>
<body>
<main id="notice">
<h3>이용안내 :: 공지사항</h3>
<p>우리동네 북카페 입니다.</p>
<hr style="color:white;">
<div style="margin:auto;width:900px;">
<form action="list">  <!-- Get 방식 처리 -->
	<select name="column" id="column">
		<!-- 아래 value 속성값은 테이블 컬럼명과 동일하게 해야합니다. -->
		<option value="none">선택</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="createdAt">작성날짜</option>
	</select>
	<input type="text" name="findText" 
		value="${paging.findText }" placeholder="검색할 단어를 입력하세요.">
	<button type="button" id="search">검색</button><button type="button" onclick="location.href='list'">전체보기</button>
</form>
<script type="text/javascript">
		const form = document.forms[0]
		document.querySelectorAll('option').forEach(ele => {
			if(ele.value=='${paging.column}')
				ele.selected=true
			else	
				ele.selected=false
		})
		document.querySelector('#search').addEventListener('click',
					() => {
						const find = document.forms[0].findText
						if(find.value =='') {
							alert('검색어를 입력하세요.')
							find.focus()
						}else {
							 document.forms[0].submit();
						}
					})
		document.querySelector('#column').addEventListener('change',
					() => {
						const sel = form.column.value
						if(sel == 'createdAt')
							form.findText.type='date'   //선택한 항목 작성날짜일 때 input 타입 변경하기
						else
							form.findText.type='text'
					})
</script>
<ul id="main">
	<li>
		<ul  class="row">
			<li>번호</li>
			<li>제목</li>
			<li>조회수</li>
			<li>작성일</li>
		</ul>
	</li>
	
 	<c:forEach var="vo" items="${list}"> 
	<li>
		<ul  class="row">
			<li>
				<c:out value="${vo.idx }"/>
			</li>
			<li><a href="read?idx=${vo.idx }&page=${paging.currentPage}" class="title">  <!-- 현재페이지 번호 전달 시작 -순서1) -->
					<c:out value="${vo.title }"/>
				</a>
		 	</li>
			<li>
				<c:out value="${vo.readCount }"/>
			</li>
			<li>
			<!-- vo.createdAt 날짜 패턴을 적용한 결과 문자열을 createdAt 새로운 변수로 저장 -->
			<fmt:formatDate value="${vo.createdAt }" pattern="yyyy-MM-dd" var="createdAt"/>
			<!-- 오늘 작성한 글은 시간으로 표시 -->
			<c:if test='${createdAt == today}'>
				<fmt:formatDate value="${vo.createdAt }" type="time"/>
			</c:if>
			<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
			<c:if test='${createdAt != today}'>
				<fmt:formatDate value="${vo.createdAt }" pattern="yyyy-MM-dd"/>
			</c:if>
			</li>
			
		</ul>
	</li>
 	</c:forEach>
	</ul>
	<div style="float:right;margin:40px;">
<%-- 		<a href="write?page=${paging.currentPage }" class="button" >글쓰기</a> --%>  
		<!-- 로그인 상태가 아니면 로그인으로 이동으로 변경 -->
		<a href="javascript:write()" class="button">글쓰기</a>
		<a href="${pageContext.request.contextPath}" class="button" >홈</a>
	</div>
</div>
<script type="text/javascript">
	function write() {
		let yn
		if('${user.id}'==''){
			yn=confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='../login?back=w'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
		}else{
			location.href='write?page=${paging.currentPage }'
		}
	}
</script>

<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
	전체 글 개수 : <c:out value="${paging.totalCount }"/> <br>
	<hr>
	<a class="pagenum" href="javascript:page('1')">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
	
	<!--(2)  실행하면서 파악해보세요. --> <!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
	<a class="pagenum" href="javascript:page('${paging.startPage-1 }')"      
			style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
	
	<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<a class="pagenum ieach" href="javascript:page('${i }')">
			<c:out value="${i }"/>
		</a>
	</c:forEach>
	
	<!--(4)  실행하면서 파악해보세요. -->
	<a class="pagenum" href="javascript:page('${paging.endPage+1 }')"
			style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
			
	<a class="pagenum" href="javascript:page('${paging.totalPage }')">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
</div>
</main>
<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${paging.currentPage}') {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
	function page(pno){
		let url = '?page=' + pno
		if('${paging.findText }'!='')
			url += '&findText=${paging.findText}&column=${paging.column}'
		location.href=url	
	}
</script>
</body>
</html>













