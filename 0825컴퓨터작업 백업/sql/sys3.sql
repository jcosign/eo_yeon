--8/24 13.P329--
--4. DBA�� �����ϴ� ���̺��(SYS �������� ���� �Ѵ�.)
SELECT * FROM DBA_TABLES;

--6. SYS����, ����� ���� SCOTT�� ���� ���� Ȯ��
SELECT * FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

--7. SCOTT ����, INDEX������� �� Ȯ��
SELECT * FROM USER_IND_COLUMNS;

--13. SYS����, SCOTT���� VIEW ���� ���� �ֱ�
GRANT CREATE VIEW TO SCOTT;