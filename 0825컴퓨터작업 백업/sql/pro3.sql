--ȸ�� ���̺�
CREATE TABLE member (
memid VARCHAR2(50), --ȸ�� ���̵�
mempw VARCHAR2(50), --ȸ�� ��й�ȣ
memname VARCHAR2(50), --ȸ�� �̸�
memem VARCHAR2(50), --ȸ�� �̸���
PRIMARY KEY (memid)
);

-- faq �Խ��� ���̺�
CREATE TABLE faqbbs(
faqno NUMBER(10,0), --�� ��ȣ
faqtitle VARCHAR2(50), --������
faqcontent CLOB,  --�۳���
faqwriter VARCHAR2(50), --�ۼ���(���̵�)
faqdate DATE DEFAULT SYSDATE, --�۵����(�ۼ���)
PRIMARY KEY (faqno),
FOREIGN KEY (faqwriter) REFERENCES member (memid)
);

SELECT * FROM MEMBER;

SELECT * FROM FAQBBS;
