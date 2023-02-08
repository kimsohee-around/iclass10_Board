<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/booklist.css?v=3">  <!-- 절대경로 -->
<!-- 상대경로는 ../css/community.css 입니다. request객체의 contextPath를 el로 접근할 때에는 현재 jsp 객체 pageContext 를 사용해야 합니다. -->
</head>
<body>
<main id="booklist">
<h3>새로나온 책 </h3>
<p>이 달의 새로 나온 책을 소개합니다. </p>
<hr style="color:white;">
<div style="width: 900px; margin: auto;overflow:hidden;border:1px solid gray;">
			<c:forEach var="bo" items="${books }">
			<div class="gallery">
				<div>
				<a href=""> <img src="/upload/${bo.coverfile }" alt="${bo.title }">
				<!-- 이미지가 저장된 서버의 파일시스템 경로는 url /upload 로 설정을 해야합니다.
					 server.xml 에서 하러 갑니다.
			<Context docBase="d:\iclass1020\upload" path="/upload" reloadable="true"/>
			</Host>바로위에 작성하기 
				 -->
				</a>
				</div>
				<p>${bo.title }</p>
			</div>
			</c:forEach>

</div>
	<div style="float:right;margin:40px;padding-right: 100px;">
		<a href="new" class="button" >쓰기</a>  
		<a href="${pageContext.request.contextPath}" class="button" >홈</a>
	</div>
</main>
</body>
</html>
<!-- 위지윅 textarea 라이브러리 참고 : https://shxrecord.tistory.com/122 -->












