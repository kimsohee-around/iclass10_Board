-- 다른 기능들 SQL : dao 메소드, mapper XML(community.xml)의 id 이름 동일하게 정해보겠습니다.
-- 참고 count(*),max() 함수의 SQL문 resultType은 int

-- 전체 글의 갯수 : *count*
SELECT count(*) FROM community ;	
-- idx 최대값 : *maxOf* -> 이 메소드는 각 매퍼 xml에 모두 작성하기
SELECT max(idx) FROM community ;	
SELECT max(idx) FROM communityComments ;	

-- 메인글 idx (3번)의 글 : selectByIdx 로 완료했음.
SELECT * FROM community f WHERE idx=3;


-- *setReadCount*
UPDATE community 
SET READCOUNT = READCOUNT +1 
WHERE idx = 3;		--조회수 업데이트(증가)

-- 메인글 idx (3번)의 댓글 갯수 : *commentsCount*
SELECT count(*) FROM communityComments c WHERE mref=3;

-- 댓글 개수 업데이트(댓글 추가,삭제 할때 모두 필요함)  : *setCommentCount*
UPDATE community 
SET COMMENTCOUNT = 
	(SELECT count(*) FROM communityComments c WHERE mref=3)
WHERE idx = 3;

-- 댓글 idx의 삭제 : 완료헀음.
DELETE FROM communityComments c WHERE idx = 2;

-- *comments*
SELECT * FROM communityComments c WHERE mref=3;   -- 메인 3번글의 댓글 목록(리스트)

-- 게시판 글목록은 idx 의 내림차순 그리고, rownum 10개씩 조회
SELECT * FROM 
	(SELECT rownum r ,f.* from
		(SELECT * FROM community  ORDER BY idx DESC) f)
WHERE r BETWEEN 1 AND 10	;		    -- 1page 글목록
-- WHERE r BETWEEN 11 AND 20	;		-- 2page 글목록
--WHERE r BETWEEN 21 AND 30	;		    -- 3page 글목록
