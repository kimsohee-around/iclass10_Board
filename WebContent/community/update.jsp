<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>우리 북카페</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css?v=3">  <!-- 절대경로 -->
</head>
<body>
<main id="write">
<h3>북챗 :: 커뮤니티</h3>
<p>오늘 무슨 책을 읽으셨나요? </p>
<hr style="color:white;">
<form name="frm1" method="post" action="update">
	<input type="hidden" name="idx" value="${vo.idx }">
 <table>
 	<tr><th>제목</th>
 		<td><input type="text" name="title" size="50" value="[수정]${vo.title }" readonly>
 			<!-- readonly : 입력불가 -->
 		</td>
 	</tr>
 	<tr>
		<th>작성자</th>
 		<td><input type="text" name="writer" size="50" value="${vo.writer }" disabled="disabled"></td>
 		<!-- disabled : 입력 불가 + 파리미터 전송 못함. -->
 	</tr>
 	 <tr>
		<th>작성 날짜</th>
 		<td><c:out value="${vo.createdAt }"/></td>
 	</tr>
 	
 	<tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td>
 			<textarea  rows="30" cols="80" name="content" required><c:out value="${vo.content }"/></textarea>
 		</td>
 	</tr>
 	<tr>
 	<td colspan="2" align="center">
	 	<button type="submit">저장</button>
	 	<button type="reset">다시쓰기</button>
	 	<button type="button" onclick="location.href='list'">목록</button>
 	</td>
 	</tr>
 </table>
 </form>
</main> 
</body>
</html>