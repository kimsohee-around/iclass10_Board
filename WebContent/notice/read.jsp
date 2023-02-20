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
	<h3>이용안내 :: 공지사항</h3>
	<p>우리동네 북카페는 편안하고 행복합니다.</p>
	<hr style="color:white;">
	<div style="width: 80%; margin: auto;max-width: 760px;">
		<ul id="table">
			<li>
				<ul class="row">
					<li>제목</li>
					<li><c:out value="${vo.title}"/></li>
					<li>조회수</li>
					<li><c:out value="${vo.readCount}"/></li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li>관리자</li>
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
						<pre><c:out value="${vo.content}"/></pre>
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
	<c:if test="${user.id=='admin'}">  <!-- session 에 저장된 user애트리뷰트의 id와 작성자의 id 가 같은면 보이기 -->
		<a class="button" href="javascript:execute(1)">수정</a>  <!-- 자바스크립트 함수:인자값 1은 수정 -->
		<!--  예시 : 글 비밀번호 입력하여 삭제. -->
		<a class="button" href="javascript:execute(2)">삭제</a>  <!-- 자바스크립트 함수:인자값 2는 삭제  -->
	</c:if>
		<a class="button" href="javascript:execute(3)">목록</a>   <!-- 세션에 저장한 paging 애트리뷰트에서 가져오기 -->
	</div>
	<script type="text/javascript">
		function execute(f){
			let url
			let message = (f===1)?'글 수정하시겠습니까?':(f===2)?'글 삭제하시겠습니까?':''
			let yn=false
			//f값에 따라 기본 url 설정하기
			if(f===1 || f===2){
				let yn = confirm(message)
				if(yn) 
					url = (f===1)? 'update?idx=${vo.idx}&' :(f===2)? 'delete?idx=${vo.idx}&':'#';
			}else if(f===3){
				yn=true
				url='list?'
			}else return;
			//cofirm 에서 `예`를 클릭하면
			console.log(yn)
			if(yn) {
				url += 'page='+${paging.currentPage };    //파라미터에 페이지번호 추가
				if('${paging.findText }'!='')		//검색값이 있을 때 파라미터에 검색값 2개 추가
					url += '&findText=${paging.findText }&column=${paging.column }'
				location.href=url
			}else {
				alert('취소합니다.')
			}	
		}
	</script>
</div>
</main>
</body>
</html>