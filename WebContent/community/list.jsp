<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css?v=3">  <!-- 절대경로 -->
<!-- 상대경로는 ../css/community.css 입니다. request객체의 contextPath를 el로 접근할 때에는 현재 jsp 객체 pageContext 를 사용해야 합니다. -->
</head>
<body>
<main>
<h3>우리 북카페 커뮤니티</h3>
<hr>
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
			<li><a href="" class="title">
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

<!-- github에 있는 list.jsp 이 뒷부분은 지우세요. -->
</main>
</body>
</html>













