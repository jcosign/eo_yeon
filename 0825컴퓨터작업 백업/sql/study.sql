select * from mp_board; 

CREATE TABLE MP_BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(100)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(BNO)
);

CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '제목입니다', '내용입니다', 'MELONPEACH');

SELECT * FROM MP_BOARD;
COMMIT;


insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;
commit;

select bno, title, content, writer, regdate
from ( select bno, title, content, writer, regdate, row_number() 
      over(order by bno desc) as rNum
      from mp_board) mp
where rNum between 1 and 10
order by bno desc;

create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);

create sequence mp_reply_seq START WITH 1 MINVALUE 0;

commit;

insert into mp_reply(bno, rno, content, writer)
    values(33, mp_reply_seq.nextval, '테스트댓글', '테스트 작성자');

select rno, content, writer, regdate
  from mp_reply
 where bno = 33;
 
 CREATE TABLE MP_MEMBER (
 USERID   VARCHAR2(40) NOT NULL,
 USERPASS VARCHAR2(100) NOT NULL,
 USERNAME VARCHAR2(40) NOT NULL,
 REGDATE  DATE  DEFAULT SYSDATE,
 PRIMARY KEY (USERID) );
 
 SELECT * FROM MP_MEMBER;
 
-- DELETE FROM MP_MEMBER t WHERE t.USERID='test';

CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    BNO NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);
COMMIT;

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

COMMIT;

SELECT * FROM MP_BOARD order by BNO desc;
SELECT * FROM MP_REPLY order by BNO desc;

DELETE FROM MP_BOARD t WHERE t.BNO='91';


-----24강~
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    BNO NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);
COMMIT;

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

COMMIT;
 
 
 SELECT MP_BOARD_SEQ.NEXTVAL FROM DUAL;
 
 select * from MP_FILE;
 
 ALTER TABLE MP_BOARD ADD(HIT NUMBER DEFAULT 0);
 
COMMIT;

select * from MP_BOARD;

drop table MP_FILE;

----