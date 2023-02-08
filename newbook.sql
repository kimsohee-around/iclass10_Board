CREATE TABLE newbooks( 
	idx number(5) NOT NULL, 
	title varchar2(100) NOT NULL , -- 책 제목
	summary varchar2(500),
	regdate DATE DEFAULT sysdate,  -- 작성날짜
	coverfile varchar2(300),	-- 커버이미지 파일명
	userid varchar2(20),  -- 작성자 id
	PRIMARY KEY(idx) );

CREATE SEQUENCE newbooks_idx_seq;

DROP TABLE NEWBOOKS ;
TRUNCATE TABLE NEWBOOKS ;

INSERT INTO newbooks VALUES (newbooks_idx_seq.nextval,'불편한 편의점','불편한데 자꾸 가고 싶은 편의점이 있다!
힘들게 살아낸 오늘을 위로하는 편의점의 밤
정체불명의 알바로부터 시작된 웃음과 감동의 나비효과
망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2',sysdate,'불편한편의점.jpg','twice');

SELECT * FROM newbooks;

-- SQL 문 실행하고 테스트 끝나면 insert, select 전체조회 에 대해 xml,vo,dao 생성합니다.














