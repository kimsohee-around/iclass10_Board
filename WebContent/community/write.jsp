<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>우리 북카페</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css?v=3">  <!-- 절대경로 -->
<!-- 상대경로는 ../css/community.css 입니다. 
request객체의 contextPath를 el로 접근할 때에는 현재 jsp 객체 pageContext 를 사용해야 합니다. -->
</head>
<body>
			<main id="write">
			<h3>북챗 :: 커뮤니티</h3>
			<p>오늘 무슨 책을 읽으셨나요? </p>
			<hr style="color:white;">
			<form method="post" action="write">
			 <table>
			 	<tr><th><label>제목</label></th>
			 		<td><input type="text" name="title" size="50" required></td>
			 	</tr>
			 	<tr>
					<th><label>작성자</label></th>
			 		<td><input type="text" name="writer" size="50" required></td>
			 	</tr>
			 	<tr><th><label>내용</label></th>  <!-- textarea 의 크기 : rows="30" 는 행 크기, cols="80"은 열  크기 -->
			 		<td><textarea  rows="30" cols="80" name="content" style="resize:none;"  required></textarea>
			 		<!--textarea 는 multi line(엔터키 입력으로 다중행) 입력이 됩니다.  --></td>
			 	</tr>
			 	<tr>
			 	<!-- <th></th> -->
			 	<td style="text-align: center;padding: 10px;" colspan="2">
			 	<button type="submit">저장</button>
			 	<button type="reset">다시쓰기</button>
			 	<button type="button" onclick="location.href='list?page=${page}">목록</button>
			 	</td></tr>
			 </table>
			 </form>
			 </main>
</body>
</html>
<!-- 
	이클립스에 ipv4로 처리되도록 톰캣 설정을 바꿉니다.
	request 객체로 remoteAddr 받을 때 기본 설정이 ipv6로 출력됩니다.
	변경방법 : Run Configurations -> 왼쪽 항목에서 Tomcat Server 클릭 -> Arguments 탭에서
			 ->  VM argument 문자열 맨 마지막에 다음 내용 작성. -Djava.net.preferIPv4Stack=true

 -->