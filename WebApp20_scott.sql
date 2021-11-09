SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>> 기존 테이블 존재 X


--○ TBL_BOARD 테이블 생성(게시판 전용 테이블 생성)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)               NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)            NOT NULL    -- 게시물 작성자
, PWD       VARCHAR2(20)            NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                        -- 작성자 이메일
, SUBJECT   VARCHAR2(100)           NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)          NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                        -- 접속한 클라이언트 IP 주소
, HITCOUNT  NUMBER  DEFAULT 0       NOT NULL    -- 게시물 조회수
, CREATED   DATE    DEFAULT SYSDATE NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)      -- 게시물 번호에 PK 제약조건 설정
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.


--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD; 
--> 한 줄 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
; 


--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '정미화', '1234', 'hwa@test.com', '작성테스트', '내용물작성', '211.238.142.153', 0, SYSDATE);
--> 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '정미화', '1234', 'hwa@test.com', '작성테스트', '내용물작성', '211.238.142.153', 0, SYSDATE)
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;

--                  1      10  → (1~10) / (11~20) / (21~30) / 
--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
--내가 작성한 코드
/*
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM TBL_BOARD
WHERE NUM BETWEEN 1 AND 10;
*/

SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM >= 1 AND NUM <= 10
ORDER BY NUM DESC;
--@ 위에 있을수록 최신게시물!
--@ 날짜 형식 통일되게...
--@ 지워지면 지워진거 포함해서 10개가 보임! 다 지워진다면 한 페이지에 아예안 보일수도...

SELECT *
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;
--> 한 줄 구성
SELECT * FROM ( SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA) WHERE RNUM >=1 AND RNUM <= 10
;
--@ *(ALL) 보다는 항목 특정해서 쓰는 게 나음!
--@ 협업 시 작업하기 좀 더 편하기 때문!

SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA) WHERE RNUM >=1 AND RNUM <= 10
;



SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;


/*
// 참고
SELECT *
FROM
(
    SELECT RONUM RNUM, DATA.*
    FROM
    (
        SELECT *
        FROM TBL_INSA
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10;
*/


--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
/*
UPDATE TBL_BOARD
SET HITCOUNT = NVL(HITCOUNT, 0) + 1
WHERE NUM=1; 
*/

UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;


--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
    , TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE 
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
DELETE FROM TBL_BOARD WHERE NUM=1
;

--○ 특정 게시물을 수정하는 쿼리문 구성
--   (게시물 상세 보기 페이지 → Article.jsp 내에서의 처리)
--   작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME='이찬호', PWD='1234', EMAIL='lch@test.com', SUBJECT='수정제목', CONTENT='수정내용'
WHERE NUM=5;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='이찬호', PWD='1234', EMAIL='lch@test.com', SUBJECT='수정제목', CONTENT='수정내용' WHERE NUM=5
;


--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 -- 7, 207, 208, 209
/*
SELECT RNUM+1
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        WHERE NUM=1
        ORDER BY NUM DESC
    ) DATA
);
*/
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209; 
--> 한 줄 구성
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
; 

--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 -- 7, 207, 208, 209
/*
SELECT NVL(MAX(NUM), -1) AS BEFROENUM
FROM TBL_BOARD
WHERE NUM<209; 
*/

SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM<9; 
--> 한 줄 구성
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
; 


--------------------------------------------------------------------------------
--■■■ 실습 진행간 테스트 ■■■--

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '정미화', '1234', 'hwa@test.com', '작성테스트', '내용물작성', '211.238.142.153', 0, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;
--==>> 커밋 완료.

ROLLBACK;
--==>> 롤백 완료.

--○ 게시물 작성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(2, '서승균', '1234', 'ssk@test.com', '승균이 출동', '내가 바로 그 승균이다', '211.238.142.159', 0, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(3, '손다정', '1234', 'sdj@test.com', '손다정 출동', '서울 거처 마련', '211.238.142.161', 0, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

----○ 커밋
COMMIT;
--==>> 커밋 완료.



SELECT *
FROM TBL_BOARD;
--==>>
/*
                    :
154	박혜진154	java009$	apple154@test.com	최선을 다해 작성한 게시물 154	소모임 관련 내용물 작성	211.238.142.151	27	2011-04-10
155	김혜진155	java006$	morning155@test.com	열심히 작성한 게시물 155	달리기 관련 내용물 작성	211.238.142.164	72	2011-04-11
156	이혜진156	java004$	apple156@test.com	성실히 작성한 게시물 156	캠핑 관련 내용물 작성	211.238.142.154	27	2011-04-12
157	최혜진157	java002$	morning157@test.com	재미있게 작성한 게시물 157	렌터카 관련 내용물 작성	211.238.142.167	72	2011-04-13
158	최혜진158	java002$	apple158@test.com	재미있게 작성한 게시물 158	렌터카 관련 내용물 작성	211.238.142.167	27	2011-04-14
159	이혜진159	java004$	test159@test.com	성실히 작성한 게시물 159	캠핑 관련 내용물 작성	211.238.142.154	32	2011-04-15
160	김혜진160	java006$	apple160@test.com	열심히 작성한 게시물 160	달리기 관련 내용물 작성	211.238.142.164	27	2011-04-16
161	박혜진161	java009$	morning161@test.com	최선을 다해 작성한 게시물 161	소모임 관련 내용물 작성	211.238.142.151	72	2011-04-17
                    :
*/


----○ 커밋
COMMIT;
--==>> 커밋 완료.


SELECT PWD
FROM TBL_BOARD
WHERE NUM=388;
--==>> java004$

SELECT PWD
FROM TBL_BOARD
WHERE NUM=582;
--==>> java004$

/*
SELECT COUNT(*) 
AS COUNT
FROM TBL_BOARD
WHERE NAME='%김%' OR SUBJECT='%최선%';

SELECT COUNT(*) 
AS COUNT
FROM TBL_BOARD
WHERE NAME LIKE '%김%' OR SUBJECT LIKE '%최선%';
*/

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE NAME = '혜진';
--(X)

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE 
--NAME
--SUBJECT
CONTENT
LIKE '%테스트%';



SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE 
--NAME
--SUBJECT
CONTENT
LIKE '%테스트%';

--==>> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE NAME LIKE '%혜진%';


SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM >= 1 AND NUM <= 10 AND NAME LIKE '%혜%'
ORDER BY NUM DESC;
--==>> 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM >= 1 AND NUM <= 10 AND NAME LIKE '%혜%' ORDER BY NUM DESC
;
