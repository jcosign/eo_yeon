--8/24 13.P329--
--4. DBA가 관리하는 테이블들(SYS 계정으로 들어가야 한다.)
SELECT * FROM DBA_TABLES;

--6. SYS접속, 사용자 명이 SCOTT에 대한 정보 확인
SELECT * FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

--7. SCOTT 계정, INDEX만들어진 열 확인
SELECT * FROM USER_IND_COLUMNS;

--13. SYS계정, SCOTT에게 VIEW 생성 권한 주기
GRANT CREATE VIEW TO SCOTT;