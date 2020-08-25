--4-1
desc emp;

--4-2
desc dept;

--4-3
desc salgrade;

--4-4
select * from emp;

--4-5
select empno, ename, deptno
from emp;

--4-6
select distinct deptno
from emp;

--4-7
select distinct job, deptno
from emp;

--4-8
select all job, deptno
from emp;

--4-9
select ename, sal, sal*12+comm, comm from emp;

--4-10
select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm from emp;

--4-11
select ename, sal, sal*12+comm as annsal, comm from emp;

--4-12
select * 
from emp 
order by sal;

--4-13
select * 
from emp 
order by sal desc;

--4-14
select * 
from emp 
order by deptno asc, sal desc;

--4-q2
select DISTINCT job
from emp;

--4-q3
select all empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
from emp
order by deptno desc, ename;


select all empno, ename, mgr, sal, comm, deptno
from emp
order by deptno desc, ename;

select * from emp where deptno=10;

select * 
from emp 
order by deptno desc, ename;



--5-1
DESC EMP

--5-2
SELECT * FROM EMP;

--5-3 JONES의 정보만
SELECT *
FROM EMP
WHERE DEPTNO=30;

--5-4
SELECT *
FROM EMP
WHERE DEPTNO=30;

--5 부서번호 30 아닌 것 !=, <>, ^=
SELECT *
FROM EMP
WHERE DEPTNO !=30;

--6 부서번호 30이고 JOB: SALESMAN
SELECT *
FROM EMP
WHERE DEPTNO=30 AND JOB='SALESMAN';

--7
SELECT *
FROM EMP
WHERE DEPTNO=30 OR UPPER(JOB)=UPPER('CLERK');

--8
SELECT *
FROM EMP
WHERE SAL = 3000;

--9
SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

--10


