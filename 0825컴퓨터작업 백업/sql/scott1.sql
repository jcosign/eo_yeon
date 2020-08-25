---5---

--1 EMP ���̺��� ��� �� ����ϱ�
SELECT *
FROM EMP;

--2 �μ� ��ȣ�� 30�� �����͸� ����ϱ�
SELECT *
FROM EMP
WHERE DEPTNO=30;

--3 AND �����ڷ� ���� ���� ���ǽ� ����ϱ�
SELECT *
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALEMAN';

--4 OR �����ڷ� ���� ���� ���ǽ� ����ϱ�
SELECT *
FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

--5 ���� ��� �����ڸ� ����� ��
SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

--5 �μ���ȣ 30�� �ƴѻ��
SELECT *
FROM EMP
WHERE DEPTNO NOT IN(30);

--06 ��� �� �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL >= 3000;

--07 ���ڸ� ��� �� �����ڷ� ���ϱ�
SELECT *
FROM EMP
WHERE ENAME >= 'F';

--08 ���ڿ��� ��� �� �����ڷ� ���ϱ�
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

--09 � �� ������(!=)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL != 3000;

--10� �� ������(<>)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL<> 3000;

--10 ������ 3000�̻��� ��� ���� SAL<=3000
SELECT *
FROM EMP
WHERE SAL >= 3000;

--11� �� ������(^=)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL ^= 3000;

--11 �̸��� FORD�� ���
SELECT *
FROM EMP
WHERE ENAME='FORD';

--12 NOT �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

--12 �̸��� F�̻��� ���
SELECT *
FROM EMP
WHERE ENAME >= 'F';

--13 OR�����ڸ� ����Ͽ� ���� �� ������ �����ϴ� ������ ����ϱ�
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
OR JOB = 'SALESMAN'
OR JOB = 'CLERK';

--13 �̸��� F�� �����ϴ� ���
SELECT *
FROM EMP
WHERE ENAME LIKE 'F%';

--14 IN �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALEMAN', 'CLERK');

--14 �̸��� FORZ������ ���
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

--15 JOB 'MANAGER', 'SALESMAN', 'CLERK' <OR���>
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
--16 15���� IN�̿�
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

--17 15���� �ƴѻ�� OR�̳� AND�̿�
SELECT *
FROM EMP
WHERE NOT(JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK');

--18 15���� �ƴѻ�� IN�̿�
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

--19 ������ 2000���� 3000 ����
SELECT *
FROM EMP
WHERE SAL >= 2000
  AND SAL <= 3000;
  
--20 BETWEEN A AND B
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--20-2
SELECT *
FROM EMP
WHERE NOT SAL BETWEEN 2000 AND 3000;

--21 �̸��� S�� �����ϴ� ���
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

--22 �̸��� AM�� �� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

--23 ����: ���� 12�� + ���ʽ�(COMM)***
SELECT ENAME SAL, COMM, SAL*12+NVL(COMM,0)
FROM EMP;

--24 ���ʽ� �𸣴� ��� (COMM: NULL)
SELECT *
FROM EMP
WHERE COMM IS NULL;

--25 ���ʽ� �ƴ� ���
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--26 �޿��� NULL���� ũ�� COMM�� NULL�� ���
SELECT *
FROM EMP
WHERE SAL>NULL
    AND COMM IS NULL;

--27 ���� ����� �ִ� ��� �����͸� ����ϱ�
SELECT *
FROM EMP
WHERE SAL>NULL
    OR COMM IS NULL;

--28 AND �����ڿ� IS NULL ������ ����ϱ�
--���1
SELECT *
FROM EMP
WHERE DEPTNO = 10
    OR DEPTNO = 20;
    
--28-2 ���2
SELECT *
FROM EMP
WHERE DEPTNO IN(10, 20);

--28-3 ���3
SELECT *
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT *
FROM EMP
WHERE DEPTNO = 20;

--29 OR �����ڿ� IS NULL ������ ����ϱ�
SELECT EMPNO, ENAME, SAL, DEPTNO
   FROM EMP
   WHERE DEPTNO = 10
UNION
  SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
--30 ���� ������(UNION)�� ����Ͽ� ����ϱ�
--(�����޶�, ���ڳ��� ���ڳ��� Ÿ�� ���ƾ� ��°���)
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

--31 ���� ������(UNION)�� ����Ͽ� ����ϱ�
--10�� �μ� ������� �����ȣ, �̸�, ����, �μ���ȣ
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--32 ���� ������(UNION)�� ����Ͽ� ����ϱ�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, DEPTNO, SAL 
FROM EMP
WHERE DEPTNO = 20;

--33 ���� ������(UNION)�� ����Ͽ� ����ϱ�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, DEPTNO, SAL 
FROM EMP
WHERE DEPTNO = 20;

--34 ���� ������(UNION)�� ����Ͽ� ����ϱ�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, DEPTNO, SAL 
FROM EMP
WHERE DEPTNO = 20;

--34 ���� ������(UNION)�� ����Ͽ� ����ϱ� 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--35 ���� ������(UNION ALL)�� ����Ͽ� ����ϱ� 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT SAL,JOB, DEPTNO, SAL 
FROM EMP
WHERE DEPTNO = 20;


--36 ���� ������(MINUS)�� ����Ͽ� ����ϱ�
--(��ü�μ��� �߿��� 10�� �μ��� ���� �ۼ�)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

SELECT *
FROM EMP
ORDER BY DPEFNOL;

--37 ���� ������(INTERSECT)�� ����Ͽ� ����ϱ�
--��ü �μ� �� 10�� �μ��� ������� �����ȣ, �̸�, ����, �μ���ȣ
SELECT *
FROM EMP
INTERSECT
SELECT EMPTNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--38 �̸��� �� ��° ���ڰ� L�� ���
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';

--Q1
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE ENAME LIKE '%S';

--Q2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =30
    AND JOB ='SALESMAN';

--Q3-1
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO IN(20,30)
    AND SAL >2000;
   
    
--Q3-2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
  WHERE DEPTNO =20
UNION 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
  WHERE DEPTNO =30
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
  WHERE SAL >2000;

--Q4
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
  WHERE SAL <2000
UNION
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
  WHERE SAL >3000;
 
--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
WHERE ENAME LIKE '%E%'
INTERSECT
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
WHERE DEPTNO=30
INTERSECT
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000;

--Q6
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
WHERE MGR IS NOT NULL AND JOB='MANAGER' OR JOB='CLERK' AND COMM IS NULL
INTERSECT
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
WHERE ENAME NOT LIKE '_L%';



---6---
--1
--SELECT * FROM DUAL;

--SELECT * SYSDATE -1
--FROM DUAL;

--01 ������ �̸��� �빮�ڷ� �ҹ��ڷ�, ù�ڸ� �빮�ڷ� 
SELECT ENAME, UPPER(ENAME),LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--02 �̸��� scott�� ���
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');

--03 �̸��� scott �� ���
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

--04 �̸��� �̸��� ���̸� ���
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--05 �̸��� �̸��� ����(5�� �̻��� ���)
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME)>=5;

--06 ���� �̸� ���� ���� ����Ʈ ��
SELECT LENGTH('�ֵ�'), LENGTHB('�ֵ�')
FROM DUAL;

--07JOB, ù�ں��� �α���, ��°���ں��� 2����, 5��° ���ں��� ������
SELECT JOB, SUBSTR(JOB, 1,2), SUBSTR(JOB, 3,2), SUBSTR(JOB, 5)
FROM EMP;

--08 SUBSTR�Լ� �ȿ� �ٸ� �Լ�(LENGTH)�Բ� ����ϱ�
SELECT JOB,
      SUBSTR(JOB, -LENGTH(JOB)),
      SUBSTR(JOB, -LENGTH(JOB), 2),
      SUBSTR(JOB, -3)
FROM EMP;

--09 INSTR �Լ��� ���ڿ� �����Ϳ��� Ư�� ���ڿ� ã��
SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3
FROM DUAL;

--10 INSTR �Լ��� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S')>0;

--11 LIKE �����ڷ� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

--12 REPLACE �Լ��� ���ڿ� �ȿ� �ִ� Ư�� ���� �ٲٱ�
SELECT '010-1234-5678' AS REPLACE_BEFORE,
       REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

--13 LAPD, RPAD �Լ� ����Ͽ� ����ϱ�
SELECT 'Oracle',
        LPAD('Oracle', 10, '#') AS LPAD_1,
        RPAD('Oracle', 10, '*') AS LPAD_1,
        LPAD('Oracle', 10) AS LPAD_2,
        RPAD('Oracle', 10) AS LPAD_2
FROM DUAL;

--14 RPAD �Լ��� ����Ͽ� �������� ���ڸ� *ǥ�÷� ����ϱ�
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO,
       RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

--15 �� �� ���̿� �ݷ�(:)�ְ� �����ϱ�
SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP
WHERE ENAME = 'SCOTT';

--16 TRIM �Լ��� ���� �����Ͽ� ����ϱ�
SELECT '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM,
       '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
FROM DUAL;

--17 TRIM �Լ��� ������ ���� _���� �� ����ϱ�
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM,
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
FROM DUAL;

--18 TRIM, LTRIM, RTRIM ����Ͽ� ���ڿ� ����ϱ�
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
       '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2
FROM DUAL;

--19 ROUND �Լ��� ����Ͽ� �ݿø��� ���� ����ϱ�
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

--20 TRUNC �Լ��� ����Ͽ� ���� ����ϱ�
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

--21 CEIL, FLOOR �Լ��� ���� ����ϱ�
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
FROM DUAL;

--22 MOD �Լ��� ����Ͽ� ������ �� ����ϱ�
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
FROM DUAL;

--======================5/26==============================
--1
SELECT * 
FROM EMP;
WHERE SAL >= 100 AND SAL <= 2000; --SAL BETWEEN 1000 AND 2000;

--2 ��� �̸��� ù3�� ���
SELECT SUBSTR(ENAME,1,3) --1���ں��� 3���ڱ���
FROM EMP;

--2-1 1,2,3 �����ϰ� 4,5,6���� ���/??
SELECT SUBSTR(EANME,4,6)
FROM EMP;

--3
SELECT JOB,
      SUBSTR(JOB, -LENGTH(JOB)),
      SUBSTR(JOB, -LENGTH(JOB),2),
      SUBSTR(JOB, -3)             --'-'�� ������ �ڿ�������.
FROM EMP;

--3-1
SELECT JOB,
      SUBSTR(JOB, LENGTH(JOB)),
      SUBSTR(JOB, -LENGTH(JOB)),
      SUBSTR(JOB, -LENGTH(JOB),2),
      SUBSTR(JOB, -3)             
FROM EMP;

--5
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,       --AS�ڿ��� ����(��Ī)
                                                      --L�� ã�ƶ�
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,    --5��° ���� ���ĺ��� L�� ã�ƶ�
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3  --2��° �������Ŀ� L�� 2��° L 
FROM DUAL;

--6 ��� �̸��� S�� ����ִ� �̸�
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S')>0;      --ENAME LIKE '%S%';

--6-1
SELECT INSTR(ENAME, 'S')
FROM EMP;

--7
SELECT '010-1234-5678' AS REPLACE_BEFORE,                 --REPLACE ���
      REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,    --'-'�� �������� �ٲ�
      REPLACE('010-1234-5678', '-') AS REPLACE_2          --'-'�� ������
FROM DUAL;

--8
SELECT 'ORACLE',
        LPAD('ORACLE', 10, '#') AS LPAD_1,
        RPAD('ORACLE', 10, '*') AS RPAD_1,
        LPAD('ORACLE', 10) AS LPAD_2,
        RPAD('ORACLE', 10) AS RPAD_2
  FROM DUAL;

--9 ��� �̸����� ���� 3�ڸ��� �̰� ��ü 10�ڸ��� �������� *�� ä���
SELECT RPAD(SUBSTR(ENAME,1,3),10,'*')
FROM EMP;

--10  971225-���ڿ��� 14ĭ�� ���� �������� *��
SELECT RPAD('971225-',14,'*') AS RPAD_JMNO
FROM DUAL;

--11 CONCAT
SELECT CONCAT('ABC','DEF')
FROM DUAL;

--12 �����ȣ:�����
SELECT COMCAT(COMCAT(ENPNO,':'),ENAME)
FROM EMP;

--12-1 �ٸ����
SELECT EMPNO || ':' || ENAME
FROM EMP;

--13
SELECT '[' || TRIM('- -Oracle- -')||']' AS TRIM,
'[' || TRIM(LEADING FROM'- -Oracle- -')||']' AS TRIM_LEADING,
'[' || TRIM(TRAILING FROM'- -Oracle- -')||']' AS TRIM_TRAILING,
'[' || TRIM('- -Oracle- -')||']' AS TRIM_BOTH
 FROM DUAL;
 
--14
SELECT '[' || TRIM('-Oracle-')||']' AS TRIM,
'[' || LTRIM('-Oracle-')||']' AS LTRIM,
'[' || LTRIM('<-Oracle->','-<')||']' AS LTRIM_2,
'[' || RTRIM('-Oracle-')||']' AS RTRIM,
'[' || RTRIM('<-Oracle->','>-')||']' AS RTRIM_2
 FROM DUAL;

--15 567.567 �ݿø��ؼ� �Ҽ� 1�ڸ��� �ݿø��� ROUND(����(567.567), �Ҽ��� ���ڸ�����(1))
SELECT ROUND(567.567)
FROM DUAL;

--16
SELECT ROUND(1234.5678)AS ROUND,
ROUND(1234.5678,0)AS ROUND_0,   --�ݿø��� �Ҽ����� ����
ROUND(1234.5678,1)AS ROUND_1,   --�Ҽ����� ù��° ����
ROUND(1234.5678,2)AS ROUND_2,
ROUND(1234.5678,-1)AS ROUND_MINUS1,   --���� �����ڸ� �ݿø�
ROUND(1234.5678,-2)AS ROUND_MINUS2    --���� �����ڸ� �ݿø�
FROM DUAL;

--17 ���� 1000�� ������ �ݿø��ؼ� EX)SMITH: 3000��
SELECT ROUND(SAL,3) FROM EMP;
SELECT ENAME ||':'|| ROUND(SAL,3)||'��'
FROM EMP;

--18
SELECT TRUNC(1234.5678)AS TRUNC,    
TRUNC(1234.5678,0)AS TRUNC_0,         
TRUNC(1234.5678,1)AS TRUNC_1,       --�Ҽ� ù����� (������ �ڸ�)  
TRUNC(1234.5678,2)AS TRUNC_2,         
TRUNC(1234.5678,-1)AS TRUNC_MINUS1,   --�����ڸ� �ڸ�
TRUNC(1234.5678,-2)AS TRUNC_MINUS2    
FROM DUAL;

--19 ������ 1000�� ������ �ڸ���(������ ���~)
SELECT TRUNC(SAL,-3) FROM EMP;

--20
SELECT CEIL(3.14),    --CEIL:õ��. �ø�
      FLOOR(3.14),    --�ٴ��̴� ����
      CEIL(-3.14),    --'-'�� �򰥸��� ��ǥ�׸���
      FLOOR(-3.14)
FROM DUAL;

--21
SELECT MOD(15,6),     --MOD�� ������. 
MOD(10,2),
MOD(11,2)
FROM DUAL;

--22 ���� ��¥
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)
FROM DUAL;

--22-1 ���ÿ��� 100�� ���ϸ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3),SYSDATE+100
FROM DUAL;

--22-1 100�� ����
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3),SYSDATE-100
FROM DUAL;

--23 ���� ���� +100
SELECT TO_DATE('1997-08-20','YYYY-MM-DD')+100 --���� ���� ����, ��� ����, 100���ϱ�
FROM DUAL;

--24 �����ȣ, �̸�, �Ի���, �Ի��� 120����(10��)���� ��¥
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,120)AS WORK10YEARS   --AS�� ��Ī.
FROM EMP;

--25
--P152 5-26
--�Ի� 32�� �̸��� ��� ������ ����ϱ�(���� 384���� ���� 32�� �̸��� ����� ���� 450������ �����־���.)
SELECT EMPNO, ENAME, HIREDATE, SYSDATE
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 450)>SYSDATE;

--26
SELECT EMPNO,ENAME,HIREDATE,SYSDATE,
MONTHS_BETWEEN(HIREDATE,SYSDATE)AS MONTH_1,   --�Ի糯���� ���簡 �� ũ�ϱ�. '-'���´�.
MONTHS_BETWEEN(SYSDATE,HIREDATE)AS MONTH_2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))AS MONTH_3
FROM EMP; 

--27 ���� ��¥�� ������ ���� ���� '������'�� ��������?, �׸��� �� �� ����?
SELECT SYSDATE,NEXT_DAY(SYSDATE,'��'), LAST_DAY(SYSDATE)
FROM DUAL;

--27-1 �׷� ȭ������?
SELECT SYSDATE,NEXT_DAY(SYSDATE,'ȭ'), LAST_DAY(SYSDATE)
FROM DUAL;

--28--P155����
SELECT SYSDATE,
ROUND(SYSDATE, 'CC')AS FORMAT_CC,
ROUND(SYSDATE, 'YYYY')AS FORMAT_YYYY,
ROUND(SYSDATE, 'Q')AS FORMAT_Q,
ROUND(SYSDATE, 'DDD'AS FORMAT_DDD,
ROUND(SYSDATE, 'HH')AS FORMAT_HH
FROM DUAL;

--29 SCOTT��� ����� �����ȣ, �̸�, �����ȣ+500 ������~
SELECT EMPNO, ENAME, EMPNO+500
FROM EMP
WHERE ENAME = 'SCOTT';

--30 ABCD��� ���ڿ��� �����ȣ �տ� �ٿ��� ���, �����ȣ ���
SELECT 'ABCD' + EMPNO, EMPNO
FROM EMP
WHERE ENAME = 'SCOTT';

--31 ������ ��¥, �ú��� ���
SELECT SYSDATE, 
TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM DUAL;

--32 ������ ��¥�� ��, ����, �� ���
SELECT SYSDATE,
  TO_CHAR(SYSDATE,'MM')AS MM    --���� ��¥ �� ���� ������ ���� ��.
FROM DUAL;

--32-1 ����
SELECT SYSDATE,
  TO_CHAR(SYSDATE,'MM')AS MM,
  TO_CHAR(SYSDATE,'MON')AS MON,
  TO_CHAR(SYSDATE,'MONTH')AS MONTH, 
  TO_CHAR(SYSDATE,'DD')AS DD, 
  TO_CHAR(SYSDATE,'DY')AS DY, 
  TO_CHAR(SYSDATE,'DAY')AS DAY 
FROM DUAL;

--33 
SELECT SYSDATE,
TO_CHAR(SYSDATE,'MM')AS MM,
TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE = KOREAN')AS K,
TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE = JAPANESE')AS J,
TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE = ENGLISH')AS E,
TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE = KOREAN')AS K, 
TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE = JAPANESE')AS J, 
TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE = ENGLISH')AS E 
FROM DUAL;

--34
SELECT SYSDATE,
TO_CHAR(SYSDATE,'MM')AS MM,
TO_CHAR(SYSDATE,'DD')AS DD,
TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE = KOREAN')AS K,
TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE = JAPANESE')AS J,
TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE = ENGLISH')AS E,
TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE = KOREAN')AS K, 
TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE = JAPANESE')AS J, 
TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE = ENGLISH')AS E 
FROM DUAL;

--35
SELECT SYSDATE,
TO_CHAR(SYSDATE,'HH24:MI:SS')AS HH24MMIS,
TO_CHAR(SYSDATE,'HH24:MI:SS AM')AS HH24MMIS_AM,
TO_CHAR(SYSDATE,'HH24:MI:SS P.M.')AS HH24MMIS_PM
FROM DUAL;

--36
--6-38 ���� ���� ���� ������ ����Ͽ� �޿� ����ϱ�
SELECT SAL,
TO_CHAR(SAL,'$999,999')AS SAL_$,
TO_CHAR(SAL,'L999,999')AS SAL_L,
TO_CHAR(SAL,'999,999.00')AS SAL_1,
TO_CHAR(SAL,'000,999,999.00')AS SAL_2,
TO_CHAR(SAL,'000999999.99')AS SAL_3,
TO_CHAR(SAL,'999,999,00')AS SAL_4
FROM EMP;

--37
--6-39 ���� �����Ϳ� ���� �����͸� �����Ͽ� ����ϱ�
SELECT 1300 - '1500',
      '1300' + 1500
FROM DUAL;

--38    ','�� ���ڷ� �ν��� �� ���� ����.
--6-40 ���� �����ͳ��� �����Ͽ� ����ϱ�
SELECT '1,300' - '1,500'
FROM DUAL;

--39
--6-41 TO_NUMBER �Լ��� �����Ͽ� ����ϱ�
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999')
FROM DUAL;

--40
--6-42 TO_DATE �Լ��� ���� �����͸� ��¥ ������ ��ȯ�ϱ�
SELECT TO_DATE('2018-07-14','YYYY-MM-DD')AS TODATE1,
TO_DATE('20180714','YYYY-MM-DD')AS TODATE2
FROM DUAL;

--41 �Ի����� 1981�� 6�� 1�� ���Ŀ� �Ի��� ����� ����
SELECT *
FROM EMP
WHERE HIREDATE>='81-06-01';

--41-1 41ó�� �ϸ� ������� ������ �ƴ� ���α׷����� �����߻� ���ɼ��� �ִ�.
--6-43 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ����ϱ�
SELECT *
FROM EMP
WHERE HIREDATE >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

--42
--6-44 ���� ���� �������� ��¥ ������ ����ϱ�
SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49,
TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49,
TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50,
TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50,
TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51,
TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
FROM DUAL;

--43//???���� NULL�� ������?
--6-45 NVL �Լ��� ����Ͽ� ����ϱ�
SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,
  NVL(COMM, 0),       --NVL: NULL �� �� 0���� ���´�.
  SAL+NVL(COMM, 0)
FROM EMP;

--44 COMM�� ������ X�� ��� ������ O���� ���. �������//??
--6-46 NVL2 �Լ��� ����Ͽ� ����ϱ�
SELECT EMPNO, ENAME, COMM, NVL2(COMM,'O','X'),
NVL2(COMM,SAL*12+COMM,SAL*12)AS ANNSAL
FROM EMP;


===============================
----------6/2-------
--01 ������ 2000���� 3000
SELECT ENAME
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--01
SELECT SAL,COMM,SAL*12+COMM AS "����"
FROM EMP;

---�������� SCOTT2��.