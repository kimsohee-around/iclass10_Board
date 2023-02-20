-- 검색기능을 구현하기 위한 게시판 
-- 메인글 테이블 (작성자는 오직 담당자)
create table notice(
  idx number(10) NOT NULL,
  title varchar2(100) NOT NULL ,	--글제목
  content varchar2(3000) NOT NULL,	-- 글 내용
  readCount number(10) default '0',    -- 조회수
  createdAt date default sysdate,       -- 작성날짜와시간 기본값
  primary key(idx)
);  
create SEQUENCE notice_idx_seq;

-- 데이터 샘플 추가
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '알립니다.','오늘 모임 변경안내입니다.','2022-03-03');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '공지','공지공지','2022-04-22');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '하이','하이하이!!','2022-05-01');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '이벤트','이벤트 안내입니다.','2022-05-15');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '재공지','재공지재공지','2022-07-11');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (community_idx_seq.nextval, '회원가입 오류','가입 오류 안내입니다.','2022-11-7');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '정회원 공55지','정회원 안내입니다.','2022-08-24');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '정회원 공66지','정회원 안내입니다.','2022-09-12');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '정회원 공77지','정회원 안내입니다.','2022-12-24');
INSERT INTO notice (idx,title,content,createdAt)
VALUES (notice_idx_seq.nextval, '정회원 공88지','정회원 안내입니다.','2023-01-22');
SELECT * FROM notice n ;

-- 필요시 데이블 및 데이터 삭제
DROP TABLE notice ;
TRUNCATE  TABLE notice ;
DROP SEQUENCE notice_idx_seq;

SELECT * FROM NOTICE n 
WHERE to_char(CREATEDAT ,'YYYY-MM-DD')='2022-12-24';


-- 
SELECT * FROM 
	(SELECT rownum r ,f.* from
		(SELECT * 
		 FROM notice  
		 WHERE title LIKE '%' || '회원' || '%'
		 OR content LIKE '%' || '회원' || '%'
		 ORDER BY idx DESC) f
 	)
WHERE r BETWEEN 1 AND 100	;