--ȸ������(member) ������ ���� ���̺� ����
--ȸ�����̵� mem_id ���ڿ� (�ִ� 50����Ʈ)
--ȸ����й�ȣ mem_pass ���ڿ� (�ִ� 50����Ʈ)
--ȸ���̸� mem_name ���ڿ� (�ִ� 50����Ʈ)
--ȸ������Ʈ(���ϸ���) mem_point ���� (�ִ� 10�ڸ�����)
CREATE TABLE member (
mem_id VARCHAR2(50)/*PRIMARY KEY�� ���� �ᵵ �ȴ�. ������ �ƴ�*/,
mem_pass VARCHAR2(50),
mem_name VARCHAR2(50),
mem_point NUMBER(10,0),
PRIMARY KEY (mem_id)
);

insert INTO member
(mem_id, mem_pass, mem_name, mem_point)
VALUES
('a001', '1234', '��浿', 100);

--a001 ȸ���� ����Ʈ�� 777�� �����ϴ� ���α׷��� �ۼ��ϼ���.
UPDATE member SET mem_point = 777 WHERE mem_id = 'a001';

COMMIT;

SELECT * FROM MEMBER;

SELECT mem_id, mem_pass, mem_name, mem_point FROM member;

CREATE TABLE student (
stu_no VARCHAR2(50), --�й�
stu_name VARCHAR2(50), --�̸�
stu_score NUMBER(10,0), --����
PRIMARY KEY (stu_no) --Ű�� �й�����
);

SELECT * FROM STUDENT;