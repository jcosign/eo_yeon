-------- 8/19 11.Ʈ����� ����� ����----------

--1 dept ���̺� ��� ���� ���� dept_tcl ���̺� ����
create table dept_tcl
as select * from dept;

-- �ٸ� ���̺��� ������ ���� Ȯ��
select * from dept_tcl;

--2 50�� �μ� DATABASE, SEOUL�� dept_tcl ���̺� ����
insert into dept_tcl values(50, 'DATABASE', 'SEOUL');

--3 40�� �μ��� �ּҸ� BUSAN���� ����
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;

--4 �μ����� RESEARCH ����
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

--4 �� Ȯ��
SELECT * FROM DEPT_TCL;

--5 
ROLLBACK;

--5(�ѹ�) �Ϸ� �� Ȯ��
SELECT * FROM DEPT_TCL;

--6 DEPT_TCL ���̺� 50, NETWORK, SEOUL ���� ����
INSERT INTO DEPT_TCL VALUES(50, 'NETWORK', 'SEOUL');

--7 20�� �μ� ��ġ: BUSAN���� ����
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 20;

--8 40�� �μ� ����
DELETE FROM DEPT_TCL WHERE DEPTNO = 40;

--9 ���� Ȯ��
SELECT * FROM DEPT_TCL;

--10 ����Ϸ�
COMMIT;

--11 ���� Ȯ��
SELECT * FROM DEPT_TCL;

----====�����ʿ� �� â ���

-----1.
SELECT * FROM DEPT_TCL;
-- ���Ƿ� �ƹ� �� ����
INSERT INTO DEPT_TCL VALUES(55, 'NETWORK', 'DEAJEON');
SELECT * FROM DEPT_TCL;
--Ŀ�� �� ������ â ���� Ȯ�� ����(�����)
COMMIT;

DELETE FROM DEPT_TCL WHERE DEPTNO = 55;
SELECT * FROM DEPT_TCL;

--12 30�� �μ� �ּ� SEOUL �� ����
UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;

--13 30�� �μ� �ּ� SEOUL �� ����
UPDATE DEPT_TCL SET LOC = 'DEAJEON' WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;

ROLLBACK;

COMMIT;

--���̺� �����
DELETE FROM DEPT_TCL;

-----=====�����ʿ� ���� ��� â ����
SELECT * FROM DEPT_TCL;

UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 30;
--���� â���� ���� �ٲ� ���¿��� Ŀ�Ծ��� ������ â���� �����ϸ� ���� �ɷ� ����Ұ�.

COMMIT;
-----=============================

--P309 ���� ���̺�
create table DEPT_HW
as select * from dept;

SELECT * FROM DEPT_HW;

UPDATE DEPT_HW SET DNAME='DATABASE', LOC ='SEOUL' WHERE DEPTNO = 30;

ROLLBACK;

SELECT * FROM DEPT_HW;

-----

--P309 ������ ���̺�

SELECT * FROM DEPT_HW;

UPDATE DEPT_HW SET DNAME='DATABASE', LOC='SEOUL' WHERE DEPTNO=30;

SELECT * FROM DEPT_HW;

COMMIT;

SELECT * FROM DEPT_HW;

-----

--=========12. ������ ���Ǿ� ============--

--12 ���̺� ���� �̸�: EMP_DDL
--  EMPNO: ���� 4�ڸ�    NUMBER(4)
--  ENAME: ���������� 10
--  JOB: ���������� 9
--  MGR: ����4
--  HIREDATE: ��¥
--  SAL: ��ü 7�ڸ� �Ҽ����� 2�ڸ�    NUMBER(7,2)
--  COMM: ��ü 7�ڸ� �Ҽ����� 2�ڸ�
--  DEPTNO: ���� 2�ڸ�

CREATE TABLE EMP_DDL(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB VARCHAR(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7,2),
 COMM NUMBER(7,2),
 DEPTNO NUMBER(2)
 );
 
--13 Ȯ��
 DESC EMP_DDL;

--14 DEPT ���̺�� ������ DEPT_DDL ���̺� ����(���� ����)
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;

--15 Ȯ��
DESC DEPT_DDL;

SELECT * FROM DEPT_DDL;
SELECT * FROM EMP_DDL;

--16 EMP ���̺��� 30�� �μ��� ���븸 �����ͼ� EMP_DDL_30 ���̺� ����
CREATE TABLE EMP_DDL_30
AS SELECT * FROM EMP WHERE DEPTNO=30;

SELECT* FROM EMP_DDL_30;

--17 EMP, DEPT ���̺� �� EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO,
--DNAME,LOC�Ӽ������� EMPDEPT_DDL ���̺��� �����ϵ� ���� �������� ����
CREATE TABLE EMPDEPT_DDL
  AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
    D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
  WHERE 1 <> 1;     --Ư�� ���̺�� �� ������ ���� ���� �����Ͱ� ���� �� ���̺� �����Ϸ��� 
                    --�׻� ������ �Ǵ� ���� ������ �ȴ�. EX)1>10
                    --�������� WHERE���� ���� ������ ������ ������ ��ü�� �����ȴ�.
  
SELECT * FROM EMPDEPT_DDL;

--18 EMP�� ������ EMP_ALTER���̺� ����
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

--19 EMP_ALTER���̺��� HP��� �Ӽ��� ������ 20�ڷ� �߰�(ALTER TABLE__ADD �Ӽ��� ������Ÿ��;)
ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);

--Ȯ��
SELECT * FROM EMP_ALTER;

--20 EMP_ALTER ���̺��� HP�Ӽ��� TEL�� �̸�����(ALTER TABLE __ RENAME __ TO __ )
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

DESC EMP_ALTER;

--Ȯ��
SELECT * FROM EMP_ALTER;

--21 EMP_ALTER ���̺��� EMPNO�Ӽ��� Ÿ���� ���� 5�� ����(ALTER TABLE __MODIFY �Ӽ��� Ÿ��)
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

--22 EMP_ALTER ���̺��� �̸��� EMP_RENAME���� �̸� ����(RENAME ���̺�� TO �����ϰ� ���� �̸�;)
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

--23 EMP_RENAME ���̺� ���� ����� �ڵ� COMMIT(TRUNCATE TABLE ���̺� �̸�;)
TRUNCATE TABLE EMP_RENAME;

DESC EMP_RENAME;

--24 EMP_RENAME ���̺� ����
DROP TABLE EMP_RENAME;

--Ȯ��
DESC EMP_RENAME;

----P324
--Q1.
CREATE TABLE EMP_HW(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB VARCHAR(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7,2),
 COMM NUMBER(7,2),
 DEPTNO NUMBER(2)
 );
 
--Q2.
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);

SELECT * FROM EMP_HW;

--Q3.
ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(30);

SELECT * FROM EMP_HW;

--Q4.
ALTER TABLE EMP_HW RENAME COLUMN BIGO TO REMARK;

SELECT * FROM EMP_HW;

--Q5.
INSERT INTO EMP_HW 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL 
  FROM EMP; 
  
--Q5�� �ٸ� ���
INSERT INTO EMP_HW (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT * FROM EMP; 
  
SELECT * FROM EMP_HW;

--Q6.
DROP TABLE EMP_HW;

----===== 8/24 13. ��ü ���� =====----
--1.��� ���̺��� ����
select * from USER_TABLES;
--1-1. ������ ���� �ִ� ��ü ���� ���캸��
SELECT TABLE_NAME FROM USER_TABLES;

--2. SCOTT �������� ��� ������ ������ ���� ���캸��
SELECT * FROM DICT;
--2-1. ���� ���� ����
SELECT * FROM DICTIONARY;

--3. �� �������� Ȯ�� ������ ���̺�� 
SELECT * FROM ALL_TABLES;

--4. DBA�� �����ϴ� ���̺��(SYS �������� ���� �Ѵ�.)
--SELECT * FROM DBA_TABLES;

--5. �� ������ �ε����� Ȯ��
SELECT * FROM USER_INDEXES;

--6. SYS����, ����� ���� SCOTT�� ���� ���� Ȯ��
--SELECT * FROM DBA_USERS
--WHERE USERNAME = 'SCOTT';

--7. SCOTT ����, INDEX������� �� Ȯ��
SELECT * FROM USER_IND_COLUMNS;

--8.EMP���̺��� �����ؼ� EMP1 ����
create table EMP1
as select * from EMP;

--9. SCOTT EMP���̺��� SAL �Ӽ��� �������� �ε��� ����, �ε�����: IDX_EMP_SAL
CREATE INDEX INDEX_EMP1_SAL
ON EMP1(SAL);

--10. 
SELECT * FROM EMP1;
SELECT SAL FROM EMP1;

--11. ������� INDEX Ȯ��
SELECT * FROM USER_INDEXES;

--12. �ε��� ����
DROP INDEX INDEX_EMP1_SAL;

--13. SYS����, SCOTT���� VIEW ���� ���� �ֱ�
--GRANT CREATE VIEW TO SCOTT;

--14. SCOTT ����, EMP���̺��� �����ȣ, �̸�, ����, �μ���ȣ �̿��ؼ� �λ��ȣ�� 20�� ��� => VW_EMP20���� �� ����
CREATE VIEW VW_EMP20
AS(SELECT EMPNO, ENAME, JOB, DEPTNO 
FROM EMP
WHERE DEPTNO = 20);

--15. �� ���� Ȯ��
SELECT * FROM VW_EMP20;
SELECT * FROM USER_VIEWS;
SELECT TEXT FROM USER_VIEWS;

--16.
SELECT VIEW_NAME, TEXT_LENGTH, TEXT
FROM USER_VIEWS;

--17. �� �����ϱ�
DROP VIEW VW_EMP20;

--18.
SELECT * FROM VW_EMP20;

--19.ROWNUM
SELECT ROWNUM, E.*
FROM EMP E;

--20. ���� �������� �����ؼ� ����ϴµ�, �ٹ�ȣ�� �Բ� ���
SELECT ROWNUM, E.*
FROM EMP E
ORDER BY SAL DESC;
--21. �ذ�å. ����ϱ�˾Ƶα�
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP
ORDER BY SAL DESC)E;

--22. �μ���ȣ ��, ���� �μ��̸� �̸��� �����ؼ� ��ȣ �ο�
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP
ORDER BY DEPTNO,ENAME ASC)E;

--23. �Ի��� �� ����, ��ȣ �ο�
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP
ORDER BY HIREDATE ASC)E;

--24. WITH ���, 23���� �����ϰ�
WITH E AS(SELECT * FROM EMP ORDER BY HIREDATE)
SELECT ROWNUM, E.*
FROM E;

--25. 23�� ���뿹��, �ְ� 3������ ���
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP ORDER BY HIREDATE) E
WHERE ROWNUM <=3;

--26. DEPT ���̺��� ������ �����ؼ� DEPT2����
create table DEPT2
as select * from DEPT
WHERE 1<>1;

--27. SEQUENCE SEQ_DEPT2 ����,������:10, �ʱⰪ:10, �ִ�ġ:90, �ּ�ġ:0, �ݺ�X, ĳ��:2
CREATE SEQUENCE SEQ_DEPT2 
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;

--28. USRE_SEQUENCES���̺� ���� Ȯ��
SELECT * FROM USER_SEQUENCES;

--29 DEPT2���̺� SEQ_DEPT2.NEXTVAL, 'DATABASE', 'SEOUL' �����ϱ�
SELECT * FROM DEPT2;

INSERT INTO DEPT2 (DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT2.NEXTVAL, 'DATABASE', 'SEOUL');
--�� ������ 9�� ����

--30. ���� ������ ��ȣ SEQ_DEPT2.CURRVAL Ȯ��
SELECT SEQ_DEPT2.CURRVAL
FROM DUAL;

--31. ������ CYCLE�� ����
ALTER SEQUENCE SEQ_DEPT2
INCREMENT BY 3
MAXVALUE 99
CYCLE;

--32 INSERT ������ 3�� �߰� �� SELECT * FROM DEPT2; Ȯ��
SELECT * FROM DEPT2;

--33. ������ SEQ_DEPT2 ����
DROP SEQUENCE SEQ_DEPT2;