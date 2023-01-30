-- 메인글 테이블
create table community(
  idx number(10) NOT NULL,
  writer varchar2(50) NOT NULL,     --작성자(로그인계정 정보 등)
  title varchar2(100) NOT NULL ,	--글제목
  content varchar2(3000) NOT NULL,	-- 글 내용
  readCount number(10) default '0',    -- 조회수
  createdAt date default sysdate,       -- 작성날짜와시간 기본값
  ip varchar2(15) default '127.0.0.1',  -- 작성자 ip
  commentCount number(10) default '0',   --댓글 갯수
  primary key(idx)
);  
create SEQUENCE community_idx_seq;
-- 댓글테이블
CREATE TABLE communityComments (
	idx number(10) NOT NULL,   	-- 기본키
	mref number(10) NOT NULL,   -- community 테이블의 idx	
	writer varchar2(50) NOT NULL,	-- 작성자
	content varchar2(1000) NOT NULL,  -- 댓글 내용
	createdAt DATE default sysdate ,  -- 작성날짜와시간 기본값
	ip varchar2(15) default '127.0.0.1',  -- 작성자 ip
	heart number(3) default '0',	-- 좋아요 갯수
	primary  key (idx)
);
CREATE SEQUENCE comment_idx_seq;

-- 데이터 샘플 추가
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '김모모','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '최사나','공지','공지공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '박세리','하이','하이하이!!');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '김땡땡','이벤트','이벤트 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '강감찬','재공지','재공지재공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공55지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공66지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공77지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공88지','정회원 안내입니다.');
SELECT * FROM COMMUNITY c ;

-- 댓글 테이블 데이터
INSERT INTO communityComments (idx,mref,writer,content)
VALUES (comment_idx_seq.nextval,3,'이하니','이글은 메인글 3번 댓글~');
INSERT INTO communityComments (idx,mref,writer,content)
VALUES (comment_idx_seq.nextval,3,'김땡땡','이글은 메인글 3번 댓글~2');
INSERT INTO communityComments (idx,mref,writer,content)
VALUES (comment_idx_seq.nextval,1,'이하니','이글은 메인글 333번 댓글~');
INSERT INTO communityComments (idx,mref,writer,content)
VALUES (comment_idx_seq.nextval,9,'김땡땡','이글은 메인글 333번 댓글~2');
INSERT INTO communityComments (idx,mref,writer,content)
VALUES (comment_idx_seq.nextval,9,'김땡땡','하이!!!하이~~');

-- 필요시 데이블 및 데이터 삭제
DROP TABLE communityComments ;
DROP TABLE community ;
TRUNCATE  TABLE communityComments ;
TRUNCATE  TABLE community ;
DROP SEQUENCE community_idx_seq;
DROP SEQUENCE comment_idx_seq;
