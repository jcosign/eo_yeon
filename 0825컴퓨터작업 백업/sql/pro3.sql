--회원 테이블
CREATE TABLE member (
memid VARCHAR2(50), --회원 아이디
mempw VARCHAR2(50), --회원 비밀번호
memname VARCHAR2(50), --회원 이름
memem VARCHAR2(50), --회원 이메일
PRIMARY KEY (memid)
);

-- faq 게시판 테이블
CREATE TABLE faqbbs(
faqno NUMBER(10,0), --글 번호
faqtitle VARCHAR2(50), --글제목
faqcontent CLOB,  --글내용
faqwriter VARCHAR2(50), --작성자(아이디)
faqdate DATE DEFAULT SYSDATE, --글등록일(작성일)
PRIMARY KEY (faqno),
FOREIGN KEY (faqwriter) REFERENCES member (memid)
);

SELECT * FROM MEMBER;

SELECT * FROM FAQBBS;
