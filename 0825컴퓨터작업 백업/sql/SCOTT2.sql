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
 
 ==================6/2 �պκ��� scott1��.
 --01 ������ 2000���� 3000
SELECT ENAME
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--02-1
SELECT SAL,COMM,SAL*12+NVL(COMM,0) AS "����"
FROM EMP;

--02-2
SELECT SAL,COMM,NVL2(COMM,SAL*12+COMM,SAL*12) AS "����"
FROM EMP;

--03
SELECT EMPNO,ENAME,JOB,SAL,
DECODE(JOB,
          'MANEGER',SAL*1.1,
          'SALESMAN',SAL*1.05,
          'ANALYST',SAL,
          SAL*1.03)AS UPSAL
FROM EMP;

--04
SELECT EMPNO,ENAME,JOB,SAL
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL*1.03
END AS UPSAL
FROM EMP;
--JOB�� ���� WHEN�� �޶���

--05
SELECT EMPNO,ENAME, COMM,
CASE
WHEN COMM IS NULL THEN '�ش���� ����'
WHEN COMM =0 THEN '�������'
WHEN COMM >0 THEN '����:'||COMM
END AS COMM_TEXT
FROM EMP;

--5-2 5-1�� �Ⱥ��� �Ẹ��
SELECT EMPNO,ENAME,COMM
CASE
WHEN COMM IS NULL THEN '�ش���� ����'
WHEN COMM =0 THEN '�������'
WHEN COMM>0 THEN ||'����: '
END AS 
FROM EMP;


--6�� ��������
--Q1
--SUSTR(�Ӽ� �Ǵ� ���ڿ�,����,����)-���ڿ� �Ϻκ� ����
--RPAD(�Ӽ� �Ǵ� ���ڿ�,��ü �ڸ���,'ä�﹮��')-ä���
--LENGTH()-����

SELECT EMPNO,
       RPAD(SUBSTR(EMPNO,1,2),4,'*')AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)=5;

--Q2
SELECT EMPNO,ENAME,SAL,
       TRUNC(SAL/21.5,2)AS DAY_PAY,
      ROUND(SAL/21.5/8,1)AS TIME_PAY
FROM EMP;

--Q3
SELECT EMPNO,ENAME,HIREDATE,
  TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'��'),'YYYY-MM-DD'),
  NVL(TO_CHAR(COMM),'N/A')AS COMM
FROM EMP;

--Q4
--SUBSTR()
SELECT EMPNO,ENAME,MGR,
  CASE
  WHEN MGR IS NULL THEN '0000'
  WHEN SUBSTR(MGR,1,2)='78' THEN'8888'
  WHEN SUBSTR(MGR,1,2)='77'THEN'7777'
  WHEN SUBSTR(MGR,1,2)='76'THEN'6666'
  WHEN SUBSTR(MGR,1,2)='75'THEN'5555'
  ELSE TO_CHAR(MGR)
 END AS CHG_MGR
FROM EMP;

------------------7��-------------------
--7-01 �� �Լ� �̿��Ͽ� �޿� �հ�, ��, �ִ�, �ּ�, ��� ���ϱ�
SELECT SUM(SAL),COUNT(SAL),MAX(SAL),MIN(SAL),AVG(SAL)
FROM EMP;

--7-02 ����� ���ϱ�
SELECT COUNT(*)
FROM EMP;

--7-02-2 ����� ���ϱ�

SELECT COUNT(ENAME)
FROM EMP;

--7-02-3 �߰����� �޴� ��
SELECT COUNT(COMM)
FROM EMP;

--7-03 �μ� ���
SELECT * FROM DEPT;

--7-03-2  �μ��� ��
SELECT COUNT(*)
FROM DEPT;

--7-04���ʽ� ���� ����� ��
SELECT COUNT(*)
FROM EMP
WHERE COMM IS NULL;

--7-05 10�� �μ��� ��� ��
--()�ȿ� DEPTNO���� *�� ���� ������
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO=10;

--7-6 �� �μ��� �����
SELECT DEPTNO,COUNT(*)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--ORDER BY�� ���� ��������. DEPTNO�� �����Ѵ�.

--7-7 �� �μ��� �ְ� ����
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--7-8 �� �μ��� ����Ⱓ �ٹ��� ����� �Ի���
SELECT DEPTNO, MIN(HIREDATE)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--����Ⱓ�̴� MIN�� ����Ѵ�.

--7-9 �μ���ȣ ���
SELECT DEPTNO
FROM EMP;

--7-10 �μ���ȣ ���(�ߺ�����)
SELECT DISTINCT DEPTNO
FROM EMP;
--�ߺ� ����

--7-11 �޿� �հ�
SELECT SUM(SAL),SUM(ALL SAL),SUM(DISTINCT SAL)
FROM EMP;

--7-12 �Ի��� ��� ��, �ߺ�����
SELECT DISTINCT HIREDATE
FROM EMP;

--7-13 30�� �μ��� �����
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO=30;

--7-14 10�� �μ��� �ְ� ���޾�
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO=10;

--7-15 10�� �μ��� ���� ���޾�
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO=10;

--7-16 20�� �μ��� �ֱ� �Ի����� �Ի���
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO=20;

--7-17 20�� �μ��� �ְ� ��Ⱓ �ٹ��� ����� �Ի���
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO=20;

--7-18 30�� �μ��� ��� ����
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO=30;

--7-19 30�� �μ��� ��� ����(��, ������ �ߺ��� ���� �� ���)
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO=30;

--7-20 �� �μ��� �޿� ���
SELECT ROUND(AVG(SAL)), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL 
SELECT ROUND(AVG(SAL)), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT ROUND(AVG(SAL)), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--7-21 �μ���ȣ, ���޺� ��� ����
SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-22 �μ��� ���޺��� ��� ������ 2000�̻��� ������� �μ���ȣ, ����, ��� ���� ������ ���
SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-23 7-22�� ���� ����
SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
--WHERE���� �׷��Լ��� �� �� ����. ���Լ��� ���δ�.
--���� �׷��Լ��� WHERE���� �ƴ� HAVING

--7-24 ������ 3000������ ������� ������� �μ�, ���޺� ��պ����� 2000�̻�
SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-25 �μ�, ���޺� �����, �ִ� ����, ���� �հ�, ��� ���� ���
SELECT DEPTNO,JOB,COUNT(*),MAX(SAL),SUM(SAL),AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY DEPTNO, JOB;

--7-26 �μ�, ���޺� �����, �ִ� ����, ���� �հ�, ��� ���� ���
SELECT DEPTNO,JOB,COUNT(*),MAX(SAL),SUM(SAL),AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO, JOB;

--7-27 �μ�, ���޺� ����� ���
SELECT DEPTNO,JOB,COUNT(*)
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY DEPTNO, JOB;

--7-28 �μ�, ���޺� ����� ���
SELECT DEPTNO,JOB,COUNT(*)
FROM EMP
GROUP BY JOB,ROLLUP(DEPTNO);

--7-29 �μ�, ���޺� ����� ���
SELECT DEPTNO,JOB,COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB)
ORDER BY DEPTNO, JOB;

--7-30 �μ���ȣ, ���޺� ����� ���
SELECT DEPTNO,JOB,COUNT(*)
FROM EMP
GROUP BY ROLLUP(JOB, DEPTNO);

--7-31 �μ���ȣ, ���޺� ����� ���
SELECT DEPTNO,JOB,COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB)
ORDER BY DEPTNO,JOB;

--7-32 cube �Լ��� ������ �׷�ȭ
SELECT DEPTNO,JOB,COUNT(*),MAX(SAL),SUM(SAL),AVG(SAL),
GROUPING(DEPTNO),
GROUPING(JOB)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB;

--7-33 �μ���ȣ�� ���޺� �����, �ִ� ����, ������ ��, ��տ����� cube �Լ��� ������ �׷�ȭ
SELECT DECODE(GROUPING(DEPTNO),1,'ALL_DEPT',DEPTNO)AS DEPTNO,
DECODE(GROUPING(JOB),1,'ALL_JOB',JOB)AS JOB,
COUNT(*), MAX(SAL),SUM(SAL),AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB;
--GROUPING �� ���� 0(�ƴϸ� 1)

--===========================6/9======

--1 ���� ����-COUNT()
SELECT COUNT(*)
FROM EMP;

--2 �����, ������ �հ� ���ϱ�
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--2(1)
--SELECT ENAME, SUM(SAL)
--FROM EMP;     �� �ȵ�

--7-1 SUM �Լ��� ����Ͽ� �޿� �հ� ����ϱ�
SELECT SUM(SAL)
FROM EMP;

--7-2 SUM �Լ��� ����Ͽ� ��� �̸��� �޿� �հ� ����ϱ�
SELECT ENAME, SUM(SAL)
FROM EMP;

--7-3 �߰� ���� �հ� ���ϱ�
SELECT SUM(COMM)
FROM EMP;

--7-4 �޿� �հ� ���ϱ�(DISTINCT, ALL���)
SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
FROM EMP;

--7-5 EMP ���̺��� ������ ���� ����ϱ�
SELECT COUNT(*)
FROM EMP;

--3 �μ���ȣ ���
SELECT DEPTNO
FROM EMP;

--4 ������� ���� �μ��� ��
SELECT COUNT(DISTINCT DEPTNO)
FROM EMP;

--5 DISTINT:�ߺ�����. �ߺ��� ������ �հ� ���ϱ�
SELECT COUNT(DISTINCT SAL),
SUM(ALL SAL),
SUM(SAL)
FROM EMP;

--6 ������� ����
SELECT *
FROM EMP;

--7 ������� ��(���� ��)
SELECT COUNT(*)
FROM EMP;

--8(7-6) 30�� �μ��� ��� ��
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

--9(7-7)COUNT �Լ� ����� �޿� ���� ���ϱ�(ALL�� �ϳ�����.)
SELECT COUNT(DISTINCT SAL),
       COUNT(ALL SAL),
       COUNT(SAL)
FROM EMP;

--10(7-8) ���ʽ��� ������ ������� ��
SELECT COUNT(COMM)
FROM EMP;

--11 ���ʽ� �޴� ��� ��
SELECT COUNT(COMM)
FROM EMP
WHERE COMM >0;

--12(7-9) ���ʽ��� NULL�� �ƴ� ���, �� ������ ����� ��
--COMM�� * �� �� ��� ����
SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

--13(7-10) �ְ� ���޾�
SELECT MAX(SAL)
FROM EMP;

--14(7-10) 10�� �μ��� �ְ� ���޾�(MAX)
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

--15(7-11) 10�� �μ��� ���� ���޾�(MIN)
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

--16 10�� �μ��� ��� ���޾�(AVG)
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 10;

--17 �ֱ� �Ի���
SELECT MAX(HIREDATE)
FROM EMP;

--18 ���� ���� �Ի��� ����� �Ի���
SELECT MIN(HIREDATE)
FROM EMP;

--19(7-13) 20�� �μ����� �ְ����� �Ի���
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--7-12 20�� �μ����� ������ �Ի���
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--20(7-14) 30�� �μ��� ��� ���޾�
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;

--7-15 DISTINCT�� �ߺ��� ������ �޿� ���� ��� �޿� ���ϱ�
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

--21(7-16) 10���μ�,20�� �μ�, 30�� �μ��� ��� ���޾� ���ϱ�(UNION ALL)
SELECT AVG(SAL),'10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL),'20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL),'30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--21-1 21�� ������ �Ҽ��� �ڸ��� �̸��� AVG_SAL�� �ϱ�
SELECT TRUNC(AVG(SAL)) AS AVG_SAL,'10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT TRUNC(AVG(SAL)) AS AVG_SAL,'20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT TRUNC(AVG(SAL)) AS AVG_SAL,'30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--7-17 GROUP BY�� ����Ͽ� ��� �޿� ����ϱ�
SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

--22(7-18) �μ� �� ���޺� ��� ����
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-19 GROUP BY ���� ���� ���� SELECT���� �������� ���
SELECT ENAME, DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

--23(7-20) �μ� �� ���޺� ��� ������ ���ϴ� �� ���� ����� 2000�̻��� ������
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP 
GROUP BY DEPTNO,JOB
HAVING AVG(SAL)>=2000
ORDER BY DEPTNO, JOB;
--HAVING ��� WHERE ���� �ȵ�. ��Ƽ� 2000�̻��� ���

--23-1(7-21) �ٸ� ���(WHERE������ �̷���). 2000�̻��� ���� ���(�ǹ̿� ��ġ �� �ٸ�)
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP 
WHERE SAL>=2000
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO, JOB;

--24(7-23) ������ 3000������ ����� ��� �μ���, ���޺� ��� ������ 2000�̻�
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO,JOB;

--25(7-24) �μ��� ���޺�, �����, �ִ� ����, ���޾� �հ�, ��� ���� �μ��� ���޺� ����
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--26(7-25) 25���� ���� + ROLLUP(DEPTNO,JOB)���
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

--27(7-26) CUBE
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--27-1 27���� ���� �ݿø��ϱ�
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), ROUND(AVG(SAL))
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--28 ROLLUP�� JOB�� ���ؼ��� �μ�, ���޺� �ο���
--7-27 DEPTNO�� ���� �׷�ȭ�� �� ROLLUP�Լ��� JOB �����ϱ�
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);

--29(7-28) ������ �ٲ� JOB�� ���� �׷�ȭ �� �� ROLLUP�Լ��� DEPTNO �����ϱ�
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);

--30(7-29) GROUPING SETS �Լ��� ����Ͽ� ������ �׷����� ���� ����ϱ�
--������ ��� ���� ��׷����� ó���ؼ� ���
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--31 GROUPING �Լ�
--7-30 DEPTNO,JOB���� �׷�ȭ ��� ���θ� GROUPING �Լ��� Ȯ���ϱ�
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
  GROUPING(DEPTNO),
  GROUPING(JOB)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--32(7-31) DECODE������ GROUPING�Լ��� �����Ͽ� ��� ǥ���ϱ�
SELECT DECODE(GROUPING(DEPTNO),1,'ALL_DEPT',DEPTNO)AS DEPTNO,
      DECODE(GROUPING(JOB),1,'ALL_JOB',JOB)AS JOB,
      COUNT(*),MAX(SAL),SUM(SAL), AVG(SAL)
      FROM EMP
      GROUP BY CUBE(DEPTNO,JOB)
      ORDER BY DEPTNO, JOB;
      
--33 (7-32) DEPTNO, JOB�� �Բ� ����� GROUPING_ID �Լ� ����ϱ�
SELECT DEPTNO, JOB, COUNT(*),SUM(SAL),
  GROUPING(DEPTNO),
  GROUPING(JOB),
  GROUPING_ID(DEPTNO,JOB)
  FROM EMP
  GROUP BY CUBE(DEPTNO,JOB)
  ORDER BY DEPTNO,JOB;
  
--7-33 GROUP BY���� �׷�ȭ �Ͽ� �μ� ��ȣ�� ��� �̸� ����ϱ�
SELECT DEPTNO,ENAME
  FROM EMP
GROUP BY DEPTNO,ENAME;

--34(7-34) �μ��� ��� �̸��� ������ �����Ͽ� ����ϱ�
SELECT DEPTNO,  
    LISTAGG(ENAME,',')
    WITHIN GROUP(ORDER BY SAL DESC)AS ENAMES
    FROM EMP
  GROUP BY DEPTNO;
  
--34-2 ���� ���� ��(ASC)(���� ���� ���� DESC)
 SELECT DEPTNO,  
    LISTAGG(ENAME,',')
    WITHIN GROUP(ORDER BY HIREDATE ASC)AS ENAMES
    FROM EMP
  GROUP BY DEPTNO;

--35(7-35) �μ���,��å���� �׷�ȭ�Ͽ� �ְ� �޿� �����͸� ����ϱ�
SELECT DEPTNO, JOB, MAX(SAL)
  FROM EMP
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
  
--36(7-36) PIVOT �Լ��� �Ͽ��Ͽ� ��å��,�μ��� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
FROM(SELECT DEPTNO,JOB,SAL FROM EMP)
PIVOT(MAX(SAL) FOR DEPTNO IN (10,20,30))
ORDER BY JOB;

--36-1 MIN
SELECT *
FROM(SELECT DEPTNO,JOB,SAL FROM EMP)
PIVOT(MIN(SAL) FOR DEPTNO IN (10,20,30))
ORDER BY JOB;

--36-2 AVG
SELECT *
FROM(SELECT DEPTNO,JOB,SAL FROM EMP)
PIVOT(AVG(SAL) FOR DEPTNO IN (10,20,30))
ORDER BY JOB;

--36-3 SUM
SELECT *
FROM(SELECT DEPTNO,JOB,SAL FROM EMP)
PIVOT(SUM(SAL) FOR DEPTNO IN (10,20,30))
ORDER BY JOB;

--37(7-37) PIVOT �Լ��� ����Ͽ� �μ���, ��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL FROM EMP)
PIVOT(MAX(SAL)
  FOR JOB IN ('CLERK' AS CLERK,
              'SALESMAN' AS SALESMAN,
              'PRESIDENT' AS PRESIDENT,
              'MANAGER' AS MANAGER,
              'ANALYST' AS ANALYST)
              )
              ORDER BY DEPTNO;
              
--37-1 MIN
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL FROM EMP)
PIVOT(MIN(SAL)
  FOR JOB IN ('CLERK' AS CLERK,
              'SALESMAN' AS SALESMAN,
              'PRESIDENT' AS PRESIDENT,
              'MANAGER' AS MANAGER,
              'ANALYST' AS ANALYST)
              )
              ORDER BY DEPTNO;
              
--37-2 AVG
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL FROM EMP)
PIVOT(AVG(SAL)
  FOR JOB IN ('CLERK' AS CLERK,
              'SALESMAN' AS SALESMAN,
              'PRESIDENT' AS PRESIDENT,
              'MANAGER' AS MANAGER,
              'ANALYST' AS ANALYST)
              )
              ORDER BY DEPTNO;
              
--37-3 SUM
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL FROM EMP)
PIVOT(SUM(SAL)
  FOR JOB IN ('CLERK' AS CLERK,
              'SALESMAN' AS SALESMAN,
              'PRESIDENT' AS PRESIDENT,
              'MANAGER' AS MANAGER,
              'ANALYST' AS ANALYST)
              )
              ORDER BY DEPTNO;
              
--38(7-38) DECODE���� Ȱ���Ͽ� PIVOT�Լ��� ���� ��� �����ϱ�
SELECT DEPTNO,
  MAX(DECODE(JOB,'CELRK',SAL)) AS "CELRK",
  MAX(DECODE(JOB,'SALESMAN',SAL)) AS "SALESMAN", 
  MAX(DECODE(JOB,'PRESIDENT',SAL)) AS "PRESIDENT",
  MAX(DECODE(JOB,'MANAGER',SAL)) AS "MANAGER",
  MAX(DECODE(JOB,'ANALYST',SAL)) AS "ANALYST"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--39(7-39) UNPIVOT �Լ��� ����Ͽ� ���� ���е� �׷��� ������ ����ϱ�
SELECT *
FROM(SELECT DEPTNO,
  MAX(DECODE(JOB,'CLERK',SAL)) AS "CLERK",
  MAX(DECODE(JOB,'SALESMAN',SAL)) AS "SALESMAN", 
  MAX(DECODE(JOB,'PRESIDENT',SAL)) AS "PRESIDENT",
  MAX(DECODE(JOB,'MANAGER',SAL)) AS "MANAGER",
  MAX(DECODE(JOB,'ANALYST',SAL)) AS "ANALYST"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO)
UNPIVOT(
SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
ORDER BY DEPTNO, JOB;

--Q1
SELECT DEPTNO,
  TRUNC(AVG(SAL))AS AVG_SAL,
  MAX(SAL)AS MAX_SAL,
  MIN(SAL)AS MIN_SAL,
  COUNT(*)AS CNT
FROM EMP
GROUP BY DEPTNO;

--Q2
SELECT JOB,COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

--Q3
SELECT TO_CHAR(HIREDATE,'YYYY')AS HIRE_YEAR,
DEPTNO,
COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;

--Q4
SELECT NVL2(COMM,'O','X')AS EXIST_COMM,
      COUNT(*) AS CNT
      FROM EMP
      GROUP BY NVL2(COMM,'O','X');

--Q5
SELECT DEPTNO,
  TO_CHAR(HIREDATE, 'YYYY')AS HIRE_YEAR,
  COUNT(*) AS CNT,
  MAX(SAL) AS MAX_SAL,
  SUM(SAL) AS SUM_SAL,
  AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));


-----------====6/16====----------------
--8 ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����

--1 ��� ����� ����
SELECT ENAME,SAL
FROM EMP;

--2
SELECT *
FROM EMP;
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--
--EMPNO:�����ȣ, ENAME:�����, JOB:����, MGR:�����ڹ�ȣ
--HIREDATE:�Ի���, SAL:����, COMM:���ʽ�, DEPTNO:�μ���ȣ
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--

--2-1 �̸��� �μ���ȣ
SELECT ENAME, DEPTNO
FROM EMP;

--3 10�� �μ� ������ �μ���ȣ
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--4 20��,30�� �μ��� �����,�μ���ȣ,����
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;

--4-1 �ٸ� ���
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30);

--5 �Ի����� 1981���� ������� ������ �Ի���, ������ ��ȣ
SELECT ENAME, HIREDATE, MGR
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY') = '1981';

--5-1 �ٸ����1
SELECT ENAME, HIREDATE, MGR
FROM EMP
WHERE HIREDATE LIKE '81%';

--5-2 �ٸ����2
SELECT ENAME, HIREDATE, MGR
FROM EMP
WHERE HIREDATE >= '1981/01/01' AND HIREDATE <= '1981/12/31';

--6 DEPT ���̺� Ȯ��
SELECT *
FROM DEPT;
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--
--DEPTNO:�μ���ȣ, DNAME:�μ���, LOC:�μ���ġ
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--

--7 SALGRADE ���̺�
SELECT * FROM SALGRADE;
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--
--GRADE:���, LOSAL:������ �޿�, HISAL:�ְ� �޿�
--==%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%==--

--8 20�� �μ��� �μ���ȣ, �μ���
SELECT *
FROM DEPT
WHERE DEPTNO = 20;

--9 ����� 1��� �� ������ �޿��� �ְ� �޿�
SELECT * 
FROM SALGRADE
WHERE GRADE = 1;

--10 ������ 3000���� ������� ������ �޿�
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 3000 AND SAL < 4000;

--11 �μ����� SALES�� �μ��� ��ġ(LOC)���
SELECT LOC 
FROM DEPT
WHERE DNAME = 'SALES';

--12 10�� �μ��� ��ġ
SELECT LOC
FROM DEPT
WHERE DEPTNO = 10;

--13 10�� �μ��� ������ �μ���ȣ
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--14 10�� �μ��� ������ �μ���ȣ, �μ���
-- ���̺��� �ٸ��� 2�� �ʿ��ϴ�.
--"column ambiguously defined" DEPTNO�� �� ���̺� �ִ�. �Ҽ��� ��������Ѵ�.
-- EMP.DEPTNOó��
SELECT ENAME, EMP.DEPTNO, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO = 10;
--AND DEPT.DEPTNO = 10;�ᵵ �ȴ�.

--15 ����� --14��
SELECT COUNT(*)
FROM EMP;

--16 �μ��� --4��
SELECT COUNT(*) 
FROM DEPT;

--17 10�� �μ��� ���� �����ȣ, ����, �μ���, �μ���ġ
SELECT EMP.DEPTNO, SAL, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO = 10;

--18-1 18�� �� ����
SELECT *
FROM SALGRADE;
--GRADE, LOSAL, HISAL

--18 �����ȣ, �����, ����, ���
SELECT DEPTNO, ENAME, SAL, GRADE
FROM EMP, SALGRADE
WHERE LOSAL <= SAL AND SAL <= HISAL; 

--19 �����ȣ, �����, �μ���ȣ, �μ���, ���
-- SELECT�� EMP.DEPTNO�� DEPT.DEPTNO�ᵵ ��� ����. �� �� �ش�Ǳ� ������.
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME, GRADE
FROM EMP, DEPT, SALGRADE
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND SALGRADE.LOSAL <= EMP.SAL
AND EMP.SAL <= SALGRADE.HISAL;

--20 ����� ������ �� ����� ���� �μ������� �����ȣ ������ �˻�
--SELECT E.*, D.*��� �ᵵ �����ϳ�, �׷��ʿ� ����
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY E.EMPNO;

--21 �����ȣ, �����, �μ���ȣ, �μ���, ��ġ�� �μ���ȣ, �����ȣ ������ �˻�
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY DEPTNO, EMP.EMPNO;

--22 �޿��� 3000�̻��� ������� �����ȣ, �����, ����, �μ���ȣ, �μ��� ��ġ
SELECT EMPNO, ENAME, EMP.SAL, EMP.DEPTNO, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND SAL >= 3000;

--23 ��� ������� ������ �޿� �������(SALGRADE�� ��� ����)�� ���
SELECT *
FROM EMP, SALGRADE
WHERE SALGRADE.LOSAL<=EMP.SAL AND EMP.SAL<=SALGRADE.HISAL;

--24 ������� �����ȣ, �����, �����ڹ�ȣ
SELECT EMPNO, ENAME, MGR
FROM EMP;

--25 ������� �����ȣ, �����, �����ڹ�ȣ, �������̸�
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS "�����ڸ�"
FROM EMP E1, EMP E2
WHERE E1.MGR=E2.EMPNO;

--26 �����ȣ, �̸�, ������ ��ȣ, �������� �����ȣ(MGR_MPTNO), �������� �̸�(MGR_ENAME)��
--�����ȣ ������ ��� ��, �����ڰ� ���� ����� ������!
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_MPTNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);
--���� ����. �����ʿ� ¦�� ������ (+)�ؼ� ¦�� �����ش�.(LEFT OUTER JOIN)

--27
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
      E2.EMPNO AS MGR_EMPNO,
      E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;
--������ ����. ¦�� ������ NULL�� ä���ֱ�

--28 �����ȣ, �����, ����, �����ڹ�ȣ, �Ի���, �޿�, ���ʽ�, �μ���ȣ, �μ���, ��ġ�� 
--�μ���ȣ, �����ȣ ������ ����(FROM EMP E NATURAL JOIN DEPT D)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

--29 �����ȣ, �����, ����, �����ڹ�ȣ, �Ի���, �޿�, ���ʽ�, �μ���ȣ, �μ���, ��ġ�� 
--�μ���ȣ, �����ȣ ������ ����(FROM EMP E JOIN DEPT D USING(DEPTNO))
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;

--30 FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;


--Q1 �޿�(SAL)�� 2000�ʰ��� ������� �μ� ����, ��������� �����ʰ� ���� ����غ�����. SQL-99 ���� ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > 2000;
ORDER BY DEPTNO, EMP.EMPNO;

-- SQL-99���
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
  FROM EMP E NATURAL JOIN DEPT D
 WHERE E.SAL > 2000;

--Q2 �����ʰ� ���� �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ������� ����غ�����. SQL-99 ���� ���
SELECT D.DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

--SQL-99 ���
SELECT DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E JOIN DEPT D USING (DEPTNO)
GROUP BY DEPTNO, D.DNAME;

--Q3 ��� �μ� ������ ��� ������ �����ʰ� ���� �μ���ȣ, ��� �̸� ������ �����Ͽ� ����غ�����. SQL-99 ���� ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

--SQL-99 ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

--Q4 ������ ���� ��� �μ� ����, ��� ����, �޿� ��� ����, �� ����� ���� ����� ������ 
--�μ� ��ȣ, ��� ��ȣ ������ �����Ͽ� ����� ������. SQL-99 ���� ���
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E, DEPT D, SALGRADE S, EMP E2
 WHERE E.DEPTNO(+) = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
   AND E.MGR = E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO; 

--SQL-99���
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E RIGHT OUTER JOIN DEPT D
                ON (E.DEPTNO = D.DEPTNO)
              LEFT OUTER JOIN SALGRADE S
                ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
              LEFT OUTER JOIN EMP E2
                ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO; 


----=========6/23===========----

--1. EMP,DEPT ���̺� ���� ����(���) �����ֱ�
SELECT *
FROM EMP,DEPT;
--�ߺ��� ���´�.(56)

--2 1�� �ߺ� �ȳ�������?
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;
--(14)

--3 2�� �μ���ȣ ������
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
ORDER BY D.DEPTNO;
--ORDER BY DEPTNO�� ���̸� ������ ����. ��� �Ҽ����� �����ֱ�

--4 3�� ������ �����ȣ,�����, �μ���
SELECT EMPNO, ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
ORDER BY E.DEPTNO;

--5 �����, ����, ���(SALGRADE.GRADE)
SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--6 5�� �����ϳ�, �޿��� 2000~3000 ����
SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
  AND E.SAL BETWEEN 2000 AND 3000;
  
--7 �����, �μ���ġ, �޿������ �μ� �� ��޼�
SELECT E.ENAME, D.LOC, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.DEPTNO, S.GRADE;

--8 �����ȣ, �����, �����ڹ�ȣ
SELECT EMPNO, ENAME, MGR
FROM EMP;

--9 8���� �����ڸ�(�����ȣ, �����, �����ڹ�ȣ, �����ڸ�)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--10 9���� �μ������ �߰�(�����ȣ, �����, �����ڹ�ȣ, �����ڸ�, �μ���)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�, D.DNAME
FROM EMP E1, EMP E2, DEPT D
WHERE E1.MGR = E2.EMPNO
AND E1.DEPTNO = D.DEPTNO;

--11 9������(�����ȣ, �����, �����ڹ�ȣ, �����ڸ�)�� �����ڰ� ������ �� ������.
--�����غ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);
--E1�� ����. �ڱ⸦ �����ϴ� ��簡 ������ �����ʿ� NULL�� �߻�.

--12 
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;
--E2�� ����. �ڱ� ������ ������ ���ʿ� NULL�� �߻�.

--13
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;
--DEPTNO�� �Ҽ��� ������ �ʾƵ� �������� ����(NATURAL JOIN�̶� ����)

--14 13���� WHERE���� �ٲٱ�
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO, E.EMPNO;
--DEPTNO�� �Ҽ��� ������ �Ѵ�.

--15 JOIN USING()�� ����� 13�� Ǯ�� "EMP E JOIN DEPT D USING(DEPTNO)"
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
ORDER BY DEPTNO, E.EMPNO;
--DEPTNO�� �Ҽ��� ������ �ʾƵ� �ȴ�.

--16 EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.EMPNO;
--DEPTNO�� �Ҽ��� �����ش�.

--17 11�� �ٸ� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON(E1.MGR = E2.EMPNO);

--18 12�� �ٸ� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1 RIGHT OUTER JOIN EMP E2
ON(E1.MGR = E2.EMPNO);

--19 11��,12�� ��(����,���) ������
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS �����ڸ�
FROM EMP E1 FULL OUTER JOIN EMP E2
ON(E1.MGR = E2.EMPNO);

-------------9��. SQL�� �� �� �ٸ� SQL��, ��������-------------

--�μ���ȣ�� 10, 20���� ���
SELECT *
FROM EMP
WHERE DEPTNO=10 OR DEPTNO=20;
--DEPTNO IN(10,20)�� �ᵵ �ȴ�.

--1 �̸��� JONES�� ���
SELECT * 
FROM EMP
WHERE ENAME='JONES';
--�ҹ��ڷ� �Է��ϸ� ����� ���� �ʴ´�. �빮�ڷ� �Է��߱� ������.

--1-1 1�� ����. �ҹ��ڷ� �Է����� ��� ��� ���.
SELECT * 
FROM EMP
WHERE UPPER(ENAME)=UPPER('jones');

--2 �޿��� 2975�̻�(>=), �ʰ�(>), ����(<=), �̸�(<)
SELECT *
FROM EMP
WHERE SAL >= 2975;

--3 JONES���� �� ���� ���� ���(�� ���� ������ �޴� ��� ����)
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
              FROM EMP
              WHERE ENAME='JONES');

--4 SCOTT���� ���� �Ի��� ���
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'SCOTT');
                  
--5 �޿� ���
SELECT AVG(SAL)
FROM EMP;

--6 �޿� ��պ��� �� ���� �޿� �޴� �������
SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
              FROM EMP);
              
--7 6���� 20�� �μ� ����� �����, �޿�, �μ��� �߰�
SELECT ENAME, SAL, DNAME, D.DEPTNO
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO 
      AND E.DEPTNO=20
      AND SAL > (SELECT AVG(SAL)
              FROM EMP);
              
--8 �μ���ȣ�� 10, 20�� ����� ����
SELECT *
FROM EMP
WHERE DEPTNO=10 OR DEPTNO=20;

--8-1 �ٸ����
SELECT *
FROM EMP
WHERE DEPTNO IN(10,20);

--9 8���� �ƴ� ����� ����
SELECT *
FROM EMP
WHERE NOT(DEPTNO=10 OR DEPTNO=20);

--9-1 �ٸ� ���
SELECT *
FROM EMP
WHERE DEPTNO NOT IN(10,20);

--10 �� �μ��� �ְ����
SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

--11 �� �μ��� �ְ� �޿��� ���� �޿� �޴� �������
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);
              
--12
SELECT *
FROM EMP
WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MAX(SAL)
                       FROM EMP
                       GROUP BY DEPTNO);
                       
----------===== 6/30 =====-----------

-- 1.�� ������ �޿� �Ѱ�(�հ�)
SELECT SUM(SAL)
FROM EMP;

-- 2.�μ��� �� �޿�
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 3. ��ü ���� �޿� ���
SELECT AVG(SAL)
FROM EMP;

-- 4.�μ��� ��� �޿�
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--5.�μ��� �ִ� �޿�
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

--6 �μ��� �ִ� �޿��� ���� �޿��� �޴� ������� ����
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);

--6-1 6�� �ٸ����. =ANY�� �ᵵ �ȴ�.            
SELECT *
FROM EMP
WHERE SAL =ANY (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);

--6-2 6�� �ٸ����. =ANY�� =SOME�� ���� ���δ�.                
SELECT *
FROM EMP
WHERE SAL =SOME (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
--7 �μ���ȣ �� 10,20, 30 �� �������
-- WHERE DEPTNO = 30;�� �μ���ȣ�� 1���� �� ����Ѵ�.
-- �������� ã�� ���� IN ���.
SELECT * 
FROM EMP
WHERE DEPTNO IN(10,20,30);

--8 �μ��� �ִ� �޿��� ���� �޿��� �޴� ������� ����
SELECT *
FROM EMP
WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MAX(SAL)
                       FROM EMP
                       GROUP BY DEPTNO);

--9 30�� �μ��� ���� ������� �޿���, ���� �޿��̸� �����ȣ ������ �����ؼ� �޿��� �����ȣ ���.
SELECT SAL, EMPNO
FROM EMP
WHERE DEPTNO = 30
ORDER BY SAL, EMPNO;

--9-1 9���� ��������. DESC�� ����Ѵ�.
SELECT SAL, EMPNO
FROM EMP
WHERE DEPTNO = 30
ORDER BY SAL DESC, EMPNO;

--10 30�� �μ��� ���� � ������� �޿����� ���� �޿��� �޴� ������� ����
SELECT *
FROM EMP
WHERE SAL <SOME (SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);
                
--10-1 30�� �μ��� ���� � ������� �޿����� ���� �޿��� �޴� ������� ����, �޿���, �����ȣ��
SELECT *
FROM EMP
WHERE SAL <SOME (SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--10-1-2 10-1�� �ٸ� ���. <ANY. SOME,ANY���� ���� ��.��, MAX�� 2850���� ���� ��.
SELECT *
FROM EMP
WHERE SAL <ANY (SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--10-1-3 10-1�� �ٸ� ���
SELECT *
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
            FROM EMP
            WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--11 MIN���� ���� ��. ���� �� ���� �۾ƾ� �ϴϱ� ���� �۾ƾ� �Ѵ�.
SELECT *
FROM EMP
WHERE SAL <ALL (SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--11-1 11�� �ٸ����
SELECT *
FROM EMP
WHERE SAL < (SELECT MIN(SAL)
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--12 10�� �μ��� ����� �����ϸ� ��� ������� ���� ��� EXISTS�����ϸ�~
SELECT *
FROM EMP
WHERE EXISTS(SELECT EMPNO
             FROM EMP
             WHERE DEPTNO = 10);

--13 50�� �μ��� ����� �����ϸ� ��� ������� ���� ���. 50�� �μ��� �������� �ʾ� ��µ��� �ʾҴ�.
SELECT *
FROM EMP
WHERE EXISTS(SELECT EMPNO
             FROM EMP
             WHERE DEPTNO = 50);
             
--14 ������� ���, �̸�, �μ���ȣ, �μ���, ��ġ
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--15 10�� �μ� ������� ���, �̸�, �μ���ȣ, �μ���, ��ġ
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO = 10;

--16 �����ȣ, �����, �μ���ȣ, �μ���, ��ġ ��, 10�� �μ��� �Ҽӵ� �����, INLINE VIEW �̿�
-- ���߿� ��������(MULTI-COLUMN CUBQUERY)�� ���������� SELECT���� ���� �����͸� ������ �����ϴ� ���.
-- FROM���� ����ϴ� ���������� �ζ��� ��(INLINE VIEW)��� �θ���.
-- INLINE VIEW(�ζ��� ��)�� FROM���� ���� ���̺� ����Ͽ� ����ϱ⿡ ���̺� �� ������ �Ը� �ʹ� ũ�ų� 
--���� �۾��� ���ʿ��� ���� ���� �Ϻθ� �� �� ���.
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
      (SELECT * FROM DEPT) D
WHERE E10.DEPTNO=D.DEPTNO;
      
--17 16���� WITH�� ���
-- WITH
WITH E10 AS(SELECT * FROM EMP WHERE DEPTNO = 10),
     D AS(SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

--18 �����ȣ, �̸�, ����, �޿�, �޿����, �μ���ȣ, �μ���
--��Į��μ����� (SCALAR SUBQUERY)
SELECT EMPNO, ENAME, JOB, SAL, 
(SELECT GRADE 
  FROM SALGRADE 
  WHERE E.SAL BETWEEN LOSAL AND HISAL) 
AS SALGRADE, DEPTNO, 
(SELECT DNAME 
  FROM DEPT
  WHERE E.DEPTNO = DEPT.DEPTNO) 
AS DNAME
FROM EMP E;
--�μ� ���̺��� �μ��� ����

-- Q0100 ����Ǭ�� ��ü ��� �� ALLEN�� ���� ��å(JOB)�� ������� ��� ����, �μ� ���� ���
SELECT JOB, EMPNO, ENAME, SAL, E.DEPTNO, DNAME
FROM (SELECT * FROM EMP WHERE DEPTNO = 30) E,
      (SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO AND JOB = 'SALESMAN'
ORDER BY SAL DESC; 

-- Q1 �� ��ü ��� �� ALLEN�� ���� ��å(JOB)�� ������� ��� ����, �μ� ���� ���
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND JOB = (SELECT JOB
                FROM EMP
               WHERE ENAME = 'ALLEN'); 

-- Q0200 ����Ǭ�� ��ü ����� ��� �޿�(SAL)���� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��������� ���
SELECT DISTINCT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE SAL > (SELECT AVG(SAL)
                  FROM EMP)
AND E.DEPTNO = D.DEPTNO AND
E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY SAL DESC;

-- Q2 �� ��ü ����� ��� �޿�(SAL)���� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��������� ���
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
  FROM EMP E, DEPT D, SALGRADE S
 WHERE E.DEPTNO = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT AVG(SAL)
                FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO; 

--Q3 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ����� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 10
   AND JOB NOT IN (SELECT DISTINCT JOB
                     FROM EMP
                    WHERE DEPTNO = 30); 

-- Q4 ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ��� ����, �޿� ��� ������ ���.
--Q4-1 ������ �Լ� ������� �ʴ� ���
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT MAX(SAL)
                FROM EMP
               WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 

--Q4-2 ������ �Լ� ����ϴ� ���
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > ALL (SELECT DISTINCT SAL
                    FROM EMP
                   WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 

-- 19
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

----------====7/7====----------
--10��. �����͸� �߰�, ����, �����ϴ� ������ ���۾�

--1. ���̺� ����
CREATE TABLE DEPT_TEMP
AS SELECT*FROM DEPT;
--Table DEPT_TEMP��(��) �����Ǿ����ϴ�.

--2. ���� Ȯ��
SELECT * 
FROM DEPT_TEMP;

--3 50, DATABASE, SEOUL �Է�
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');
-----1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM DEPT_TEMP;

--4 60, NETWORK, BUSAN
INSERT INTO DEPT_TEMP
VALUES ( 60, 'NETWORK', 'BUSAN');

--5 70, WEB, LOC�� �������� �ʴ´�.(��: NULL)
INSERT INTO DEPT_TEMP
VALUES ( 70, 'WEB', NULL);

--6 80, MOBILE,''
INSERT INTO DEPT_TEMP
VALUES ( 80,'MOBILE', '');
--NULL�� '', (��ĭ) ��� ����.

--7 90 INCHEON--LOC
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES ( 90, 'INCHEON');

--8 ���̺� �̸�: EMP_TEMP ���� EMP���̺��� ���� �������� �ʰ� ���̺� ����(WHERE 1<>1)
CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1<>1;

SELECT * 
FROM EMP_TEMP;

--9 �����ȣ:999, ȫ�浿, PRESIDENT, NULL, 2001/01/01, 5000, 1000, 10 �Է�
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

SELECT * 
FROM EMP_TEMP;

--10 2111, �̼���, MANAGER, 9999, 07/01/2001, 4000, NULL, 20
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111,'�̼���', 'MANAGER', 9999, '2001/07/01', 4000, NULL, 20);

--11 10-1 �ٸ� ���. TO_DATE�� ����ϸ� ����� �޶� �Է��� �����ϴ�.
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111,'�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001''DD/MM/YYYY'), 4000, NULL, 20);

--12 3111, ��û��, MANAGER, 9999, SYSDATE, 4000, NULL, 30
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
--SYSDATE ���ó�¥

--13 EMP���̺�� SALGRADE���̺��� �̿��ؼ� GRADE�� 1�� ������� ������ EMP_TEMP���̺�
--EMPNO, ENAME, JOB, MGR, HIREDATE, DAL, COMM, DEPTNO �Է�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 1;
-- GRADE��(�����) 1�� ������� ������ ���� �Ѵ�. S.GRADE = 1

SELECT * FROM EMP_TEMP;

--14 DEPT���̺��� ������ �����ؼ� DEPT_TEM2 ���̺� ����
CREATE TABLE DEPT_TEMP2
  AS SELECT*FROM DEPT;
  
SELECT * FROM DEPT_TEMP2;

--15 DEPT2���̺��� LOC�� ���� SEOUL�� ����
UPDATE DEPT_TEMP2
  SET LOC ='SEOUL';
  
--16 ROLLBACK; ������ ���۾�� �ǵ�����
ROLLBACK;

--17 DEPT_TEMP2 ���� �μ���ȣ:40 �μ���:DATABASE, �ּ�:SEOUL ����
UPDATE DEPT_TEMP2
  SET DNAME = 'DATABASE', DEPTNO = 40, LOC = 'SEOUL'
  WHERE DEPTNO = 40;
  
SELECT * FROM DEPT_TEMP2;

--18 DEPT���̺��� �μ�:40 �μ��̸�, �ּ� �����ͼ� EMP_TEMP2���̺��� 40�� �μ��� �μ���� �ּҸ� ����
UPDATE DEPT_TEMP2
  SET (DNAME, LOC) = (SELECT DNAME, LOC 
                      FROM DEPT 
                      WHERE DEPTNO = 40)
  WHERE DEPTNO = 40;
-- �����ͼ� ����. '=' ���

SELECT * FROM DEPT_TEMP2;

--19 18���� �ٸ� ���. ���� �з��ߴ�.
UPDATE DEPT_TEMP2
  SET DNAME = (SELECT DNAME 
                      FROM DEPT 
                      WHERE DEPTNO = 40),
      LOC = (SELECT LOC 
                      FROM DEPT 
                      WHERE DEPTNO = 40)
  WHERE DEPTNO = 40;
  
SELECT * FROM DEPT_TEMP2;

--����, ������ UPDATE  
--20 DEPT_TEMP2 �� �μ����� OPERATIONS�� �μ��� �μ���ȣ�� ���� �μ��� �ּҸ� SEOUL�� ����
UPDATE DEPT_TEMP2 
  SET LOC = 'SEOUL'
  WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2
                  WHERE DNAME = 'OPERATIONS');
  
SELECT * FROM DEPT_TEMP2;
  
--21 EMP���̺��� ������ �����ͼ� EMP_TEMP2���̺��� ����
CREATE TABLE EMP_TEMP2
  AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--22 EMP_TEMP2�� ���̺� ���� �� JOB�� MANAGER�� ������� ����
DELETE FROM EMP_TEMP2
 WHERE JOB = 'MANAGER';

SELECT * FROM EMP_TEMP2;

--23 EMP_TEMP2���̺��� 3���(GRADE)�̰� �μ���ȣ�� 30���� �μ��� ����μ��� ���� ������� ����
DELETE FROM EMP_TEMP2
  WHERE EMPNO IN (SELECT EMPNO 
                  FROM EMP_TEMP2 E, SALGRADE S 
                  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                  AND S.GRADE = 3 
                  AND E.DEPTNO = 30);
  
SELECT * FROM EMP_TEMP2;
  
--24 EMP_TEMP2���̺� ����
DELETE FROM EMP_TEMP2;
  
SELECT * FROM EMP_TEMP2;

--Q ���̺� ����
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
  SELECT * FROM CHAP10HW_EMP;
  
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
  SELECT * FROM CHAP10HW_DEPT;

CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;
  SELECT * FROM CHAP10HW_SALGRADE;

--Q1 CHAP10HW_DEPT ���̺� 50,60,70,80�� �μ� �� ���
INSERT INTO CHAP10HW_DEPT
   VALUES(50, 'ORACLE','BUSAN');

INSERT INTO CHAP10HW_DEPT
   VALUES(60, 'SQL','ILSAN');

INSERT INTO CHAP10HW_DEPT
   VALUES(70, 'SELECT','INCHEON');

INSERT INTO CHAP10HW_DEPT
   VALUES(80, 'DML','BUNDANG');
   
SELECT DEPTNO, DNAME, LOC 
FROM CHAP10HW_DEPT;
   
--Q2. CHAP10HW_EMP���̺� ���� 8���� ��� ������ ��� (�̵� �ٽ�)
--CREATE TABLE CHAP10HW_EMP 
INSERT INTO CHAP10HW_EMP
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, TO_DATE('2016-01-02', 'YYYY-MM-DD'), 4500, NULL, 50);
INSERT INTO CHAP10HW_EMP
VALUES(7202, 'TEST_USER2', 'CLERK', 7201, TO_DATE('2016-02-21', 'YYYY-MM-DD'), 1800, NULL, 50);
INSERT INTO CHAP10HW_EMP
VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, TO_DATE('2016-04-11', 'YYYY-MM-DD'), 3400, NULL, 60);
INSERT INTO CHAP10HW_EMP
VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31', 'YYYY-MM-DD'), 2700, 300, 60);
INSERT INTO CHAP10HW_EMP
VALUES(7205, 'TEST_USER5', 'CLERK', 7201, TO_DATE('2016-07-20', 'YYYY-MM-DD'), 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP
VALUES(7206, 'TEST_USER6', 'CLERK', 7201, TO_DATE('2016-09-08', 'YYYY-MM-DD'), 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP
VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, TO_DATE('2016-10-28', 'YYYY-MM-DD'), 2300, NULL, 80);
INSERT INTO CHAP10HW_EMP
VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, TO_DATE('2018-03-09', 'YYYY-MM-DD'), 1200, NULL, 80);


SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM CHAP10HW_EMP;

--Q3 CHAP10HW_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �ű��
UPDATE CHAP10HW_EMP
SET DEPTNO = 70
WHERE SAL > (SELECT AVG(SAL)
              FROM CHAP10HW_EMP
              WHERE DEPTNO = 50);
              
SELECT * FROM CHAP10HW_EMP;
   
--Q4 
UPDATE CHAP10HW_EMP
SET SAL = SAL*1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE)
                  FROM CHAP10HW_EMP
                  WHERE DEPTNO = 60);
                  
--Q5 CHAP10HW_EMP�� ���� ��� ��, �޿� ����� 5�� ����� ����
DELETE FROM CHAP10HW_EMP
WHERE EMPNO IN(SELECT EMPNO
              FROM CHAP10HW_EMP E,
                  CHAP10HW_SALGRADE S
              WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
              AND S.GRADE = 5);
              
SELECT * FROM CHAP10HW_EMP;
   
--**DEPT_TEMP ���̺��� 6,8,10,12�� �����(�����ϴٰ� �ߺ���)  
SELECT * FROM DEPT_TEMP;

DROP TABLE DEPT_TEMP
WHERE DEPTNO = 60, DNAME= 'DATABASE';