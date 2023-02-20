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
<h3>이용안내 :: 공지사항</h3>
<p>우리동네 북카페는 편안하고 행복합니다.</p>
<hr style="color:white;">
<form name="frm1" method="post" action="update">
	<input type="hidden" name="idx" value="${vo.idx }">
	<input type="hidden" name="page" value="${page}">    
	<!-- 현재페이지 번호 전달 - 순서5) post 로 전달해야 하므로 hidden type으로 저장 -->
 <table>
 	<tr><th>제목</th>
 		<td>
 			<c:choose>
 				<c:when  test="${fn:contains(vo.title,'[수정]') }">
 					<input type="text" name="title" size="50" value="${vo.title }" readonly>	
 				</c:when>
 				<c:otherwise>
 					<input type="text" name="title" size="50" value="[수정]${vo.title }" readonly>
 				</c:otherwise>
 			</c:choose>
 			<!-- readonly : 입력불가 -->
 		</td>
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
	 	<button type="button" onclick="location.href='list?page=${paging.currentPage}&findText=${paging.findText }&column=${paging.column }'">목록</button>  <!-- 현재페이지 번호 전달 - 순서5) -->
 	</td>
 	</tr>
 </table>
 </form>
</main> 
</body>
</html>