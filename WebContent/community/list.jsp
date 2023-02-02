<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/list.css?v=3">  <!-- 절대경로 -->
<!-- 상대경로는 ../css/community.css 입니다. request객체의 contextPath를 el로 접근할 때에는 현재 jsp 객체 pageContext 를 사용해야 합니다. -->
</head>
<body>
<main id="list">
<h3>북챗 :: 커뮤니티</h3>
<p>오늘 무슨 책을 읽으셨나요? </p>
<hr style="color:white;">
<div style="margin:auto;width:900px;">
<ul id="main">
	<li>
		<ul  class="row">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
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
			<li><a href="read?idx=${vo.idx }" class="title">
					<c:out value="${vo.title }"/>
				</a>
		 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.commentCount }"/>)
		 		</span></li>
			<li>
				<c:out value="${vo.writer }"/>(<c:out value="${vo.ip }"/>)
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
		<a href="write" class="button" >글쓰기</a>
		<a href="${pageContext.request.contextPath}" class="button" >홈</a>
	</div>
</div>

<!-- github에 있는 list.jsp 이 뒷부분은 지우세요.(X) 페이지번호 표시할 화면 구현합니다.-->
<!-- 페이지 버튼을 클릭하면  url은  http://localhost:8081/iclass10_Board/community/list 는 동일하고 
	 page 번호 파라미터만 변경됩니다.  이런 경우 앞의 부분 생략하고 ? 부터 작성.
-->
<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
	전체 글 개수 : <c:out value="${paging.totalCount }"/> <br>
	<hr>
	<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
	
	<!--(2) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
	<a class="pagenum" href="?page=${paging.startPage-1 }"      
			style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
	
	<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<a class="pagenum ieach" href="?page=${i }"><c:out value="${i }"/></a>
	</c:forEach>
	
	<!--(4) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
	<a class="pagenum" href="?page=${paging.endPage+1 }"
			style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
			
	<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
</div>
</main>
<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${paging.currentPage}') {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
</script>
</body>
</html>













