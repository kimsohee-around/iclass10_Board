<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 북카페</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/read.css?v=3">
<body>
	<main id="read">
	<h3>북챗 :: 커뮤니티</h3>
	<p>오늘 무슨 책을 읽으셨나요? </p>
	<hr style="color:white;">
	<div style="width: 80%; margin: auto;max-width: 760px;">
		<ul id="table">
			<li>
				<ul class="row">
					<li>제목</li>
					<li>${vo.title}</li>
					<li>조회수</li>
					<li>${vo.readCount}</li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li>${vo.writer}<span
				style="font-size: 70%; padding-left: 30px;">(${vo.ip})</span></li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${vo.createdAt }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>			
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
					     브라우저 출력은 줄바꿈은 <br> 태그 해결1) pre 태그, 해결  2) \n을 <br>로 대치-->	
					<li>
						<pre>${vo.content}</pre>
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<a class="button" href="javascript:execute(1)">수정</a>  <!-- 자바스크립트 함수:인자값 1은 수정 -->
		<!--  예시 : 글 비밀번호 입력하여 삭제. -->
		<a class="button" href="javascript:execute(2)">삭제</a>  <!-- 자바스크립트 함수:인자값 2는 삭제  -->
		<a class="button" href="list">목록</a>
	</div>
	<script type="text/javascript">
		function execute(f){
			let url
			let message
			if(f===1){
				message='글 수정하시겠습니까?'
			}else if(f===2){
				message='글 삭제하시겠습니까?'
			}
			const yn = confirm(message)
			if(yn) {
				url = (f===1)? 'update?idx='+${vo.idx} :(f===2)? 'delete?idx='+${vo.idx}:'#'
				location.href=url
			}else{
				alert('취소합니다.')
			}	
		}
	</script>
	<!-- 메인글 출력 끝 -->
	
	<hr>
	<!-- 댓글 등록 -->
	<form action="" method="post">
	<!-- 필요한 파라미터 이지만 화면에는 표시안함. 2개 필요 : 메인글의 idx , 현재글의 페이지번호 -->
	<input type="hidden" name="mref" value="${vo.idx }">
		
		<ul>
			<li>
				<ul class="row">
					<li>작성자</li>	<!-- 구현 보류 : 로그인한 사용자가 작성할때는 로그인 이메일,닉네임 가져와서 표시 -->			
					<li><input name="writer" class="input" ></li>	
				</ul>
			</li>
			<li>
				<ul style="display: flex;">
					<li>
						<textarea rows="5" cols="80" name="content" 
						style="resize:none;margin-right:20px;" 
						placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
					</li>				
						<li style="align-self: center;margin-bottom: 20px;">
							<c:if test="${sessionScope.user != null }">  <!-- 구현 보류 : 로그인 했을때 -->
								<button type="submit">저장</button>
								<button type="button" onclick="reset_content()">취소</button>
							</c:if>
							<c:if test="${sessionScope.user == null }">		<!-- 구현 보류  : 로그인 안했들때 -->
								<button type="button" onclick="login()">로그인</button>
							</c:if>
					</li>
				</ul>
			</li>
			<li>
					<span>댓글</span>
					<span>[${vo.commentCount }]</span> <!-- 댓글갯수 -->
				<hr>
			</li>
			
			<!-- 댓글 목록 -->
			<c:forEach var="cmt" items="${cmtlist}">
			<li>
				<ul class="crow">
					<li>${cmt.writer }</li>				
					<li>${cmt.ip }</li>				
					<li>${cmt.createdAt }</li>		
					<li><a href="">삭제</a></li>				
				</ul>
			</li>
			<li>
				<pre class="cmtcontent">${cmt.content }</pre>
			</li>
			</c:forEach>
		</ul>	
	</form>
	</div>
</main>	
</body>
</html>