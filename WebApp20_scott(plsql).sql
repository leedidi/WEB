SELECT USER
FROM DUAL;
--==>> SCOTT


DESC TBL_BOARD;
--==>>
/*
�̸�       ��?       ����             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL             VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR            VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE    
*/


DECLARE
    V_CNT       NUMBER(9)       := 4;
    V_NAME      VARCHAR2(30);
    V_PWD       VARCHAR2(20);
    V_EMAIL     VARCHAR2(50);
    V_SUBJECT   VARCHAR2(100);
    V_CONTENT   VARCHAR2(4000);
    V_IPADDR    VARCHAR2(20);
    V_HITCOUNT  NUMBER;
    V_CREATED   DATE            := TO_DATE('2010-11-11', 'YYYY-MM-DD');
BEGIN
    LOOP
        EXIT WHEN V_CNT > 671;
        
        V_CNT := V_CNT + 1;
        
        IF (MOD(V_CNT, 5)=0) THEN
            V_PWD := 'java006$';
            V_CONTENT := '�޸��� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.164';
            V_NAME := '��';
            V_SUBJECT := '������';
        ELSIF (MOD(V_CNT, 3)=0) THEN
            V_PWD := 'java004$';
            V_CONTENT := 'ķ�� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.154';
            V_NAME := '��';
            V_SUBJECT := '������';
        ELSIF (MOD(V_CNT, 7)=0) THEN
            V_PWD := 'java009$';
            V_CONTENT := '�Ҹ��� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.151';
            V_NAME := '��';
            V_SUBJECT := '�ּ��� ����';
        ELSE 
            V_PWD := 'java002$';
            V_CONTENT := '����ī ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.167';
            V_NAME := '��';
            V_SUBJECT := '����ְ�';
        END IF;
        
        V_NAME := V_NAME || '����' || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || ' �ۼ��� �Խù� ' || LTRIM(TO_CHAR(V_CNT));
        
        V_CREATED := V_CREATED + 1;
        
        
        IF (MOD(V_CNT, 2)=0) THEN
            V_EMAIL := 'apple' || V_CNT || '@test.com';
            V_HITCOUNT := 27;
        ELSIF (MOD(V_CNT, 3)=0) THEN
            V_EMAIL := 'test' || V_CNT || '@test.com';
            V_HITCOUNT := 32;
        ELSIF (MOD(V_CNT, 4)=0) THEN
            V_EMAIL := 'study' || V_CNT || '@test.com';
            V_HITCOUNT := 46;
        ELSE
            V_EMAIL := 'morning' || V_CNT || '@test.com';
            V_HITCOUNT := 72;
        END IF;
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
        
    END LOOP;
END;












