--------------------------------------------------------
--  ������ ������ - ������-3��-20-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACADEMIC
--------------------------------------------------------

  CREATE TABLE "ACADEMIC" 
   (	"AC_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"AC_TYPE" VARCHAR2(20), 
	"AC_FINAL" VARCHAR2(10), 
	"AC_SCHOOL" VARCHAR2(40), 
	"AC_MAJOR" VARCHAR2(40), 
	"AC_IN" DATE, 
	"AC_OUT" DATE, 
	"AC_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "ACADEMIC"."AC_NUM" IS '�з� ������ȣ'
   COMMENT ON COLUMN "ACADEMIC"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "ACADEMIC"."AC_TYPE" IS '�з�'
   COMMENT ON COLUMN "ACADEMIC"."AC_FINAL" IS '�з� ����'
   COMMENT ON COLUMN "ACADEMIC"."AC_SCHOOL" IS '�б���'
   COMMENT ON COLUMN "ACADEMIC"."AC_MAJOR" IS '����'
   COMMENT ON COLUMN "ACADEMIC"."AC_IN" IS '������'
   COMMENT ON COLUMN "ACADEMIC"."AC_OUT" IS '������'
   COMMENT ON COLUMN "ACADEMIC"."AC_STATUS" IS '����'
--------------------------------------------------------
--  DDL for Table ALARM
--------------------------------------------------------

  CREATE TABLE "ALARM" 
   (	"MEM_ID" VARCHAR2(20), 
	"AR_PH_PROJECT" CHAR(1) DEFAULT 'y', 
	"AR_MA_PROJECT" CHAR(1) DEFAULT 'y', 
	"AR_PH_APPLY" CHAR(1) DEFAULT 'y', 
	"AR_MA_APPLY" CHAR(1) DEFAULT 'y', 
	"AR_PH_CON" CHAR(1) DEFAULT 'y', 
	"AR_MA_CON" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "ALARM"."MEM_ID" IS '�˸� ������ȣ'
   COMMENT ON COLUMN "ALARM"."AR_PH_PROJECT" IS '������Ʈ ���� �˸�(��)'
   COMMENT ON COLUMN "ALARM"."AR_MA_PROJECT" IS '������Ʈ ���� �˸�(����)'
   COMMENT ON COLUMN "ALARM"."AR_PH_APPLY" IS '���� ���� �˸�(��)'
   COMMENT ON COLUMN "ALARM"."AR_MA_APPLY" IS '���� ���� �˸�(����)'
   COMMENT ON COLUMN "ALARM"."AR_PH_CON" IS '��� ���� �˸�(��)'
   COMMENT ON COLUMN "ALARM"."AR_MA_CON" IS '��� ���� �˸�(����)'
   COMMENT ON TABLE "ALARM"  IS '�˸� ����'
--------------------------------------------------------
--  DDL for Table ALARM_MESSAGE
--------------------------------------------------------

  CREATE TABLE "ALARM_MESSAGE" 
   (	"ARMSG_NUM" NUMBER, 
	"PR_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"ARMSG_CONTENT" CLOB, 
	"ARMSG_HIT" NUMBER DEFAULT 0, 
	"ARMSG_STAUTS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "ALARM_MESSAGE"."ARMSG_NUM" IS '�˸� �޼��� ������ȣ'
   COMMENT ON COLUMN "ALARM_MESSAGE"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "ALARM_MESSAGE"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "ALARM_MESSAGE"."ARMSG_CONTENT" IS '�޼��� ����'
   COMMENT ON COLUMN "ALARM_MESSAGE"."ARMSG_HIT" IS '�޼��� ��ȸ'
   COMMENT ON COLUMN "ALARM_MESSAGE"."ARMSG_STAUTS" IS '�޼��� ����'
   COMMENT ON TABLE "ALARM_MESSAGE"  IS '�˸� �޼���'
--------------------------------------------------------
--  DDL for Table APMEETING
--------------------------------------------------------

  CREATE TABLE "APMEETING" 
   (	"APMT_NUM" NUMBER, 
	"MT_FROM" VARCHAR2(20), 
	"MT_TO" VARCHAR2(20), 
	"MT_DATE" DATE, 
	"MT_TIME" DATE, 
	"MT_MEMO" VARCHAR2(100), 
	"MT_TYPE" CHAR(1), 
	"MT_FROM_ACCEPT" CHAR(1) DEFAULT '1', 
	"MT_TO_ACCEPT" CHAR(1), 
	"MT_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "APMEETING"."APMT_NUM" IS '������ȣ'
   COMMENT ON COLUMN "APMEETING"."MT_FROM" IS '��û��'
   COMMENT ON COLUMN "APMEETING"."MT_TO" IS '�޴���'
   COMMENT ON COLUMN "APMEETING"."MT_DATE" IS '���� �����'
   COMMENT ON COLUMN "APMEETING"."MT_TIME" IS '���� ��� �ð�'
   COMMENT ON COLUMN "APMEETING"."MT_MEMO" IS '���� �� �޸�'
   COMMENT ON COLUMN "APMEETING"."MT_TYPE" IS '���� ����'
   COMMENT ON COLUMN "APMEETING"."MT_FROM_ACCEPT" IS '���� ����'
   COMMENT ON COLUMN "APMEETING"."MT_TO_ACCEPT" IS '���� ����'
   COMMENT ON COLUMN "APMEETING"."MT_STATUS" IS '���� ����'
--------------------------------------------------------
--  DDL for Table APPLY
--------------------------------------------------------

  CREATE TABLE "APPLY" 
   (	"AP_NUM" NUMBER, 
	"AP_FREE" VARCHAR2(20), 
	"AP_PROJECT" NUMBER, 
	"AP_PAYMENT" NUMBER, 
	"AP_DATE" DATE, 
	"AP_CONTENT" CLOB, 
	"AP_STATUS" CHAR(1) DEFAULT 0
   ) 

   COMMENT ON COLUMN "APPLY"."AP_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "APPLY"."AP_FREE" IS '�������� ���̵�'
   COMMENT ON COLUMN "APPLY"."AP_PROJECT" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "APPLY"."AP_PAYMENT" IS '���� �ݾ�'
   COMMENT ON COLUMN "APPLY"."AP_DATE" IS '������'
   COMMENT ON COLUMN "APPLY"."AP_CONTENT" IS '���� ����'
   COMMENT ON COLUMN "APPLY"."AP_STATUS" IS '���� ���� ����'
   COMMENT ON TABLE "APPLY"  IS '���� '
--------------------------------------------------------
--  DDL for Table BANK
--------------------------------------------------------

  CREATE TABLE "BANK" 
   (	"BANK_CODE" NUMBER, 
	"BANK_NAME" VARCHAR2(30)
   ) 

   COMMENT ON COLUMN "BANK"."BANK_CODE" IS '���� �ڵ�'
   COMMENT ON COLUMN "BANK"."BANK_NAME" IS '�����'
   COMMENT ON TABLE "BANK"  IS '����'
--------------------------------------------------------
--  DDL for Table BANK_ACCOUNT
--------------------------------------------------------

  CREATE TABLE "BANK_ACCOUNT" 
   (	"AC_NUM" NUMBER, 
	"AC_ACCOUNT" VARCHAR2(100), 
	"AC_MEM" VARCHAR2(20), 
	"AC_BANK" NUMBER, 
	"AC_NAME" VARCHAR2(15)
   ) 

   COMMENT ON COLUMN "BANK_ACCOUNT"."AC_NUM" IS '����  ������ȣ'
   COMMENT ON COLUMN "BANK_ACCOUNT"."AC_ACCOUNT" IS '���¹�ȣ'
   COMMENT ON COLUMN "BANK_ACCOUNT"."AC_MEM" IS 'ȸ��'
   COMMENT ON COLUMN "BANK_ACCOUNT"."AC_BANK" IS '���� �ڵ�'
   COMMENT ON COLUMN "BANK_ACCOUNT"."AC_NAME" IS '������'
   COMMENT ON TABLE "BANK_ACCOUNT"  IS '���� '
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BO_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"BO_HIT" NUMBER DEFAULT 0, 
	"BO_TITLE" VARCHAR2(100), 
	"BO_CONTENT" CLOB, 
	"BO_DATE" DATE DEFAULT sysdate, 
	"BO_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "BOARD"."BO_NUM" IS '�����Խ��� ������ȣ'
   COMMENT ON COLUMN "BOARD"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "BOARD"."BO_HIT" IS '��ȸ��'
   COMMENT ON COLUMN "BOARD"."BO_TITLE" IS '����'
   COMMENT ON COLUMN "BOARD"."BO_CONTENT" IS '����'
   COMMENT ON COLUMN "BOARD"."BO_DATE" IS '�����'
   COMMENT ON COLUMN "BOARD"."BO_STATUS" IS '����'
   COMMENT ON TABLE "BOARD"  IS '�����Խ���'
--------------------------------------------------------
--  DDL for Table BOARD_FILE
--------------------------------------------------------

  CREATE TABLE "BOARD_FILE" 
   (	"BOFILE_NUM" NUMBER, 
	"BO_NUM" NUMBER, 
	"BOFILE_NAME" VARCHAR2(500), 
	"BOFILE_SAVE_NAME" VARCHAR2(500), 
	"BOFILE_TYPE" VARCHAR2(200), 
	"BOFILE_SIZE" NUMBER, 
	"BOFILE_STATUS" CHAR(1), 
	"BOFILE_DATE" DATE
   ) 

   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_NUM" IS '�����Խ��� ���� ������ȣ'
   COMMENT ON COLUMN "BOARD_FILE"."BO_NUM" IS '�����Խ��� ������ȣ'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "BOARD_FILE"."BOFILE_DATE" IS '���� ��� ��¥'
   COMMENT ON TABLE "BOARD_FILE"  IS '���� �Խ��� ����'
--------------------------------------------------------
--  DDL for Table BOARD_REPLY
--------------------------------------------------------

  CREATE TABLE "BOARD_REPLY" 
   (	"BORE_NUM" NUMBER, 
	"BO_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"BORE_CONTENT" CLOB, 
	"BORE_DATE" DATE, 
	"BORE_DEPTH" NUMBER DEFAULT 0, 
	"BORE_GROUP" NUMBER DEFAULT NULL, 
	"BORE_SEQ" NUMBER DEFAULT 0, 
	"BORE_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "BOARD_REPLY"."BORE_NUM" IS '�����Խ��� ��� ������ȣ'
   COMMENT ON COLUMN "BOARD_REPLY"."BO_NUM" IS '�����Խ��� ������ȣ'
   COMMENT ON COLUMN "BOARD_REPLY"."MEM_ID" IS '�ۼ���'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_CONTENT" IS '����'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_DATE" IS '�ۼ���'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_DEPTH" IS '����'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_GROUP" IS '�׷�'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_SEQ" IS '����'
   COMMENT ON COLUMN "BOARD_REPLY"."BORE_STATUS" IS '��� ����'
   COMMENT ON TABLE "BOARD_REPLY"  IS '�����Խ��� ���'
--------------------------------------------------------
--  DDL for Table CAREER
--------------------------------------------------------

  CREATE TABLE "CAREER" 
   (	"CA_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"CA_COMPANY" VARCHAR2(50), 
	"CA_IN" DATE, 
	"CA_OUT" DATE, 
	"CA_STATUS" CHAR(1) DEFAULT 'y', 
	"CA_DEPARTMENT" VARCHAR2(50), 
	"CA_POSITION" VARCHAR2(50)
   ) 

   COMMENT ON COLUMN "CAREER"."CA_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "CAREER"."MEM_ID" IS '�������� ���̵�'
   COMMENT ON COLUMN "CAREER"."CA_COMPANY" IS 'ȸ��'
   COMMENT ON COLUMN "CAREER"."CA_IN" IS '�Ի���'
   COMMENT ON COLUMN "CAREER"."CA_OUT" IS '�����'
   COMMENT ON COLUMN "CAREER"."CA_STATUS" IS '����'
   COMMENT ON COLUMN "CAREER"."CA_DEPARTMENT" IS '�ٹ� �μ�'
   COMMENT ON COLUMN "CAREER"."CA_POSITION" IS '����'
   COMMENT ON TABLE "CAREER"  IS '���'
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CATEGORY" 
   (	"CATE_NUM" NUMBER, 
	"CATE_CATEGORY" NUMBER, 
	"CATE_DETAIL" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "CATEGORY"."CATE_NUM" IS 'ī�װ� ������ȣ'
   COMMENT ON COLUMN "CATEGORY"."CATE_CATEGORY" IS 'ī�װ�'
   COMMENT ON COLUMN "CATEGORY"."CATE_DETAIL" IS '���� ī�װ�'
   COMMENT ON TABLE "CATEGORY"  IS 'ī�װ�'
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "CHAT" 
   (	"CHAT_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"CHAT_CONTENT" CLOB, 
	"CHAT_DATE" DATE, 
	"CHAT_IP" VARCHAR2(30)
   ) 

   COMMENT ON COLUMN "CHAT"."CHAT_NUM" IS 'ä�� ������ȣ'
   COMMENT ON COLUMN "CHAT"."MEM_ID" IS '�߽���'
   COMMENT ON COLUMN "CHAT"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS 'ä�� ����'
   COMMENT ON COLUMN "CHAT"."CHAT_DATE" IS '�ۼ���'
   COMMENT ON COLUMN "CHAT"."CHAT_IP" IS 'IP'
   COMMENT ON TABLE "CHAT"  IS 'ä��'
--------------------------------------------------------
--  DDL for Table CONSTRACT
--------------------------------------------------------

  CREATE TABLE "CONSTRACT" 
   (	"CONS_NUM" NUMBER, 
	"CONS_FREE_ID" VARCHAR2(20), 
	"CONS_PROJ_NUM" NUMBER, 
	"CONS_PERIOD" NUMBER, 
	"CONS_PAYMENT" NUMBER, 
	"CONS_DATE" DATE, 
	"CONS_CONTENT" CLOB, 
	"PART_NUM" NUMBER, 
	"CONS_STATUS" CHAR(1) DEFAULT '0', 
	"CONS_ENDCHECK" CHAR(1) DEFAULT '0'
   ) 

   COMMENT ON COLUMN "CONSTRACT"."CONS_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "CONSTRACT"."CONS_FREE_ID" IS '�������� ���̵�'
   COMMENT ON COLUMN "CONSTRACT"."CONS_PROJ_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "CONSTRACT"."CONS_PERIOD" IS '��� �Ⱓ'
   COMMENT ON COLUMN "CONSTRACT"."CONS_PAYMENT" IS '��� �ݾ�'
   COMMENT ON COLUMN "CONSTRACT"."CONS_DATE" IS '�����'
   COMMENT ON COLUMN "CONSTRACT"."CONS_CONTENT" IS '��� ����'
   COMMENT ON COLUMN "CONSTRACT"."PART_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "CONSTRACT"."CONS_STATUS" IS '��� ����'
   COMMENT ON COLUMN "CONSTRACT"."CONS_ENDCHECK" IS '�������� üũ'
   COMMENT ON TABLE "CONSTRACT"  IS '���'
--------------------------------------------------------
--  DDL for Table CONSTRACT_FILE
--------------------------------------------------------

  CREATE TABLE "CONSTRACT_FILE" 
   (	"CONS_NUM" NUMBER, 
	"CONSFILE_NAME" VARCHAR2(500), 
	"CONSFILE_SAVE_NAME" VARCHAR2(500), 
	"CONSFILE_TYPE" VARCHAR2(200), 
	"CONSFILE_SIZE" NUMBER, 
	"CONSFILE_STATUS" CHAR(1) DEFAULT 'y', 
	"CONSFILE_DATE" DATE
   ) 

   COMMENT ON COLUMN "CONSTRACT_FILE"."CONS_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "CONSTRACT_FILE"."CONSFILE_DATE" IS '���� �����'
   COMMENT ON TABLE "CONSTRACT_FILE"  IS '��� ����'
--------------------------------------------------------
--  DDL for Table DIAGRAM_DATA
--------------------------------------------------------

  CREATE TABLE "DIAGRAM_DATA" 
   (	"DATA_NUM" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"DATA_DATA" CLOB, 
	"OUTPUT_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"DATA_DATE" DATE, 
	"DATA_STATUS" CHAR(1) DEFAULT 'y', 
	"DATA_TITLE" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table EVALATION
--------------------------------------------------------

  CREATE TABLE "EVALATION" 
   (	"EV_NUM" NUMBER, 
	"EV_FROM" VARCHAR2(20), 
	"EV_TO" VARCHAR2(20), 
	"CONS_NUM" NUMBER, 
	"EV_PROFESSIONE" NUMBER, 
	"EV_SATISFY" NUMBER, 
	"EV_COMMUNI" NUMBER, 
	"EV_SCHEDULE" NUMBER, 
	"EV_ACTIVE" NUMBER, 
	"EV_CONTENT" CLOB
   ) 

   COMMENT ON COLUMN "EVALATION"."EV_NUM" IS '�� ������ȣ'
   COMMENT ON COLUMN "EVALATION"."EV_FROM" IS '�ۼ���'
   COMMENT ON COLUMN "EVALATION"."EV_TO" IS '�����'
   COMMENT ON COLUMN "EVALATION"."CONS_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "EVALATION"."EV_PROFESSIONE" IS '������'
   COMMENT ON COLUMN "EVALATION"."EV_SATISFY" IS '������'
   COMMENT ON COLUMN "EVALATION"."EV_COMMUNI" IS '�ǻ����'
   COMMENT ON COLUMN "EVALATION"."EV_SCHEDULE" IS '�����ؼ�'
   COMMENT ON COLUMN "EVALATION"."EV_ACTIVE" IS '���ؼ�'
   COMMENT ON COLUMN "EVALATION"."EV_CONTENT" IS '�� ����'
   COMMENT ON TABLE "EVALATION"  IS '��'
--------------------------------------------------------
--  DDL for Table FREE_TYPE
--------------------------------------------------------

  CREATE TABLE "FREE_TYPE" 
   (	"FTYPE_NUM" NUMBER, 
	"FTYPE_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "FREE_TYPE"."FTYPE_NUM" IS '�������� ����'
   COMMENT ON COLUMN "FREE_TYPE"."FTYPE_NAME" IS '�̸�'
   COMMENT ON TABLE "FREE_TYPE"  IS '�������� ����'
--------------------------------------------------------
--  DDL for Table INTEREST_PROJECT
--------------------------------------------------------

  CREATE TABLE "INTEREST_PROJECT" 
   (	"INPR_NUM" NUMBER, 
	"INPR_FREE" VARCHAR2(20), 
	"INPR_PROJECT" NUMBER
   ) 

   COMMENT ON COLUMN "INTEREST_PROJECT"."INPR_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "INTEREST_PROJECT"."INPR_FREE" IS '�������� ���̵�'
   COMMENT ON COLUMN "INTEREST_PROJECT"."INPR_PROJECT" IS '������Ʈ ������ȣ'
   COMMENT ON TABLE "INTEREST_PROJECT"  IS '���� ������Ʈ '
--------------------------------------------------------
--  DDL for Table INTEST_FREELANCER
--------------------------------------------------------

  CREATE TABLE "INTEST_FREELANCER" 
   (	"INFR_NUM" NUMBER, 
	"INFR_CLIENT" VARCHAR2(20), 
	"INFR_FREE" VARCHAR2(20)
   ) 

   COMMENT ON COLUMN "INTEST_FREELANCER"."INFR_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "INTEST_FREELANCER"."INFR_CLIENT" IS 'Ŭ���̾�Ʈ ���̵�'
   COMMENT ON COLUMN "INTEST_FREELANCER"."INFR_FREE" IS '�������� ���̵�'
   COMMENT ON TABLE "INTEST_FREELANCER"  IS '���� ��������'
--------------------------------------------------------
--  DDL for Table LANGUAGE
--------------------------------------------------------

  CREATE TABLE "LANGUAGE" 
   (	"LAN_NUM" NUMBER, 
	"LAN_NAME" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table LICENSE
--------------------------------------------------------

  CREATE TABLE "LICENSE" 
   (	"LI_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"LI_NAME" VARCHAR2(50), 
	"LI_ORGANIZATION" VARCHAR2(40), 
	"LI_DATE" DATE, 
	"LI_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "LICENSE"."LI_NUM" IS '�ڰ��� ������ȣ'
   COMMENT ON COLUMN "LICENSE"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "LICENSE"."LI_NAME" IS '�ڰ�����'
   COMMENT ON COLUMN "LICENSE"."LI_ORGANIZATION" IS '�߱ޱ��'
   COMMENT ON COLUMN "LICENSE"."LI_DATE" IS '��������'
   COMMENT ON COLUMN "LICENSE"."LI_STATUS" IS '����'
--------------------------------------------------------
--  DDL for Table MEETING
--------------------------------------------------------

  CREATE TABLE "MEETING" 
   (	"MT_NUM" NUMBER, 
	"MT_FROM" VARCHAR2(20), 
	"MT_TO" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"MT_DATE" DATE, 
	"MT_TIME" DATE, 
	"MT_REASON" VARCHAR2(100), 
	"MT_TYPE" CHAR(1), 
	"MT_FROM_ACCEPT" CHAR(1) DEFAULT '1', 
	"MT_TO_ACCEPT" CHAR(1) DEFAULT '0', 
	"MT_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "MEETING"."MT_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "MEETING"."MT_FROM" IS '�ۼ���'
   COMMENT ON COLUMN "MEETING"."MT_TO" IS '����'
   COMMENT ON COLUMN "MEETING"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "MEETING"."MT_DATE" IS '��� ��¥'
   COMMENT ON COLUMN "MEETING"."MT_TIME" IS '�ð�'
   COMMENT ON COLUMN "MEETING"."MT_REASON" IS '����'
   COMMENT ON COLUMN "MEETING"."MT_TYPE" IS 'ȸ�� ����'
   COMMENT ON COLUMN "MEETING"."MT_FROM_ACCEPT" IS '�ۼ��� ��������'
   COMMENT ON COLUMN "MEETING"."MT_TO_ACCEPT" IS '���� ��������'
   COMMENT ON COLUMN "MEETING"."MT_STATUS" IS '���� ���� ����'
   COMMENT ON TABLE "MEETING"  IS '����'
--------------------------------------------------------
--  DDL for Table MEM_IDENTITY
--------------------------------------------------------

  CREATE TABLE "MEM_IDENTITY" 
   (	"IDEN_NUM" NUMBER, 
	"IDEN_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "MEM_IDENTITY"."IDEN_NUM" IS '���� �ĺ���ȣ'
   COMMENT ON COLUMN "MEM_IDENTITY"."IDEN_NAME" IS '�̸�'
   COMMENT ON TABLE "MEM_IDENTITY"  IS '���� �ĺ���ȣ'
--------------------------------------------------------
--  DDL for Table MEM_STATUS
--------------------------------------------------------

  CREATE TABLE "MEM_STATUS" 
   (	"STATUS_NUM" NUMBER, 
	"STATUS_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "MEM_STATUS"."STATUS_NUM" IS '���� ����'
   COMMENT ON COLUMN "MEM_STATUS"."STATUS_NAME" IS '�̸�'
   COMMENT ON TABLE "MEM_STATUS"  IS '���� ����'
--------------------------------------------------------
--  DDL for Table MEM_TYPE
--------------------------------------------------------

  CREATE TABLE "MEM_TYPE" 
   (	"MTYPE_NUM" NUMBER, 
	"MTYPE_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "MEM_TYPE"."MTYPE_NUM" IS '���� ����'
   COMMENT ON COLUMN "MEM_TYPE"."MTYPE_NAME" IS '�̸�'
   COMMENT ON TABLE "MEM_TYPE"  IS '���� ����'
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"MEM_ID" VARCHAR2(50), 
	"MEM_PASS" VARCHAR2(20), 
	"MEM_NAME" VARCHAR2(50), 
	"MEM_MAIL" VARCHAR2(50), 
	"MEM_HP" VARCHAR2(30), 
	"MEM_FAX" VARCHAR2(20), 
	"MEM_PICTURE" VARCHAR2(200), 
	"MEM_DATE" DATE, 
	"MEM_BIR" VARCHAR2(10), 
	"MEM_SELFINFO" CLOB, 
	"MEM_ZIPCODE" VARCHAR2(10), 
	"MEM_ADD1" VARCHAR2(300), 
	"MEM_ADD2" VARCHAR2(300), 
	"MEM_URL" VARCHAR2(200), 
	"MTYPE_NUM" NUMBER, 
	"STATUS_NUM" NUMBER, 
	"FTYPE_NUM" NUMBER, 
	"IDEN_NUM" NUMBER, 
	"MEM_LOGIN" CHAR(1) DEFAULT '0'
   ) 

   COMMENT ON COLUMN "MEMBER"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "MEMBER"."MEM_PASS" IS '��й�ȣ'
   COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '�̸�'
   COMMENT ON COLUMN "MEMBER"."MEM_MAIL" IS '�̸���'
   COMMENT ON COLUMN "MEMBER"."MEM_HP" IS '��ȭ��ȣ'
   COMMENT ON COLUMN "MEMBER"."MEM_FAX" IS '�ѽ���ȣ'
   COMMENT ON COLUMN "MEMBER"."MEM_PICTURE" IS '����'
   COMMENT ON COLUMN "MEMBER"."MEM_DATE" IS '������'
   COMMENT ON COLUMN "MEMBER"."MEM_BIR" IS '�������'
   COMMENT ON COLUMN "MEMBER"."MEM_SELFINFO" IS '�ڱ�Ұ�'
   COMMENT ON COLUMN "MEMBER"."MEM_ZIPCODE" IS '�����ȣ'
   COMMENT ON COLUMN "MEMBER"."MEM_ADD1" IS '�ּ�'
   COMMENT ON COLUMN "MEMBER"."MEM_ADD2" IS '���ּ�'
   COMMENT ON COLUMN "MEMBER"."MEM_URL" IS 'URL'
   COMMENT ON COLUMN "MEMBER"."MTYPE_NUM" IS '���� ����'
   COMMENT ON COLUMN "MEMBER"."STATUS_NUM" IS '���� ����'
   COMMENT ON COLUMN "MEMBER"."FTYPE_NUM" IS '�������� ����'
   COMMENT ON COLUMN "MEMBER"."IDEN_NUM" IS '���� �ĺ���ȣ'
   COMMENT ON TABLE "MEMBER"  IS '����'
--------------------------------------------------------
--  DDL for Table MESSAGE
--------------------------------------------------------

  CREATE TABLE "MESSAGE" 
   (	"MSG_NUM" NUMBER, 
	"MSG_FROM" VARCHAR2(20), 
	"MSG_TO" VARCHAR2(20), 
	"MSG_TITLE" VARCHAR2(100), 
	"MSG_CONTENT" CLOB, 
	"MSG_DATE" DATE, 
	"MSG_STATUS" CHAR(1), 
	"MSG_HIT" NUMBER
   ) 

   COMMENT ON COLUMN "MESSAGE"."MSG_NUM" IS '�޽��� ������ȣ'
   COMMENT ON COLUMN "MESSAGE"."MSG_FROM" IS '�������� ���̵�'
   COMMENT ON COLUMN "MESSAGE"."MSG_TO" IS '�޴��� ���̵�'
   COMMENT ON COLUMN "MESSAGE"."MSG_TITLE" IS '����'
   COMMENT ON COLUMN "MESSAGE"."MSG_CONTENT" IS '����'
   COMMENT ON COLUMN "MESSAGE"."MSG_DATE" IS '�ۼ���'
   COMMENT ON COLUMN "MESSAGE"."MSG_STATUS" IS '�޼��� ����'
   COMMENT ON COLUMN "MESSAGE"."MSG_HIT" IS '��ȸ��'
   COMMENT ON TABLE "MESSAGE"  IS '�޼���'
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NOTICE" 
   (	"NO_NUM" NUMBER, 
	"NO_TITLE" VARCHAR2(100), 
	"NO_CONTENT" CLOB, 
	"NO_DATE" DATE DEFAULT sysdate, 
	"NO_HIT" NUMBER DEFAULT 0, 
	"NO_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "NOTICE"."NO_NUM" IS '�������� ������ȣ'
   COMMENT ON COLUMN "NOTICE"."NO_TITLE" IS '����'
   COMMENT ON COLUMN "NOTICE"."NO_CONTENT" IS '����'
   COMMENT ON COLUMN "NOTICE"."NO_DATE" IS '�����'
   COMMENT ON COLUMN "NOTICE"."NO_HIT" IS '��ȸ��'
   COMMENT ON COLUMN "NOTICE"."NO_STATUS" IS '����'
   COMMENT ON TABLE "NOTICE"  IS '��������'
--------------------------------------------------------
--  DDL for Table NOTICE_FILE
--------------------------------------------------------

  CREATE TABLE "NOTICE_FILE" 
   (	"NOFILE_NUM" NUMBER, 
	"NOFILE_NOTI_NUM" NUMBER, 
	"NOFILE_NAME" VARCHAR2(100), 
	"NOFILE_SAVE_NAME" VARCHAR2(500), 
	"NOFILE_TYPE" VARCHAR2(200), 
	"NOFILE_SIZE" NUMBER, 
	"NOFILE_STATUS" CHAR(1), 
	"NOFILE_DATE" DATE, 
	"NOFILE_HIT" NUMBER
   ) 

   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_NUM" IS '�������� ���� ������ȣ'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_NOTI_NUM" IS '�������� ������ȣ'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_DATE" IS '���� �����'
   COMMENT ON COLUMN "NOTICE_FILE"."NOFILE_HIT" IS '�ٿ�ε� ��'
   COMMENT ON TABLE "NOTICE_FILE"  IS '�������� ����'
--------------------------------------------------------
--  DDL for Table OUTPUT
--------------------------------------------------------

  CREATE TABLE "OUTPUT" 
   (	"OUPUT_NUM" NUMBER, 
	"OUTPUT_TYPE" CHAR(10), 
	"OUTPUT_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "OUTPUT"."OUPUT_NUM" IS '���⹰ ������ȣ'
   COMMENT ON COLUMN "OUTPUT"."OUTPUT_TYPE" IS '�з�'
   COMMENT ON COLUMN "OUTPUT"."OUTPUT_NAME" IS '�̸�'
   COMMENT ON TABLE "OUTPUT"  IS '���⹰ '
--------------------------------------------------------
--  DDL for Table PART
--------------------------------------------------------

  CREATE TABLE "PART" 
   (	"PART_NUM" NUMBER, 
	"PART" VARCHAR2(30)
   ) 

   COMMENT ON COLUMN "PART"."PART_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "PART"."PART" IS '���� �̸�'
   COMMENT ON TABLE "PART"  IS '����'
--------------------------------------------------------
--  DDL for Table PORTFOLIO
--------------------------------------------------------

  CREATE TABLE "PORTFOLIO" 
   (	"PO_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"PO_CATE_NUM" NUMBER, 
	"PO_TITLE" VARCHAR2(200), 
	"PO_CONTENT" CLOB, 
	"PO_START" DATE, 
	"PO_END" DATE, 
	"PO_TECH" NUMBER, 
	"PO_REPRE" CHAR(1) DEFAULT '1', 
	"PART_NUM" NUMBER, 
	"PO_STATUS" CHAR(1) DEFAULT 'y', 
	"PO_PERCENT" NUMBER, 
	"PO_EXPLAINFILE" VARCHAR2(60)
   ) 

   COMMENT ON COLUMN "PORTFOLIO"."PO_NUM" IS '��Ʈ������ ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO"."MEM_ID" IS '�������� ���̵�'
   COMMENT ON COLUMN "PORTFOLIO"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO"."PO_CATE_NUM" IS 'ī�װ� ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO"."PO_TITLE" IS '��Ʈ������ ����'
   COMMENT ON COLUMN "PORTFOLIO"."PO_CONTENT" IS '����'
   COMMENT ON COLUMN "PORTFOLIO"."PO_START" IS '������'
   COMMENT ON COLUMN "PORTFOLIO"."PO_END" IS '������'
   COMMENT ON COLUMN "PORTFOLIO"."PO_TECH" IS '���ñ��'
   COMMENT ON COLUMN "PORTFOLIO"."PO_REPRE" IS '��ǥ ��Ʈ������'
   COMMENT ON COLUMN "PORTFOLIO"."PART_NUM" IS '���� ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO"."PO_PERCENT" IS '������'
   COMMENT ON TABLE "PORTFOLIO"  IS '��Ʈ������'
--------------------------------------------------------
--  DDL for Table PORTFOLIO_FILE
--------------------------------------------------------

  CREATE TABLE "PORTFOLIO_FILE" 
   (	"POFILE_NUM" NUMBER, 
	"PO_NUM" NUMBER, 
	"POFILE_FILE_NAME" VARCHAR2(500), 
	"POFILE_SAVE_NAME" VARCHAR2(500), 
	"POFILE_TYPE" VARCHAR2(100), 
	"POFILE_SIZE" NUMBER, 
	"POFILE_STATUS" CHAR(1), 
	"POFILE_DATE" DATE
   ) 

   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_NUM" IS '��Ʈ������ ���� ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."PO_NUM" IS '��Ʈ������ ������ȣ'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_FILE_NAME" IS '�����̸�'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "PORTFOLIO_FILE"."POFILE_DATE" IS '���� ��� ��¥'
   COMMENT ON TABLE "PORTFOLIO_FILE"  IS '��Ʈ������ ����'
--------------------------------------------------------
--  DDL for Table PROJECT
--------------------------------------------------------

  CREATE TABLE "PROJECT" 
   (	"PR_NUM" NUMBER, 
	"PR_CATE_NUM" NUMBER, 
	"PR_TITLE" VARCHAR2(100), 
	"PR_EX_PERIOD" NUMBER, 
	"PR_PAYMENT" NUMBER, 
	"PR_CONTENT" CLOB, 
	"PR_DATE" DATE DEFAULT sysdate, 
	"PR_GITURL" VARCHAR2(200), 
	"PR_DEADLINE" DATE, 
	"PR_MEETING" CHAR(1), 
	"PR_ADD" VARCHAR2(100), 
	"PR_START" DATE, 
	"PR_SUPPORT" CHAR(1), 
	"CLIENT" VARCHAR2(20), 
	"PR_STATUS" NUMBER, 
	"MTYPE_NUM" NUMBER, 
	"PR_TYPE" NUMBER, 
	"PR_END" DATE, 
	"PR_CHECK" DATE DEFAULT NULL, 
	"PR_REF" VARCHAR2(300), 
	"PR_ENDCHECK" CHAR(1) DEFAULT '0'
   ) 

   COMMENT ON COLUMN "PROJECT"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "PROJECT"."PR_CATE_NUM" IS 'ī�װ� ������ȣ'
   COMMENT ON COLUMN "PROJECT"."PR_TITLE" IS '����'
   COMMENT ON COLUMN "PROJECT"."PR_EX_PERIOD" IS '����Ⱓ'
   COMMENT ON COLUMN "PROJECT"."PR_PAYMENT" IS '�ݾ�'
   COMMENT ON COLUMN "PROJECT"."PR_CONTENT" IS '����'
   COMMENT ON COLUMN "PROJECT"."PR_DATE" IS '�����'
   COMMENT ON COLUMN "PROJECT"."PR_GITURL" IS '��Url'
   COMMENT ON COLUMN "PROJECT"."PR_DEADLINE" IS '���� ������'
   COMMENT ON COLUMN "PROJECT"."PR_MEETING" IS '��ȣ ȸ�� ����'
   COMMENT ON COLUMN "PROJECT"."PR_ADD" IS '�ּ�'
   COMMENT ON COLUMN "PROJECT"."PR_START" IS '������'
   COMMENT ON COLUMN "PROJECT"."PR_SUPPORT" IS '���� ���� ���'
   COMMENT ON COLUMN "PROJECT"."CLIENT" IS 'Ŭ���̾�Ʈ'
   COMMENT ON COLUMN "PROJECT"."PR_STATUS" IS '������Ʈ ����'
   COMMENT ON COLUMN "PROJECT"."MTYPE_NUM" IS '��ȣ ����� ����'
   COMMENT ON COLUMN "PROJECT"."PR_TYPE" IS '������Ʈ ��Ȳ'
   COMMENT ON COLUMN "PROJECT"."PR_END" IS '������'
   COMMENT ON COLUMN "PROJECT"."PR_CHECK" IS '�Ա���'
   COMMENT ON COLUMN "PROJECT"."PR_REF" IS '���� ����'
   COMMENT ON COLUMN "PROJECT"."PR_ENDCHECK" IS 'Ŭ���̾�Ʈ üũ'
   COMMENT ON TABLE "PROJECT"  IS '������Ʈ'
--------------------------------------------------------
--  DDL for Table PROJECT_FILE
--------------------------------------------------------

  CREATE TABLE "PROJECT_FILE" 
   (	"PR_NUM" NUMBER, 
	"PRFILE_NAME" VARCHAR2(500), 
	"PRFILE_SAVE_NAME" VARCHAR2(500), 
	"PRFILE_TYPE" VARCHAR2(200), 
	"PRFILE_SIZE" NUMBER, 
	"PRFILE_STATUS" CHAR(1), 
	"PRFILE_DATE" DATE
   ) 

   COMMENT ON COLUMN "PROJECT_FILE"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "PROJECT_FILE"."PRFILE_DATE" IS '���� ��� ��¥'
   COMMENT ON TABLE "PROJECT_FILE"  IS '������Ʈ ����'
--------------------------------------------------------
--  DDL for Table PROJECT_NOTICE
--------------------------------------------------------

  CREATE TABLE "PROJECT_NOTICE" 
   (	"PRNO_NUM" NUMBER, 
	"PR_NUM" NUMBER, 
	"PRNO_WRITER" VARCHAR2(20), 
	"PRNO_DATE" DATE, 
	"PRNO_HIT" NUMBER DEFAULT 0, 
	"PRNO_TITLE" VARCHAR2(100), 
	"PRNO_CONTENT" CLOB, 
	"PRNO_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_NUM" IS '������Ʈ �������� ������ȣ'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_WRITER" IS '�ۼ���'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_DATE" IS '�����'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_HIT" IS '��ȸ��'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_TITLE" IS '����'
   COMMENT ON COLUMN "PROJECT_NOTICE"."PRNO_CONTENT" IS '����'
   COMMENT ON TABLE "PROJECT_NOTICE"  IS '������Ʈ ��������'
--------------------------------------------------------
--  DDL for Table PROJECT_NOTICE_FILE
--------------------------------------------------------

  CREATE TABLE "PROJECT_NOTICE_FILE" 
   (	"PRNOFILE_NUM" NUMBER, 
	"PRNO_NUM" NUMBER, 
	"PRNOFILE_NAME" VARCHAR2(500), 
	"PRNOFILE_SAVE_NAME" VARCHAR2(500), 
	"PRNOFILE_TYPE" VARCHAR2(200), 
	"PRNO_SIZE" NUMBER, 
	"PRNO_DATE" DATE, 
	"PRNO_HIT" NUMBER DEFAULT 0, 
	"PRNOFILE_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNOFILE_NUM" IS '������Ʈ �������� ���� ������ȣ'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNO_NUM" IS '������Ʈ �������� ������ȣ'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNOFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNOFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNOFILE_TYPE" IS '���� ����'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNO_SIZE" IS '���� ũ��'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNO_DATE" IS '���� �����'
   COMMENT ON COLUMN "PROJECT_NOTICE_FILE"."PRNO_HIT" IS '���� �ٿ�ε� ��'
   COMMENT ON TABLE "PROJECT_NOTICE_FILE"  IS '������Ʈ �������� ����'
--------------------------------------------------------
--  DDL for Table PROJECT_OUTPUT
--------------------------------------------------------

  CREATE TABLE "PROJECT_OUTPUT" 
   (	"PROUT_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"PROUT_NAME" VARCHAR2(500), 
	"PROUT_SAVE_NAME" VARCHAR2(500), 
	"PROUT_TYPE" VARCHAR2(200), 
	"PROUT_SIZE" NUMBER, 
	"PROUT_STATUS" CHAR(1) DEFAULT 'y', 
	"PROUT_DATE" DATE, 
	"OUPUT_NUM" NUMBER, 
	"PROUT_CHECK" CHAR(1) DEFAULT 'n'
   ) 

   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_NUM" IS '���� ���� ������ȣ'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."MEM_ID" IS '�����'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PR_NUM" IS '������ƮID'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_SIZE" IS '���� ������'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_STATUS" IS '���� ����'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."PROUT_DATE" IS '���� ��ϳ�¥'
   COMMENT ON COLUMN "PROJECT_OUTPUT"."OUPUT_NUM" IS '���⹰ ������ȣ'
   COMMENT ON TABLE "PROJECT_OUTPUT"  IS '������Ʈ ���⹰'
--------------------------------------------------------
--  DDL for Table PROJECT_REPLY
--------------------------------------------------------

  CREATE TABLE "PROJECT_REPLY" 
   (	"PRRE_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"PRRE_DATE" DATE, 
	"PRRE_CONTENT" CLOB, 
	"PRRE_DEPTH" NUMBER DEFAULT 0, 
	"PRRE_GROUP" NUMBER DEFAULT NULL, 
	"PRRE_SEQ" NUMBER DEFAULT 0, 
	"PRRE_STATUS" CHAR(1) DEFAULT 'y', 
	"PRRE_PASS" VARCHAR2(20)
   ) 

   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "PROJECT_REPLY"."MEM_ID" IS 'ȸ�� ���̵�'
   COMMENT ON COLUMN "PROJECT_REPLY"."PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_DATE" IS '�ۼ�����'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_CONTENT" IS '�ۼ�����'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_DEPTH" IS '����'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_GROUP" IS '�׷�'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_SEQ" IS '����'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_STATUS" IS '��� ����'
   COMMENT ON COLUMN "PROJECT_REPLY"."PRRE_PASS" IS '��б� ����'
   COMMENT ON TABLE "PROJECT_REPLY"  IS '������Ʈ ���'
--------------------------------------------------------
--  DDL for Table PROJECT_STATUS
--------------------------------------------------------

  CREATE TABLE "PROJECT_STATUS" 
   (	"PR_STATUS" NUMBER, 
	"STATUS_NAME" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "PROJECT_STATUS"."PR_STATUS" IS '������Ʈ ����'
   COMMENT ON COLUMN "PROJECT_STATUS"."STATUS_NAME" IS '�̸�'
   COMMENT ON TABLE "PROJECT_STATUS"  IS '������Ʈ ����'
--------------------------------------------------------
--  DDL for Table PROJECT_TECH
--------------------------------------------------------

  CREATE TABLE "PROJECT_TECH" 
   (	"PTECH_NUM" NUMBER, 
	"PROJECT_NUM" NUMBER, 
	"TECH_NUM" NUMBER
   )
--------------------------------------------------------
--  DDL for Table PROJECT_TYPE
--------------------------------------------------------

  CREATE TABLE "PROJECT_TYPE" 
   (	"PTYPE_NUM" NUMBER, 
	"PTYPE_NAME" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"QA_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"QA_HIT" NUMBER DEFAULT 0, 
	"QA_TITLE" VARCHAR2(100), 
	"QA_CONTENT" CLOB, 
	"QA_DATE" DATE DEFAULT sysdate, 
	"QA_STATUS" CHAR(1) DEFAULT 'y', 
	"QA_DEPTH" NUMBER DEFAULT 0, 
	"QA_GROUP" NUMBER, 
	"QA_PASS" VARCHAR2(20)
   ) 

   COMMENT ON COLUMN "QNA"."QA_NUM" IS 'QNA ������ȣ'
   COMMENT ON COLUMN "QNA"."MEM_ID" IS '�ۼ���'
   COMMENT ON COLUMN "QNA"."QA_HIT" IS '��ȸ��'
   COMMENT ON COLUMN "QNA"."QA_TITLE" IS '����'
   COMMENT ON COLUMN "QNA"."QA_CONTENT" IS '����'
   COMMENT ON COLUMN "QNA"."QA_DATE" IS '�����'
   COMMENT ON COLUMN "QNA"."QA_STATUS" IS '����'
   COMMENT ON COLUMN "QNA"."QA_DEPTH" IS '����'
   COMMENT ON COLUMN "QNA"."QA_GROUP" IS '�׷�'
   COMMENT ON COLUMN "QNA"."QA_PASS" IS '�Խñ� ��й�ȣ'
   COMMENT ON TABLE "QNA"  IS 'QNA �Խ���'
--------------------------------------------------------
--  DDL for Table QNA_FILE
--------------------------------------------------------

  CREATE TABLE "QNA_FILE" 
   (	"QAFILE_NUM" NUMBER, 
	"QAFILE_QA_NUM" NUMBER, 
	"QAFILE_NAME" VARCHAR2(500), 
	"QAFILE_SAVE_NAME" VARCHAR2(500), 
	"QAFILE_TYPE" VARCHAR2(200), 
	"QAFILE_SIZE" NUMBER, 
	"QAFILE_STATUS" CHAR(1), 
	"QAFILE_DATE" DATE
   ) 

   COMMENT ON COLUMN "QNA_FILE"."QAFILE_NUM" IS 'QnA ���� ������ȣ'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_QA_NUM" IS 'QNA �Խ���'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_NAME" IS '���� �̸�'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_SIZE" IS '���� ������'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_STATUS" IS '���� ����'
   COMMENT ON COLUMN "QNA_FILE"."QAFILE_DATE" IS '���� ��� ��¥'
   COMMENT ON TABLE "QNA_FILE"  IS 'QnA �Խ��� ����'
--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "SCHEDULE" 
   (	"SC_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"SC_START" DATE, 
	"SC_END" DATE, 
	"SC_CONTENT" VARCHAR2(100), 
	"SC_STATUS" CHAR(1) DEFAULT 'y'
   ) 

   COMMENT ON COLUMN "SCHEDULE"."SC_NUM" IS '������ ������ȣ'
   COMMENT ON COLUMN "SCHEDULE"."MEM_ID" IS '���̵�'
   COMMENT ON COLUMN "SCHEDULE"."SC_START" IS '������'
   COMMENT ON COLUMN "SCHEDULE"."SC_END" IS '������'
   COMMENT ON COLUMN "SCHEDULE"."SC_CONTENT" IS '������ ����'
   COMMENT ON COLUMN "SCHEDULE"."SC_STATUS" IS '������ ����'
   COMMENT ON TABLE "SCHEDULE"  IS '������ '
--------------------------------------------------------
--  DDL for Table SIGN
--------------------------------------------------------

  CREATE TABLE "SIGN" 
   (	"MEM_ID" VARCHAR2(100), 
	"SIGN_SAVE_NAME" VARCHAR2(200), 
	"SIGN_STATUS" CHAR(1) DEFAULT 'y', 
	"SIGN_DATE" DATE, 
	"SIGN_TYPE" CHAR(1), 
	"SIGN_NUM" NUMBER
   ) 

   COMMENT ON COLUMN "SIGN"."MEM_ID" IS '���� ���̵�'
   COMMENT ON COLUMN "SIGN"."SIGN_SAVE_NAME" IS '���� �����̸�'
   COMMENT ON COLUMN "SIGN"."SIGN_STATUS" IS '���� ���ϻ���'
   COMMENT ON COLUMN "SIGN"."SIGN_DATE" IS '���� ���ϵ�� ��¥'
   COMMENT ON COLUMN "SIGN"."SIGN_TYPE" IS '���� Ÿ��'
   COMMENT ON COLUMN "SIGN"."SIGN_NUM" IS '���� ��ȣ'
   COMMENT ON TABLE "SIGN"  IS '����'
--------------------------------------------------------
--  DDL for Table TABLE_DATA
--------------------------------------------------------

  CREATE TABLE "TABLE_DATA" 
   (	"DATA_NUM" VARCHAR2(20), 
	"PR_NUM" NUMBER, 
	"DATA_DATA" CLOB, 
	"OUTPUT_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"DATA_DATE" DATE, 
	"DATA_STATUS" CHAR(1) DEFAULT 'y'
   )
--------------------------------------------------------
--  DDL for Table TECHNIQUE
--------------------------------------------------------

  CREATE TABLE "TECHNIQUE" 
   (	"TECH_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"TECH_TYPE" NUMBER, 
	"TECH_FLUENT" CHAR(1), 
	"TECH_PERIOD" VARCHAR2(30), 
	"TECH_STATUS" CHAR(1) DEFAULT 'y', 
	"TECH_REPRE" CHAR(1) DEFAULT 1
   ) 

   COMMENT ON COLUMN "TECHNIQUE"."TECH_NUM" IS '��� ������ȣ'
   COMMENT ON COLUMN "TECHNIQUE"."MEM_ID" IS '�������� ���̵�'
   COMMENT ON COLUMN "TECHNIQUE"."TECH_TYPE" IS '��� ����'
   COMMENT ON COLUMN "TECHNIQUE"."TECH_FLUENT" IS '��� ���̵�'
   COMMENT ON COLUMN "TECHNIQUE"."TECH_PERIOD" IS '��� �Ⱓ'
   COMMENT ON COLUMN "TECHNIQUE"."TECH_STATUS" IS '���� ����'
   COMMENT ON COLUMN "TECHNIQUE"."TECH_REPRE" IS '��ǥ �������'
   COMMENT ON TABLE "TECHNIQUE"  IS '���'
--------------------------------------------------------
--  DDL for Table TEST
--------------------------------------------------------

  CREATE TABLE "TEST" 
   (	"TEST_NUM" NUMBER, 
	"TEST_PR_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"TEST_TITLE" VARCHAR2(100), 
	"TEST_TYPE" CHAR(1), 
	"TEST_STATUS" CHAR(1) DEFAULT 'y', 
	"TEST_CONTENT" CLOB, 
	"TEST_DATE" DATE
   ) 

   COMMENT ON COLUMN "TEST"."TEST_NUM" IS '�׽�Ʈ �Խ��� ������ȣ'
   COMMENT ON COLUMN "TEST"."TEST_PR_NUM" IS '������Ʈ ������ȣ'
   COMMENT ON COLUMN "TEST"."MEM_ID" IS '�����'
   COMMENT ON COLUMN "TEST"."TEST_TITLE" IS '����'
   COMMENT ON COLUMN "TEST"."TEST_TYPE" IS '����'
   COMMENT ON COLUMN "TEST"."TEST_STATUS" IS '����'
   COMMENT ON COLUMN "TEST"."TEST_CONTENT" IS '����'
   COMMENT ON TABLE "TEST"  IS '�׽�Ʈ'
--------------------------------------------------------
--  DDL for Table WORK
--------------------------------------------------------

  CREATE TABLE "WORK" 
   (	"WORK_NUM" NUMBER, 
	"MEM_ID" VARCHAR2(20), 
	"WORK_CHAR_ID" VARCHAR2(20), 
	"WORK_PROJ_NUM" NUMBER, 
	"WORK_PRIORITY" CHAR(1), 
	"WORK_TITLE" VARCHAR2(100), 
	"WORK_DATE" DATE, 
	"WORK_PROGRESS" VARCHAR2(20), 
	"WORK_TIME" VARCHAR2(20), 
	"WORK_START" DATE, 
	"WORK_END" DATE, 
	"WORK_STATUS" CHAR(1) DEFAULT 'y', 
	"WORK_CONTENT" CLOB, 
	"WORK_ORDER" VARCHAR2(20), 
	"WORK_GROUP" VARCHAR2(20)
   ) 

   COMMENT ON COLUMN "WORK"."WORK_NUM" IS '�ϰ� ���� ��ȣ'
   COMMENT ON COLUMN "WORK"."MEM_ID" IS 'ȸ��ID'
   COMMENT ON COLUMN "WORK"."WORK_CHAR_ID" IS '�����'
   COMMENT ON COLUMN "WORK"."WORK_PROJ_NUM" IS '������ƮID'
   COMMENT ON COLUMN "WORK"."WORK_PRIORITY" IS '�켱����'
   COMMENT ON COLUMN "WORK"."WORK_TITLE" IS '����'
   COMMENT ON COLUMN "WORK"."WORK_DATE" IS '���� ��¥'
   COMMENT ON COLUMN "WORK"."WORK_PROGRESS" IS '��ô��'
   COMMENT ON COLUMN "WORK"."WORK_TIME" IS '�����ð�'
   COMMENT ON COLUMN "WORK"."WORK_START" IS '������'
   COMMENT ON COLUMN "WORK"."WORK_END" IS '������'
   COMMENT ON COLUMN "WORK"."WORK_STATUS" IS '����'
   COMMENT ON TABLE "WORK"  IS '�ϰ�'
REM INSERTING into ACADEMIC
SET DEFINE OFF;
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (21,'b002','����б�','����','ȿ����б�','����',to_date('79/09/01','RR/MM/DD'),to_date('85/11/01','RR/MM/DD'),'y');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (46,'free','������','����','���ִ��б�','������Ű��к�',to_date('84/02/01','RR/MM/DD'),null,'y');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (63,'test','����б�','����','���ʰ���б�','-',to_date('90/03/01','RR/MM/DD'),to_date('93/02/01','RR/MM/DD'),'y');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (61,'qwer','���б�','����','�������б�','����������հ��к�',to_date('02/05/01','RR/MM/DD'),to_date('08/04/01','RR/MM/DD'),'y');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (62,'test','���п�','����','������б�','��ǻ�Ͱ���',to_date('95/01/01','RR/MM/DD'),to_date('97/02/01','RR/MM/DD'),'n');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (64,'test','���б�','����','������б�','��ǻ�Ͱ���',to_date('03/03/01','RR/MM/DD'),to_date('09/02/01','RR/MM/DD'),'y');
Insert into ACADEMIC (AC_NUM,MEM_ID,AC_TYPE,AC_FINAL,AC_SCHOOL,AC_MAJOR,AC_IN,AC_OUT,AC_STATUS) values (41,'free','������','����','������б�','������Ű��к�',to_date('84/03/01','RR/MM/DD'),to_date('88/04/01','RR/MM/DD'),'n');
REM INSERTING into ALARM
SET DEFINE OFF;
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('c001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('e001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('s001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('dhaudgkr','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('dkvkehdkvk','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('cheeze','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('sysy','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('qwer','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('zxcv','n','y','y','n','y','n');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('nworang','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('asdfadsf','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('sdfsd','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('asdfasdf','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('a001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('designer','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('hello3','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('a002','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('a003','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('admin','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('client','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('free','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('test','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('asdf','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('black','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('1004','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('b002','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('b003','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('seojin','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('b007','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('b006','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('hello77','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('freelancer','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('asdfadfasd','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('b007s','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('jns37789','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('cli001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('psc9422','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('freesichan','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('clientsichan','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('client9422','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('free0001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('test001','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('test002','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('cccc','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('dkssud','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('testfree','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('testclient','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('qkrtlcks9422','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('kyg3333','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('pac9422','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('asdfasdf1','y','y','y','y','y','y');
Insert into ALARM (MEM_ID,AR_PH_PROJECT,AR_MA_PROJECT,AR_PH_APPLY,AR_MA_APPLY,AR_PH_CON,AR_MA_CON) values ('qkrtlcks94','y','y','y','y','y','y');
REM INSERTING into ALARM_MESSAGE
SET DEFINE OFF;
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (486,null,'client',7,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (811,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (813,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (814,null,'free',15,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (815,null,'test',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (820,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (821,null,'free',15,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (822,null,'free',6,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (823,null,'test',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (824,null,'test',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (825,null,'free',7,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (826,null,'test',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (912,null,'zxcv',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (913,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (914,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (915,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (916,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (917,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (918,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (919,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (921,null,'zxcv',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (924,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (926,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (928,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (930,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (953,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (954,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (955,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (956,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1005,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1060,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1061,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1062,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1063,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1064,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1068,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1069,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1071,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1073,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1075,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1156,null,'dhaudgkr',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1170,null,'cheeze',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1171,null,'dhaudgkr',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1172,null,'dhaudgkr',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1173,null,'cheeze',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1174,null,'cheeze',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1202,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1203,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1205,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1209,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1215,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1216,null,'qwer',42,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1217,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1218,null,'sysy',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (957,null,'zxcv',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (958,null,'qwer',18,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (959,null,'qwer',19,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (960,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (961,null,'qwer',21,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (962,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (963,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (964,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (965,null,'qwer',22,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (966,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (967,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (968,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (969,null,'hello3',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (970,null,'hello3',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (971,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (972,null,'hello3',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (973,null,'qwer',24,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (974,null,'qwer',25,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (975,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (976,null,'qwer',27,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (977,null,'qwer',29,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (978,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (979,null,'qwer',31,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (980,null,'qwer',32,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (981,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (982,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (983,null,'qwer',34,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (984,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (985,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (986,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (987,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (988,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (989,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (990,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1168,null,'dhaudgkr',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1207,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1211,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1227,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1228,null,'qwer',43,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1229,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1230,null,'sysy',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1231,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1232,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1233,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1234,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1235,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1236,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1237,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1238,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1239,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1240,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1241,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (507,null,'client',1,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (509,null,'client',8,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (511,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (515,null,'zxcv',1,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (517,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (519,null,'client',9,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (521,null,'asdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (541,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (542,null,'qwer',26,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (543,null,'test',1,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (544,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (545,null,'qwer',28,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (546,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (547,null,'zxcv',16,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (548,null,'zxcv',16,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (549,null,'zxcv',16,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (550,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (551,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (552,null,'qwer',30,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (553,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (554,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (555,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (556,null,'qwer',33,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (557,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (566,null,'qwer',1,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (567,null,'free',20,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (568,null,'qwer',35,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (569,null,'free',20,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (570,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (571,null,'qwer',36,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (572,null,'qwer',53,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (573,null,'free',20,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (574,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (575,null,'free',1,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (576,null,'qwer',54,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (577,null,'free',20,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (855,null,'qwer',43,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (856,null,'free',15,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (932,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (934,null,'zxcv',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (936,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (937,null,'qwer',42,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (938,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (939,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (940,null,'hello3',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (941,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (942,null,'hello3',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (943,null,'qwer',62,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (944,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (945,null,'qwer',64,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (946,null,'designer',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (947,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (591,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (592,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (593,null,'free',5,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (594,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (595,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (596,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (597,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (598,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (599,null,'free',18,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (600,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (948,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (949,null,'c001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (950,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (951,null,'asdfasdf',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (952,null,'zxcv',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1027,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1029,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1031,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1032,null,'free',14,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1033,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1034,null,'qwer',41,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1035,null,'free',14,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1036,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1037,null,'qwer',40,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1038,null,'free',14,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1039,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1040,null,'qwer',39,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1041,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1042,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1043,null,'cli001',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1044,null,'free',14,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1045,null,'free',7,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1046,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1047,null,'qwer',65,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1048,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1049,null,'free',8,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1050,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1051,null,'qwer',66,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1052,null,'qwer',37,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1053,null,'free',9,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1054,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1055,null,'qwer',67,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1057,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1191,null,'jns37789',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1219,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1220,null,'qwer',44,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1221,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1222,null,'sysy',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1223,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1224,null,'qwer',45,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1225,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1226,null,'sysy',1,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (536,null,'zxcv',24,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (538,null,'zxcv',24,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (540,null,'zxcv',24,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (558,null,'qwer',37,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (559,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (560,null,'qwer',39,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (561,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (562,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (563,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (564,null,'qwer',20,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (565,null,'test',6,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (583,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (585,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (587,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (589,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (601,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (602,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (603,null,'free',8,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (604,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (605,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (606,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (607,null,'free',7,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (608,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (609,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (610,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (611,null,'free',6,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (612,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (613,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (614,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (615,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (616,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (617,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (618,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (619,null,'free',18,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (620,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (621,null,'free',18,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (622,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (623,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (624,null,'free',18,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (625,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (626,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (627,null,'b002',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (628,null,'b003',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (629,null,'free',18,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (630,null,'test',2,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (816,null,'free',15,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (817,null,'test',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (818,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (819,null,'client',5,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1263,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1264,null,'qwer',46,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1265,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1266,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1267,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1268,null,'qwer',47,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1269,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1270,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1374,null,'clientsichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1389,null,'qkrtlcks9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1404,null,'qkrtlcks9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1309,null,'qkrtlcks94',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1310,null,'qkrtlcks94',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1312,null,'qkrtlcks94',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1330,null,'client9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1333,null,'client9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1334,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1335,null,'client9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1336,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1337,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1386,null,'qkrtlcks9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1294,null,'dkssud',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1346,null,'clientsichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1349,null,'clientsichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1361,null,'testclient',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1362,null,'testfree',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1363,null,'testclient',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1364,null,'testfree',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1365,null,'testfree',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1376,null,'clientsichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1377,null,'freesichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1378,null,'freesichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1390,null,'free0001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1242,null,'client',4,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1243,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1244,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1245,null,'qwer',66,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1246,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1247,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1248,null,'qwer',48,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1249,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1250,null,'qwer',67,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1251,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1252,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1253,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1254,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1255,null,'qwer',68,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1256,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1257,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1258,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1259,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1260,null,'qwer',69,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1261,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1262,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1271,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1272,null,'qwer',49,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1273,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1274,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1275,null,'seojin',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1276,null,'qwer',50,'n');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1277,null,'a001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1278,null,'sysy',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1357,null,'testclient',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1371,null,'clientsichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1313,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1314,null,'qkrtlcks94',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1315,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1316,null,'free',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1375,null,'freesichan',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1391,null,'qkrtlcks9422',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1392,null,'free0001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1393,null,'free0001',0,'y');
Insert into ALARM_MESSAGE (ARMSG_NUM,PR_NUM,MEM_ID,ARMSG_HIT,ARMSG_STAUTS) values (1406,null,'qkrtlcks9422',0,'y');
REM INSERTING into APMEETING
SET DEFINE OFF;
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (810,'client','free',to_date('19/03/20','RR/MM/DD'),to_date('19/03/15','RR/MM/DD'),'ektl','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (812,'client','test',to_date('19/03/30','RR/MM/DD'),to_date('19/03/15','RR/MM/DD'),'�ȵȴ�.','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1348,'clientsichan','freesichan',to_date('19/03/28','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'���ð��� �����Դϴ�.','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (506,'client','qwer',to_date('19/03/22','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'�ȳ�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (505,'client','free',to_date('19/03/30','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'�ȳ�ȳ�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1388,'qkrtlcks9422','free0001',to_date('19/03/20','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'������Ʈ ���� �����ϰ�ͽ��ϴ�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (927,'jns37789','qwer',to_date('19/03/30','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (935,'jns37789','b002',to_date('19/03/30','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (923,'asdfasdf','c001',to_date('19/03/29','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (931,'asdfasdf','hello3',to_date('19/03/29','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (925,'asdf','qwer',to_date('19/03/31','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (929,'asdf','designer',to_date('19/03/31','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (920,'zxcv','c001',to_date('19/04/01','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (933,'zxcv','b002',to_date('19/04/01','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'hi','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1026,'cli001','free',to_date('19/03/18','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),'�ȳ��ϼ���','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1028,'cli001','b002',to_date('19/03/18','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),'asdasd','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1030,'cli001','qwer',to_date('19/03/18','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),'�ȳ�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1332,'client9422','free',to_date('19/03/21','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'���ð��� �����Դϴ�.','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1373,'clientsichan','freesichan',to_date('19/03/20','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'������Ʈ ���� �����սô�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1360,'testclient','testfree',to_date('19/03/20','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'���ð��� �����Դϴ�.','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1311,'qkrtlcks94','free',to_date('19/03/22','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'����','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1167,'dhaudgkr','cheeze',to_date('19/03/19','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'������','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1405,'qkrtlcks9422','freesichan',to_date('19/03/20','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'������Ʈ ����','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (539,'zxcv','qwer',to_date('19/03/30','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'1151565','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (582,'client','b002',to_date('19/03/13','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'awdawda','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (535,'zxcv','test',to_date('19/03/22','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'�ȳ��ϼ���','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (537,'zxcv','a001',to_date('19/03/23','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'asdasd','1','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (584,'client','b003',to_date('19/03/21','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'awdawdawd','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (586,'client','free',to_date('19/03/19','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'asdsadad','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1059,'asdfasdf','b002',to_date('19/03/21','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),'�ȳ��ϼ���','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (588,'client','test',to_date('19/03/23','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),'�ȳ��ϼ���','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1070,'asdfasdf','test',to_date('19/03/19','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),'aaaaaa','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1206,'client','sysy',to_date('19/03/26','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'����� ���� ���ð�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1210,'client','seojin',to_date('19/03/21','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'���� ��¥ �����մϴ�.','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1208,'client','a001',to_date('19/03/22','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'����� ���� ���ð�','0','1','1','y');
Insert into APMEETING (APMT_NUM,MT_FROM,MT_TO,MT_DATE,MT_TIME,MT_MEMO,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (1204,'client','qwer',to_date('19/03/25','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'����� ���� ���ð�','0','1','1','y');
REM INSERTING into APPLY
SET DEFINE OFF;
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (920,'c001',908,2000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (810,'free',261,6000000,to_date('19/03/15','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (812,'test',261,8000000,to_date('19/03/15','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (923,'c001',897,10000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (925,'qwer',901,5000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (927,'qwer',893,10000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (929,'designer',901,2000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1074,'test',39,10000000,to_date('19/03/18','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1204,'qwer',1197,4000000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1208,'a001',1197,5000000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1388,'free0001',1381,20000000,to_date('19/03/20','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1206,'sysy',1197,4500000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1210,'seojin',1197,5500000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1348,'freesichan',1341,20000000,to_date('19/03/20','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1167,'cheeze',1148,4800000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (510,'qwer',39,2000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (514,'free',282,20000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (516,'qwer',258,20000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (518,'test',74,1500000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (520,'test',258,40000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (931,'hello3',897,5000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (933,'b002',908,3000000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (935,'b002',893,7500000,to_date('19/03/16','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (506,'qwer',1,2000000,to_date('19/03/13','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (508,'qwer',74,1500000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1026,'free',1001,15000000,to_date('19/03/18','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1028,'b002',1001,5800000,to_date('19/03/18','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1030,'qwer',1001,15000000,to_date('19/03/18','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1056,'free',259,14000000,to_date('19/03/18','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1332,'free',1325,10000000,to_date('19/03/19','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1360,'testfree',1352,200000000,to_date('19/03/20','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1405,'freesichan',1401,1000000,to_date('19/03/20','RR/MM/DD'),'2');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1190,'sysy',804,5000000,to_date('19/03/19','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1373,'freesichan',1368,20000000,to_date('19/03/20','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (505,'free',1,800000,to_date('19/03/13','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (535,'test',283,5000000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (537,'a001',283,15000000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (539,'qwer',283,5000000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (503,'free',258,1000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (504,'free',74,2000000,to_date('19/03/13','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (582,'b002',254,4800000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (584,'b003',254,8500000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (586,'free',254,12000000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (588,'test',254,18000000,to_date('19/03/14','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1059,'b002',84,50000000,to_date('19/03/18','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1070,'test',1065,500000,to_date('19/03/18','RR/MM/DD'),'y');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1072,'test',259,500000,to_date('19/03/18','RR/MM/DD'),'0');
Insert into APPLY (AP_NUM,AP_FREE,AP_PROJECT,AP_PAYMENT,AP_DATE,AP_STATUS) values (1311,'free',1298,40000000,to_date('19/03/19','RR/MM/DD'),'y');
REM INSERTING into BANK
SET DEFINE OFF;
Insert into BANK (BANK_CODE,BANK_NAME) values (1,'�ѱ�����');
Insert into BANK (BANK_CODE,BANK_NAME) values (2,'�������');
Insert into BANK (BANK_CODE,BANK_NAME) values (3,'�������');
Insert into BANK (BANK_CODE,BANK_NAME) values (4,'��������');
Insert into BANK (BANK_CODE,BANK_NAME) values (11,'��������');
Insert into BANK (BANK_CODE,BANK_NAME) values (20,'�츮����');
Insert into BANK (BANK_CODE,BANK_NAME) values (23,'SC��������');
Insert into BANK (BANK_CODE,BANK_NAME) values (27,'�ѱ���Ƽ����');
Insert into BANK (BANK_CODE,BANK_NAME) values (32,'�λ�����');
Insert into BANK (BANK_CODE,BANK_NAME) values (45,'�������ݰ��߾�ȸ');
Insert into BANK (BANK_CODE,BANK_NAME) values (48,'����');
Insert into BANK (BANK_CODE,BANK_NAME) values (71,'��ü��');
Insert into BANK (BANK_CODE,BANK_NAME) values (81,'KEB�ϳ�����');
Insert into BANK (BANK_CODE,BANK_NAME) values (89,'���̹�ũ');
Insert into BANK (BANK_CODE,BANK_NAME) values (90,'īī����ũ');
REM INSERTING into BANK_ACCOUNT
SET DEFINE OFF;
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (26,'151-4844-4846','dhaudgkr',11,'������');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (23,'1110-225-556-7771536','a003',48,'�Ŷ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (24,'111-1111-11111-1111111','asdf',1,'ȫ�浿');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (27,'352-1515-4848-48','cheeze',11,'������');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (42,'10021-151-4515','clientsichan',3,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (43,'1002-847-604641','freesichan',3,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (47,'1002-847-604641','free0001',2,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (41,'1002-847-604641','client9422',20,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (46,'1002-847-604641','qkrtlcks9422',11,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (11,'151-454-4848-412','free',1,'����');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (12,'1002-847-604641','test',23,'������');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (22,'110-3232-4456-4835515','a002',1,'��Ű');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (44,'1002-847-604641','testclient',4,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (45,'1002-847-604641','testfree',2,'�ڽ���');
Insert into BANK_ACCOUNT (AC_NUM,AC_ACCOUNT,AC_MEM,AC_BANK,AC_NAME) values (25,'1004-1004-1004','1004',4,'����');
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (41,'free',85,'����',to_date('19/03/07','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (43,'free',318,'����',to_date('19/03/07','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (101,'a003',4,'��Ӵϴ� ¥����� �ȴٰ��ϼ̾�',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (102,'1004',4,'����Ȱ�� ���������ź� ���ؿ�~',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (25,'free',5,'asdfa',to_date('19/02/25','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (26,'free',1,'a',to_date('19/02/25','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (27,'free',6516,'�ð�',to_date('19/02/25','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (108,'sysy',144,'���ƾƾƾ�',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (21,'client',77,'�� ���� �Ƿ��ϴ� �� ����� �󸶳� �ʿ��ұ��?',to_date('19/02/15','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (22,'client',73,'�� ���� ����, �� õ�������ΰ���?',to_date('19/02/15','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (23,'free',6,'2018�⿡ �ָ��ؾ��� ���ü�� ��ŸƮ�� TOP 8',to_date('19/02/15','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (18,'free',120,'����',to_date('19/02/25','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (109,'free',1,'fasDfas',to_date('19/03/20','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (3,'free',179,'���̴� �Ӷ�',to_date('19/02/25','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (24,'free',157,'�ڰ�',to_date('19/02/25','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (103,'asdf',3,'���� ��õ��',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (104,'b002',8,'������Ʈ ���ÿ� ������ �غ��ź�?',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (105,'c001',5,'��r�� ��r�� ������ �기��r',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (106,'black',3,'�� �����ϱ� �����..',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (107,'nworang',10,'�� �Ӹ���',to_date('19/03/19','RR/MM/DD'),'y');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (61,'free',8,'4144',to_date('19/03/14','RR/MM/DD'),'n');
Insert into BOARD (BO_NUM,MEM_ID,BO_HIT,BO_TITLE,BO_DATE,BO_STATUS) values (62,'free',28,'4144',to_date('19/03/14','RR/MM/DD'),'n');
REM INSERTING into BOARD_FILE
SET DEFINE OFF;
Insert into BOARD_FILE (BOFILE_NUM,BO_NUM,BOFILE_NAME,BOFILE_SAVE_NAME,BOFILE_TYPE,BOFILE_SIZE,BOFILE_STATUS,BOFILE_DATE) values (41,43,'Penguins.jpg','Penguins1857cbb9f57d47219ebf1dea1cafa6aa.jpg','image/jpeg',777835,'y',to_date('19/03/07','RR/MM/DD'));
Insert into BOARD_FILE (BOFILE_NUM,BO_NUM,BOFILE_NAME,BOFILE_SAVE_NAME,BOFILE_TYPE,BOFILE_SIZE,BOFILE_STATUS,BOFILE_DATE) values (61,3,'Lighthouse.jpg','Lighthouse69c6100656bb4827afca6ad06981a725.jpg','image/jpeg',561276,'n',to_date('19/03/20','RR/MM/DD'));
Insert into BOARD_FILE (BOFILE_NUM,BO_NUM,BOFILE_NAME,BOFILE_SAVE_NAME,BOFILE_TYPE,BOFILE_SIZE,BOFILE_STATUS,BOFILE_DATE) values (62,109,'Lighthouse.jpg','Lighthouse4be6062bcbeb48838f35ff03d5d95ede.jpg','image/jpeg',561276,'y',to_date('19/03/20','RR/MM/DD'));
Insert into BOARD_FILE (BOFILE_NUM,BO_NUM,BOFILE_NAME,BOFILE_SAVE_NAME,BOFILE_TYPE,BOFILE_SIZE,BOFILE_STATUS,BOFILE_DATE) values (2,23,'Jellyfish.jpg','Jellyfishaffbc7f32f9548599677e4befa60b4ef.jpg','image/jpeg',775702,'y',to_date('19/02/23','RR/MM/DD'));
Insert into BOARD_FILE (BOFILE_NUM,BO_NUM,BOFILE_NAME,BOFILE_SAVE_NAME,BOFILE_TYPE,BOFILE_SIZE,BOFILE_STATUS,BOFILE_DATE) values (21,27,'Koala.jpg','Koala4af3102ecc4c43c4a466e515ed7645a6.jpg','image/jpeg',780831,'n',to_date('19/03/04','RR/MM/DD'));
REM INSERTING into BOARD_REPLY
SET DEFINE OFF;
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (9,27,'free',to_date('19/02/25','RR/MM/DD'),0,9,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (85,27,'client',to_date('19/03/04','RR/MM/DD'),1,6,1,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (86,27,'free',to_date('19/03/04','RR/MM/DD'),0,86,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (87,27,'free',to_date('19/03/04','RR/MM/DD'),0,87,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (89,27,'free',to_date('19/03/04','RR/MM/DD'),2,82,2,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (90,27,'free',to_date('19/03/03','RR/MM/DD'),1,82,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (125,27,'free',to_date('19/03/07','RR/MM/DD'),0,125,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (223,62,'free',to_date('19/03/15','RR/MM/DD'),0,223,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (225,21,'free',to_date('19/03/15','RR/MM/DD'),1,84,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (6,27,'free',to_date('19/02/25','RR/MM/DD'),0,6,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (7,27,'free',to_date('19/02/25','RR/MM/DD'),0,7,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (10,18,'free',to_date('19/02/25','RR/MM/DD'),0,10,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (13,22,'client',to_date('19/02/26','RR/MM/DD'),0,13,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (69,27,'free',to_date('19/02/28','RR/MM/DD'),1,7,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (91,3,'free',to_date('19/03/05','RR/MM/DD'),1,83,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (92,3,'free',to_date('19/03/05','RR/MM/DD'),2,83,2,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (93,3,'free',to_date('19/03/05','RR/MM/DD'),3,83,4,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (123,24,'free',to_date('19/03/07','RR/MM/DD'),0,123,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (19,21,'free',to_date('19/02/26','RR/MM/DD'),0,19,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (241,62,'free',to_date('19/03/16','RR/MM/DD'),0,241,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (8,27,'free',to_date('19/02/25','RR/MM/DD'),0,8,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (11,24,'client',to_date('19/02/26','RR/MM/DD'),0,11,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (81,27,'client',to_date('19/03/04','RR/MM/DD'),1,7,2,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (82,27,'client',to_date('19/03/02','RR/MM/DD'),0,82,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (96,27,'client',to_date('19/03/05','RR/MM/DD'),0,96,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (97,27,'client',to_date('19/03/05','RR/MM/DD'),0,97,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (109,27,'client',to_date('19/03/05','RR/MM/DD'),0,109,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (110,18,'client',to_date('19/03/05','RR/MM/DD'),0,110,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (161,27,'free',to_date('19/03/09','RR/MM/DD'),3,125,3,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (162,27,'free',to_date('19/03/09','RR/MM/DD'),1,125,4,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (163,27,'free',to_date('19/03/09','RR/MM/DD'),2,125,6,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (164,27,'free',to_date('19/03/09','RR/MM/DD'),3,125,7,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (165,27,'free',to_date('19/03/09','RR/MM/DD'),2,125,5,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (219,41,'free',to_date('19/03/14','RR/MM/DD'),0,219,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (220,41,'free',to_date('19/03/14','RR/MM/DD'),1,218,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (94,3,'free',to_date('19/03/05','RR/MM/DD'),4,83,5,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (95,3,'client',to_date('19/03/05','RR/MM/DD'),3,83,3,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (124,27,'free',to_date('19/03/07','RR/MM/DD'),0,124,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (141,27,'free',to_date('19/03/08','RR/MM/DD'),1,125,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (142,27,'free',to_date('19/03/08','RR/MM/DD'),1,109,1,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (143,27,'free',to_date('19/03/08','RR/MM/DD'),2,125,2,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (285,3,'client',to_date('19/03/19','RR/MM/DD'),0,285,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (221,62,'seojin',to_date('19/03/14','RR/MM/DD'),0,221,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (12,3,'client',to_date('19/02/26','RR/MM/DD'),0,12,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (83,3,'client',to_date('19/03/04','RR/MM/DD'),0,83,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (84,21,'client',to_date('19/03/04','RR/MM/DD'),0,84,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (211,41,'free',to_date('19/03/14','RR/MM/DD'),0,211,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (212,41,'free',to_date('19/03/14','RR/MM/DD'),0,212,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (218,41,'free',to_date('19/03/14','RR/MM/DD'),0,218,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (222,62,'free',to_date('19/03/15','RR/MM/DD'),0,222,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (224,62,'free',to_date('19/03/15','RR/MM/DD'),1,221,1,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (261,3,'free',to_date('19/03/18','RR/MM/DD'),0,261,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (281,107,'sysy',to_date('19/03/19','RR/MM/DD'),0,281,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (282,103,'sysy',to_date('19/03/19','RR/MM/DD'),0,282,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (283,108,'nworang',to_date('19/03/19','RR/MM/DD'),0,283,0,'n');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (284,101,'nworang',to_date('19/03/19','RR/MM/DD'),0,284,0,'y');
Insert into BOARD_REPLY (BORE_NUM,BO_NUM,MEM_ID,BORE_DATE,BORE_DEPTH,BORE_GROUP,BORE_SEQ,BORE_STATUS) values (286,104,'free',to_date('19/03/19','RR/MM/DD'),0,286,0,'y');
REM INSERTING into CAREER
SET DEFINE OFF;
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (21,'b002','���',to_date('17/11/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),'y','��','�Ƶ�');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (61,'qwer','������簳��ȸ��',to_date('85/06/01','RR/MM/DD'),to_date('10/05/01','RR/MM/DD'),'y','����','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (62,'test','������簳�߿�',to_date('17/07/01','RR/MM/DD'),to_date('19/03/01','RR/MM/DD'),'n','���ߺ�','���');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (63,'test','(��)�Ｚ����',to_date('10/04/01','RR/MM/DD'),to_date('16/12/01','RR/MM/DD'),'n','������','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (64,'test','������簳�߿�',to_date('17/01/01','RR/MM/DD'),to_date('19/03/01','RR/MM/DD'),'n','������','���');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (51,'free','�������ȸ��',to_date('73/03/01','RR/MM/DD'),to_date('75/04/01','RR/MM/DD'),'n','������','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (65,'test','������簳�߿�',to_date('10/08/01','RR/MM/DD'),to_date('12/09/01','RR/MM/DD'),'y','���ߺ�','���');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (66,'test','(��)�Ｚ����',to_date('13/06/01','RR/MM/DD'),to_date('18/12/01','RR/MM/DD'),'y','������','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (44,'free','�������ȸ��',to_date('72/06/01','RR/MM/DD'),to_date('73/07/01','RR/MM/DD'),'n','������','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (52,'free','�������ȸ��',to_date('74/07/01','RR/MM/DD'),to_date('74/11/01','RR/MM/DD'),'y','������','����');
Insert into CAREER (CA_NUM,MEM_ID,CA_COMPANY,CA_IN,CA_OUT,CA_STATUS,CA_DEPARTMENT,CA_POSITION) values (56,'free','�������ȸ��2',to_date('76/03/01','RR/MM/DD'),null,'n','������','����');
REM INSERTING into CATEGORY
SET DEFINE OFF;
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (2,0,'���ø����̼�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (3,0,'����������');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (4,0,'�ۺ���');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (5,0,'�Ϲ� ����Ʈ����');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (6,0,'Ŀ�ӽ�, ���θ�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (7,0,'����');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (8,0,'�Ӻ����');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (9,0,'��Ÿ');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (10,1,'��');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (11,1,'���ø����̼�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (12,1,'��ǰ');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (13,1,'���������̼�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (14,1,'�μ⹰');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (15,1,'Ŀ�ӽ�, ���θ�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (16,1,'�ΰ�');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (17,1,'�׷���');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (18,1,'����');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (19,1,'����');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (20,1,'��Ÿ');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (1,0,'��');
Insert into CATEGORY (CATE_NUM,CATE_CATEGORY,CATE_DETAIL) values (21,1,'�Ӻ����');
REM INSERTING into CHAT
SET DEFINE OFF;
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (100,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (101,'free',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (102,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (103,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (104,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (105,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (106,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (94,'free',1,to_date('19/03/18','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (99,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (107,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (108,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (109,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (110,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (111,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (114,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (117,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (151,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (152,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (87,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (85,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (86,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (88,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (89,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (90,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (91,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (92,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (93,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (122,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (123,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (128,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (150,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (154,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (158,'client',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.91');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (159,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (83,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (60,'qwer',1,to_date('19/03/16','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (61,'qwer',1,to_date('19/03/16','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (84,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (116,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (120,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (121,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (126,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (127,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (21,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (22,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (26,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (27,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (28,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (29,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (97,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (98,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (125,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (155,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (156,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (157,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (160,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (48,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (95,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (96,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'0:0:0:0:0:0:0:1');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (80,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (23,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (24,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (25,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (81,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (82,'free',1,to_date('19/03/18','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (112,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (113,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (115,'qwer',1001,to_date('19/03/18','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (124,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (129,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (49,'client',1,to_date('19/03/14','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (130,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (131,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (132,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (133,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (134,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (135,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (136,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (137,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (138,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (139,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (140,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (141,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (142,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (143,'a001',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.135');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (144,'client',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.126');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (145,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (146,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (147,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (148,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (149,'seojin',1197,to_date('19/03/19','RR/MM/DD'),'192.168.0.136');
Insert into CHAT (CHAT_NUM,MEM_ID,PR_NUM,CHAT_DATE,CHAT_IP) values (153,'qwer',1197,to_date('19/03/20','RR/MM/DD'),'192.168.0.121');
REM INSERTING into CONSTRACT
SET DEFINE OFF;
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (119,'free0001',1381,150,20000000,to_date('19/03/20','RR/MM/DD'),1,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (48,'qwer',1,30,1800000,to_date('19/03/14','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (49,'free',1,25,780000,to_date('19/03/14','RR/MM/DD'),6,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (116,'freesichan',1341,null,null,null,null,'0','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (118,'freesichan',1368,140,20000000,to_date('19/03/20','RR/MM/DD'),1,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (83,'c001',897,100,10000000,to_date('19/03/16','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (84,'hello3',897,100,5000000,to_date('19/03/16','RR/MM/DD'),3,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (85,'qwer',901,100,5000000,to_date('19/03/16','RR/MM/DD'),3,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (81,'qwer',893,100,1000000,to_date('19/03/16','RR/MM/DD'),2,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (86,'designer',901,100,2000000,to_date('19/03/16','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (82,'b002',893,100,5000000,to_date('19/03/16','RR/MM/DD'),3,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (87,'c001',908,100,20000000,to_date('19/03/16','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (88,'b002',908,100,2000000,to_date('19/03/16','RR/MM/DD'),4,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (101,'free',1001,120,15000000,to_date('19/03/18','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (102,'b002',1001,120,5700000,to_date('19/03/18','RR/MM/DD'),3,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (103,'qwer',1001,120,13000000,to_date('19/03/18','RR/MM/DD'),4,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (115,'free',1325,120,10000000,to_date('19/03/19','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (117,'testfree',1352,150,200000000,to_date('19/03/20','RR/MM/DD'),3,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (114,'free',1298,120,40000000,to_date('19/03/19','RR/MM/DD'),1,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (105,'test',1065,null,null,null,null,'0','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (106,'cheeze',1148,120,4700000,to_date('19/03/19','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (52,'a001',283,30,14500000,to_date('19/03/14','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (61,'b002',254,20,4700000,to_date('19/03/15','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (51,'qwer',283,30,4500000,to_date('19/03/14','RR/MM/DD'),3,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (53,'test',283,25,4800000,to_date('19/03/14','RR/MM/DD'),4,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (62,'b003',254,30,8300000,to_date('19/03/15','RR/MM/DD'),4,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (63,'free',254,30,11000000,to_date('19/03/15','RR/MM/DD'),2,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (64,'test',254,43,17000000,to_date('19/03/15','RR/MM/DD'),0,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (65,'free',261,30,5800000,to_date('19/03/15','RR/MM/DD'),1,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (66,'test',261,60,7800000,to_date('19/03/15','RR/MM/DD'),2,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (104,'b002',84,120,48000000,to_date('19/03/18','RR/MM/DD'),2,'y','1');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (107,'seojin',1197,150,4500000,to_date('19/03/19','RR/MM/DD'),3,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (108,'qwer',1197,150,3000000,to_date('19/03/19','RR/MM/DD'),4,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (109,'a001',1197,150,4000000,to_date('19/03/19','RR/MM/DD'),1,'y','0');
Insert into CONSTRACT (CONS_NUM,CONS_FREE_ID,CONS_PROJ_NUM,CONS_PERIOD,CONS_PAYMENT,CONS_DATE,PART_NUM,CONS_STATUS,CONS_ENDCHECK) values (112,'sysy',1197,150,3500000,to_date('19/03/19','RR/MM/DD'),6,'y','0');
REM INSERTING into CONSTRACT_FILE
SET DEFINE OFF;
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (65,'������ ������Ʈ �ۺ��̰� ������Ʈ ��༭.jpg','������ ������Ʈ �ۺ��̰� ������Ʈ ��༭7a1f18e30f854313b29d3c7d25f83fec.jpg','image/jpeg',101447,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (106,'constract.jpg','constract1c236aa1c05e4b3aa82ff5ba90c5f0d2.jpg','image/jpeg',102218,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (82,'������ �м��Ƿ� �� �����ý��� ����� ������Ʈ ��༭.jpg','������ �м��Ƿ� �� �����ý��� ����� ������Ʈ ��༭7af2a6f7706749e487f13cee9acbb4eb.jpg','image/jpeg',100998,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (53,'contract.jpg','contractf9d3eb51362d4a75a8465cb07213f7ed.jpg','image/jpeg',101660,'y',to_date('19/03/14','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (48,'contract.jpg','contract7be10a757eeb40819e839526baaa5faa.jpg','image/jpeg',100332,'y',to_date('19/03/14','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (52,'contract.jpg','contracta0d00fda311d40189ccab063d32d67da.jpg','image/jpeg',101637,'y',to_date('19/03/14','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (51,'contract.jpg','contractd71dbd926ba548a6ae4bf90d3bdd0403.jpg','image/jpeg',101660,'y',to_date('19/03/14','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (49,'contract.jpg','contract6da86501bcea40d49574630777decb5f.jpg','image/jpeg',100589,'y',to_date('19/03/14','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (81,'������ �м��Ƿ� �� �����ý��� ����� ������Ʈ ��༭.jpg','������ �м��Ƿ� �� �����ý��� ����� ������Ʈ ��༭381400f171cd4d6a8a7ecf2ba8ed6645.jpg','image/jpeg',101158,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (83,'������ ���� � �� ������ ������Ʈ ��༭.jpg','������ ���� � �� ������ ������Ʈ ��༭a439ffba503b4ce89503dff8aeae7486.jpg','image/jpeg',100391,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (84,'������ ���� � �� ������ ������Ʈ ��༭.jpg','������ ���� � �� ������ ������Ʈ ��༭8dc9a0c742f242938e4507147da91359.jpg','image/jpeg',100544,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (85,'���� ���� ���� �� Ǯ�� �� ����Ʈ �÷��� ����� ������Ʈ ��༭.jpg','���� ���� ���� �� Ǯ�� �� ����Ʈ �÷��� ����� ������Ʈ ��༭8e776cecb09c44439a7d82fff8ea9ca1.jpg','image/jpeg',101802,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (86,'���� ���� ���� �� Ǯ�� �� ����Ʈ �÷��� ����� ������Ʈ ��༭.jpg','���� ���� ���� �� Ǯ�� �� ����Ʈ �÷��� ����� ������Ʈ ��༭f09d30e7c5384ec4b462c458053c3b27.jpg','image/jpeg',102058,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (87,'���������� ����Ʈ ������ ������ �� ���ð� ������Ʈ ��༭.jpg','���������� ����Ʈ ������ ������ �� ���ð� ������Ʈ ��༭0987f59cf08e4d26a505dd0b98eea153.jpg','image/jpeg',101340,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (88,'���������� ����Ʈ ������ ������ �� ���ð� ������Ʈ ��༭.jpg','���������� ����Ʈ ������ ������ �� ���ð� ������Ʈ ��༭ef9410f4d33f46ad8ecbe2811f9dd734.jpg','image/jpeg',101340,'y',to_date('19/03/16','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (101,'�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭.jpg','�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭5e09b68c86894ef19d67c855687021bc.jpg','image/jpeg',101311,'y',to_date('19/03/18','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (102,'�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭.jpg','�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭0a51db3557b14adfb72fe9919896fdfd.jpg','image/jpeg',101311,'y',to_date('19/03/18','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (103,'�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭.jpg','�ڻ� �ַ�� �ΰ����� AI ��� ���߰� ������Ʈ ��༭107602c6ce8240bca3fc96dd9f897568.jpg','image/jpeg',101311,'y',to_date('19/03/18','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (108,'constract.jpg','constractb3d337ddf08d4bfcb787ec07189f2e76.jpg','image/jpeg',101614,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (109,'constract.jpg','constract8df1ca72d0c345909d8debb1a3c65bc8.jpg','image/jpeg',101614,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (112,'constract.jpg','constract591700b710bc4dff99927dfc37ccfe28.jpg','image/jpeg',101614,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (115,'constract.jpg','constractde6eba8f0d174614ba7f0a528be259a8.jpg','image/jpeg',100170,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (117,'constract.jpg','constract98c8daef83974817b8c2c5876b52e6fe.jpg','image/jpeg',99821,'y',to_date('19/03/20','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (118,'constract.jpg','constractf1c2e367b3604db5a9774e2ac908c2d2.jpg','image/jpeg',100395,'y',to_date('19/03/20','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (61,'�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭.jpg','�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭12f4dc59be084111887cb1d6465a0ebd.jpg','image/jpeg',103092,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (114,'constract.jpg','constract709f592b25604a20b89b41c228cb7bc4.jpg','image/jpeg',99776,'y',to_date('19/03/19','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (119,'constract.jpg','constract434273a8b9ed4d9fb93dfd328e3f59f0.jpg','image/jpeg',100108,'y',to_date('19/03/20','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (64,'�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭.jpg','�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭35c5a92dc6c041b29f3d009f5195417a.jpg','image/jpeg',103603,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (62,'�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭.jpg','�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭7d03926d5e9c4bac932c3b58ff933e62.jpg','image/jpeg',103074,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (63,'�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭.jpg','�����ڿ� ������ ���� �� �������� ��� Web �÷��� ����� ������Ʈ ��༭176febcd129545f589055a3264c62a9a.jpg','image/jpeg',103603,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (66,'������ ������Ʈ �ۺ��̰� ������Ʈ ��༭.jpg','������ ������Ʈ �ۺ��̰� ������Ʈ ��༭756f4e0e79094a6caa018564238c9875.jpg','image/jpeg',101447,'y',to_date('19/03/15','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (104,'constract.jpg','constract7c121b5b710a41f38c81f28d638014c0.jpg','image/jpeg',101488,'y',to_date('19/03/18','RR/MM/DD'));
Insert into CONSTRACT_FILE (CONS_NUM,CONSFILE_NAME,CONSFILE_SAVE_NAME,CONSFILE_TYPE,CONSFILE_SIZE,CONSFILE_STATUS,CONSFILE_DATE) values (107,'constract.jpg','constract63794ccfe733487d891f1a58c4f2cee7.jpg','image/jpeg',101556,'y',to_date('19/03/19','RR/MM/DD'));
REM INSERTING into DIAGRAM_DATA
SET DEFINE OFF;
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('123',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','2. ȸ������');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('124',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','3. ������Ʈ');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('125',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','4. ����  ������Ʈ');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('126',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','5. �������� ��Ʈ������');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('127',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','6. �������� �ڱ�Ұ�');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('128',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','7. �������� �з�');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('129',1197,8,'qwer',to_date('19/03/19','RR/MM/DD'),'y','1.�α���');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('130',1197,8,'qwer',to_date('19/03/19','RR/MM/DD'),'y','�޷� ����');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('83',261,2,'free',to_date('19/03/15','RR/MM/DD'),'y','1. �α���');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('84',261,2,'free',to_date('19/03/15','RR/MM/DD'),'y','2. �ƿ�');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('131',1001,8,'qwer',to_date('19/03/20','RR/MM/DD'),'y','�α��� ����');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('101',1,2,'free',to_date('19/03/18','RR/MM/DD'),'y','1. �α���');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('81',283,2,'zxcv',to_date('19/03/14','RR/MM/DD'),'y','1. �α���');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('82',283,8,'zxcv',to_date('19/03/14','RR/MM/DD'),'y','1. Login');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('132',1001,8,'qwer',to_date('19/03/20','RR/MM/DD'),'y','�޷� ����');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('121',1148,8,'cheeze',to_date('19/03/19','RR/MM/DD'),'y','1. �α׷α���');
Insert into DIAGRAM_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS,DATA_TITLE) values ('122',1001,8,'free',to_date('19/03/19','RR/MM/DD'),'y','1. �α���');
REM INSERTING into EVALATION
SET DEFINE OFF;
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (133,'client','free',261,4,5,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (121,'client','test',254,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (130,'client','qwer',1,3,3,3,3,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (134,'free','client',261,3,3,3,3,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (135,'test','client',261,5,4,4,3,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (141,'asdfasdf','hello3',897,5,3,3,4,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (143,'zxcv','b002',908,4,4,4,3,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (181,'dhaudgkr','cheeze',1148,4,4,5,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (182,'cheeze','dhaudgkr',1148,4,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (137,'asdf','qwer',901,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (138,'jns37789','qwer',893,4,4,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (190,'free','cli001',1001,4,3,4,4,2);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (104,'zxcv','test',283,4,3,2,4,2);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (105,'zxcv','a001',283,4,4,5,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (106,'zxcv','qwer',283,4,5,5,5,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (107,'qwer','zxcv',283,5,4,3,2,1);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (108,'a001','zxcv',283,4,5,4,3,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (109,'test','zxcv',283,5,4,3,4,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (122,'client','free',254,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (124,'client','b003',254,4,5,4,5,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (125,'free','client',254,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (126,'test','client',254,5,5,4,3,2);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (127,'b002','client',254,4,5,4,3,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (128,'b003','client',254,4,2,1,2,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (183,'client9422','free',1325,5,5,4,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (184,'free','client9422',1325,5,5,3,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (186,'cli001','free',1001,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (187,'cli001','qwer',1001,1,2,2,1,2);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (188,'b002','cli001',1001,5,4,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (189,'qwer','cli001',1001,5,4,4,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (123,'client','b002',254,5,4,3,4,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (185,'cli001','b002',1001,3,3,3,3,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (132,'client','test',261,1,2,2,2,2);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (136,'asdf','designer',901,5,5,5,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (139,'jns37789','b002',893,4,4,4,4,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (129,'client','free',1,3,4,5,4,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (140,'asdfasdf','c001',897,4,4,3,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (142,'zxcv','c001',908,4,4,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (131,'qwer','client',1,5,4,3,3,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (144,'c001','asdfasdf',897,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (145,'c001','zxcv',908,4,4,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (146,'qwer','asdf',901,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (147,'qwer','jns37789',893,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (148,'designer','asdf',901,4,4,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (149,'hello3','asdfasdf',897,4,4,4,4,4);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (150,'b002','jns37789',893,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (151,'b002','zxcv',908,5,5,5,5,5);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (161,'asdfasdf','b002',84,5,4,3,4,3);
Insert into EVALATION (EV_NUM,EV_FROM,EV_TO,CONS_NUM,EV_PROFESSIONE,EV_SATISFY,EV_COMMUNI,EV_SCHEDULE,EV_ACTIVE) values (162,'b002','asdfasdf',84,1,1,5,5,5);
REM INSERTING into FREE_TYPE
SET DEFINE OFF;
Insert into FREE_TYPE (FTYPE_NUM,FTYPE_NAME) values (0,'����');
Insert into FREE_TYPE (FTYPE_NUM,FTYPE_NAME) values (1,'������');
REM INSERTING into INTEREST_PROJECT
SET DEFINE OFF;
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1092,'qwer',76);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (922,'c001',908);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1166,'cheeze',1148);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1387,'free0001',1381);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1160,'cheeze',804);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1157,'free',1148);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1280,'free',287);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1279,'free',804);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1281,'free',285);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1347,'freesichan',1341);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1058,'test',259);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1372,'freesichan',1368);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1331,'free',1325);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1358,'testfree',1352);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (581,'seojin',259);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1189,'sysy',804);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1359,'testfree',1341);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1014,'qwer',285);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1015,'qwer',804);
Insert into INTEREST_PROJECT (INPR_NUM,INPR_FREE,INPR_PROJECT) values (1016,'qwer',84);
REM INSERTING into INTEST_FREELANCER
SET DEFINE OFF;
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1143,'dhaudgkr','seojin');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1379,'qkrtlcks9422','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1380,'qkrtlcks9422','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1144,'dhaudgkr','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1339,'clientsichan','test002');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1340,'clientsichan','sysy');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1323,'client9422','sysy');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1324,'client9422','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1398,'client','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1399,'client','s001');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1282,'dkssud','test002');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (534,'zxcv','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1179,'cccc','seojin');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1283,'dkssud','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1350,'testclient','testfree');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1351,'testclient','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1400,'client','qwer');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1083,'test001','seojin');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1084,'test001','s001');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1295,'qkrtlcks94','test');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1296,'qkrtlcks94','seojin');
Insert into INTEST_FREELANCER (INFR_NUM,INFR_CLIENT,INFR_FREE) values (1297,'qkrtlcks94','qwer');
REM INSERTING into LANGUAGE
SET DEFINE OFF;
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (22,'PhotoShop');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (23,'CSS');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (24,'hybridapp');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (25,'HTML');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (26,'Android');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (27,'JSP');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (28,'ORACLE');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (29,'SQL');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (30,'DB');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (0,'C');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (1,'C++');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (2,'C#');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (3,'Visual Basic');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (4,'Java');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (5,'JavaScript');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (6,'Python');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (7,'R');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (8,'PHP');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (9,'�������');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (10,'CoffeeScript');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (11,'ABAP');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (12,'D');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (13,'Prolog');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (14,'Ruby');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (15,'Rust');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (16,'Scala');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (17,'�Ľ�Į');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (18,'Perl');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (19,'Objective-C');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (20,'Go');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (21,'Forth');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (100,'��Ÿ');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (31,'firmware');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (32,'HW����');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (33,'IOS');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (34,'Unity');
Insert into LANGUAGE (LAN_NUM,LAN_NAME) values (35,'OpenCV');
REM INSERTING into LICENSE
SET DEFINE OFF;
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (41,'b002','����ó�����','����η°���',to_date('15/09/17','RR/MM/DD'),'y');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (42,'free','����ó�����','����η°���',to_date('06/09/14','RR/MM/DD'),'y');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (81,'qwer','����ó�����','ť��',to_date('11/04/15','RR/MM/DD'),'y');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (82,'test','����ó�����','Q-net',to_date('12/09/17','RR/MM/DD'),'y');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (61,'free','��ó���Ǳ�','������簳�߿�',to_date('16/06/05','RR/MM/DD'),'n');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (83,'test','����������','�����������û',to_date('13/01/03','RR/MM/DD'),'y');
Insert into LICENSE (LI_NUM,MEM_ID,LI_NAME,LI_ORGANIZATION,LI_DATE,LI_STATUS) values (84,'test','GTQ �׷��� ���','�ѱ����꼺����',to_date('14/03/16','RR/MM/DD'),'y');
REM INSERTING into MEETING
SET DEFINE OFF;
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (143,'client','a001',1197,to_date('19/04/23','RR/MM/DD'),to_date('19/04/20','RR/MM/DD'),'���� ���� ��û �� �ǰ� ����','0','1','0','y');
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (144,'cli001','b002',1001,to_date('19/03/20','RR/MM/DD'),to_date('19/03/22','RR/MM/DD'),'������Ʈ ���� ����','1','1','0','y');
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (141,'client','a001',1197,to_date('19/03/27','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'���α׷� ���� ���� ����(1��)','1','1','1','y');
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (142,'client','seojin',1197,to_date('19/03/28','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),'�����ͺ��̽� ��� ���� ����','1','1','1','y');
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (121,'free','test',261,to_date('19/03/15','RR/MM/DD'),to_date('19/04/05','RR/MM/DD'),'�ȳ�','1','1','0','y');
Insert into MEETING (MT_NUM,MT_FROM,MT_TO,PR_NUM,MT_DATE,MT_TIME,MT_REASON,MT_TYPE,MT_FROM_ACCEPT,MT_TO_ACCEPT,MT_STATUS) values (101,'zxcv','qwer',283,to_date('19/03/14','RR/MM/DD'),to_date('19/03/17','RR/MM/DD'),'����','1','1','1','y');
REM INSERTING into MEM_IDENTITY
SET DEFINE OFF;
Insert into MEM_IDENTITY (IDEN_NUM,IDEN_NAME) values (0,'������');
Insert into MEM_IDENTITY (IDEN_NUM,IDEN_NAME) values (1,'Ŭ���̾�Ʈ');
Insert into MEM_IDENTITY (IDEN_NUM,IDEN_NAME) values (2,'��������');
REM INSERTING into MEM_STATUS
SET DEFINE OFF;
Insert into MEM_STATUS (STATUS_NUM,STATUS_NAME) values (0,'�Ϲ�');
Insert into MEM_STATUS (STATUS_NUM,STATUS_NAME) values (1,'Ż�� ��û');
Insert into MEM_STATUS (STATUS_NUM,STATUS_NAME) values (2,'������Ʈ');
Insert into MEM_STATUS (STATUS_NUM,STATUS_NAME) values (3,'Ż��');
REM INSERTING into MEM_TYPE
SET DEFINE OFF;
Insert into MEM_TYPE (MTYPE_NUM,MTYPE_NAME) values (0,'����');
Insert into MEM_TYPE (MTYPE_NUM,MTYPE_NAME) values (1,'��');
Insert into MEM_TYPE (MTYPE_NUM,MTYPE_NAME) values (2,'���� �����');
Insert into MEM_TYPE (MTYPE_NUM,MTYPE_NAME) values (3,'���� �����');
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('qwer','qwerqwer','������','qwer@qwer.qwer','010-4567-8910','02-1234-3214','qwerba9f7f8d409d4c88b836b4df4b1f91f6.jpg',to_date('19/02/27','RR/MM/DD'),'1996/7/7','34864','���� �߱� ��ȭ���� 34-10 (��ȭ��, �����̾���Ʈ)','����',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('zxcv','zxcvzxcv','�ָ���','zxcv@zxcv.zxcv','010-1515-5151','02-4567-8556',null,to_date('19/02/28','RR/MM/DD'),'1993/05/12','654-4845','����Ư���� �������� ','Ÿ�ӽ�����',null,2,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('nworang','nworang','�赿��','ehddud1672@naver.com','010-4181-5629','010-1111-1111',null,to_date('19/03/11','RR/MM/DD'),'1991/09/02','18431','���������� ���� �Ǿϵ� �Ǿ��ְ�����Ʈ','501��',null,null,0,null,2,'1');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('asdfadsf','asdfasdf','�׽�Ʈ','asdf@asdf.com','010-1234-5678','010-1234-5678',null,to_date('19/03/11','RR/MM/DD'),'1944/5/9','13473','��� ������ �д籸 ��ΰ�ӵ��� 409 (����)','��ӵ���',null,null,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('sdfsd','asdfasdf','�׽�Ʈ','asdf@asdf.com','010-1234-5678','010-1234-5678',null,to_date('19/03/11','RR/MM/DD'),'1930/1/1','06302','���� ������ ����õ�� 163 (���, �ٵ������� ����Ÿ��)','�ѷ�',null,null,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('c001','aaaa','�����','jns37789@naaaa.com','010-4807-9310',null,null,to_date('19/03/15','RR/MM/DD'),'1993/10/6','17784','��� ���ý� ��ź�� 5 (��絿)','�η�',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('e001','aaaaa','�����','asd@adasd.com','010-7448-4844','010-1111-1111',null,to_date('19/03/15','RR/MM/DD'),'1930/1/1','17775','��� ���ý� ����� 1337 (������)','��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('s001','asdfasdf','�����','qqq@naver.com','010-4807-3100','010-1111-1111','s00105d7e803e35748138e5799f872ad7f4b.jpg',to_date('19/03/15','RR/MM/DD'),'1930/1/1','17715','��� ���ý� ��ź���� 95 (���)','����',null,null,0,null,2,'1');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('dhaudgkr','aaaaa','����','dhaudrkr@naver.com','010-4807-9310',null,null,to_date('19/03/18','RR/MM/DD'),'1936/8/6','13481','��� ������ �д籸 �Ǳ��� 585',null,null,2,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('dkvkehdkvk','aaaaa','������','gkssud@naver.com','010-1111-1111',null,null,to_date('19/03/18','RR/MM/DD'),'1961/9/25','02736','���� ���ϱ� ���Ϸ�40�� 11 (�Ͽ��, ����������)',null,null,1,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('cheeze','aaaaa','ġ��','clwm@naver.com','010-7777-7777',null,null,to_date('19/03/18','RR/MM/DD'),'1990/6/6','40053','��� ���ֱ� ��ϸ� ������ 272-4',null,null,1,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('sysy','sysys','�ν¿�','sysy@naver.com','010-1234-1235','02-1234-3215','sysy03c6b6f7de214c72b5ef393b492cbbf4.jpg',to_date('19/03/19','RR/MM/DD'),'1980/5/29','01080','���� ���ϱ� ���ط� 13 (������, �Ｚ������������)',null,null,2,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free2','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free067016964d72425e8da92b0bf9196551.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free3','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free067016964d72425e8da92b0bf9196551.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free4','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free067016964d72425e8da92b0bf9196551.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('asdfasdf','asdfasdf','������','asdfasdf@naver.com','010-1234-1234','02-123-1234',null,to_date('19/02/15','RR/MM/DD'),'1996/07/07','123-123','���������� �߱� ��ȭ���� 100-12','��ƺ��� 201ȣ',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('a001','asdfasdf','������','a001@naver.com','010-7891-0111','02-122-1334','a001a51dea7911d740f983239d19fdf5ad64.jpg',to_date('19/02/15','RR/MM/DD'),'1995/01/07','222-123','��⵵ ���ý� ���̵� ���׵��ð��߻������ �������� 5��','���ú��������׶�',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('designer','designer','�����̳�','designer@designer.com','010-1234-5678','010-1234-5678',null,to_date('19/02/21','RR/MM/DD'),'2014/10/16','34940','���� �߱� �߾ӷ� 76 (���ﵿ, ���κ���)','������簳�߿�',null,3,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('cli001','aaaaa','Ŭ����','cli001@naver.com','010-1111-2222','031-111-1111',null,to_date('19/03/18','RR/MM/DD'),'1972/6/14','04105','���� ������ ���ﵿ 13-35','�߱���',null,1,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('hello3','hello3','�׽�Ʈ5','hello3@hello3.com','010-1234-5678','010-1234-5678',null,to_date('19/02/20','RR/MM/DD'),'2014/10/16','14448','��� ��õ�� ������ 12 (������),��� ��õ�� ������ 12 (������)','�Ŀ�,�Ŀ�',null,null,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free5','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free067016964d72425e8da92b0bf9196551.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('dkssud','aaaaa','�ȳ�','awdawd@navew.com','010-4234-1234',null,null,to_date('19/03/19','RR/MM/DD'),'1940/7/14','07718','���� ������ ���ΰ����� 173 (ȭ�)',null,null,1,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('freesichan','aaaaa','����','pac9422@naver.com','010-1515-1515','012-154-1571',null,to_date('19/03/20','RR/MM/DD'),'1968/3/16','16666','��� ������ �Ǽ��� �Ǽ��� 896','1�� 302ȣ',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('clientsichan','aaaaa','Ŭ�����','pac9422@naver.com','010-1212-1515','042-125-4854',null,to_date('19/03/20','RR/MM/DD'),'1945/2/18','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','2�� 120ȣ',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('a002','a002','��1','a002@example.com','010-1111-1111','02-111-1111',null,to_date('19/02/16','RR/MM/DD'),'1990/01/02','111-111','���������� �߱� ���ﵿ 500','���κ��� 2��',null,1,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('a003','a003','��2','a003@example.com','010-2222-2222','02-222-2222',null,to_date('19/02/16','RR/MM/DD'),'1995/11/22','222-222','���������� �߱� ��ȭ���� 100-12','��ƺ��� 205ȣ',null,2,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('admin','admin','������','admin@example.com','010-0000-0000',null,null,to_date('19/02/15','RR/MM/DD'),null,'123-123','���������� �߱� ���ﵿ 500','���κ��� 2��',null,null,0,null,0,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('client','client','Ŭ���̾�Ʈ','client@example.com','010-2222-1112','02-222-2221','client826d4ccf61394a8ab1de4c2c789fb14a.jpg',to_date('19/02/15','RR/MM/DD'),'1980/02/01','122-122','���������� �߱� ���ﵿ 500','���κ��� 2��',null,1,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','freed8521bfe44e54e0e8a3f3a0bdbfc02e5.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'1');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('test','test','�׽���','tesssssst@example.comasd','010-1234-2222','02-123-2222','test2449d833abd7423d989030137b879e68.jpg',to_date('19/02/15','RR/MM/DD'),'1988/02/12','105-124','����Ư���� ���α� �ۿ��� 48','����Ư���ñ���û',null,1,0,0,2,'1');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('asdf','asdf','ȫ�浿','asdf@example.com','010-5678-5678','02-5567-5678',null,to_date('19/02/15','RR/MM/DD'),'1995/10/22','105-122','����Ư���� ���ı� �ø��ȷ� 240','�Ե�����',null,1,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('black','black','��','black@example.com','010-9999-9999','02-999-9999',null,to_date('19/02/15','RR/MM/DD'),'1999/09/12','999-999','����Ư���� ���ʱ� �Ź����� 194','��ӹ����͹̳�',null,1,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('1004','1004','õ��','1004@example.com','010-1004-1004','02-100-1004',null,to_date('19/02/15','RR/MM/DD'),'1999/10/04','777-777','����Ư���� ���ʱ� �Ź����� 194','��ӹ����͹̳�',null,2,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('b002','b002','��3','b002@example.com','010-3333-3333','02-333-3333','b0028278a6e1054d4388bd5c99e528217756.jpg',to_date('19/02/16','RR/MM/DD'),'1988/02/12','333-333','���������� �߱� ���ﵿ 500','���κ��� 2��',null,2,0,null,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('b003','b003','��4','b003@example.com','010-4444-4444','02-444-4444',null,to_date('19/02/16','RR/MM/DD'),'1991/09/11','444-444','���������� �߱� ��ȭ���� 100-12','��ƺ��� 204ȣ',null,1,0,null,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('seojin','seojin','������','seojin@naver.com','010-2114-6144','010-2114-6144','seojin80027367e22f47f0adb54f6100e6ba1a.jpg',to_date('19/02/20','RR/MM/DD'),'1930/1/1','34430','���� ����� �ѳ��� 70 (������, �ѳ����б�)','�Ű������ 201ȣ',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free6','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free66a9b7ecc7b1a47109053c8217cb51f66.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free7','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free723d135adbded497b8002dc331bc76a6c.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free8','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free8b954be72d52046a69dbf68c3f831089d.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('b007','asdfasdf','�׽�Ʈ','asdf@asdf.com','010-1234-5678','010-1234-5678',null,to_date('19/02/19','RR/MM/DD'),'1980/02/02','34379','���� ����� ����� ������ ��ȭ���б�','���ּ�,���ּ�',null,2,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('b006','asdfa','�׽�Ʈ2','asdf22@asdf.com','010-1234-5678','010-1234-5678',null,to_date('19/02/19','RR/MM/DD'),'1995/10/22','34672','���� ���� �Ǳ�1�� 4 �Ǿϵ�','���ּ�,���ּ�',null,3,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('hello77','hello77','�׽�Ʈ77','asdf@asdf.co.kr','010-1234-1111','02-111-1111',null,to_date('19/02/20','RR/MM/DD'),'1933/6/8','18431','���������� ���� �Ǿϵ� �Ǿ��ְ�����Ʈ','501��',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('freelancer','asdfasdf','��������','freelancer@freelancer.com','010-1234-5678','010-1234-5678',null,to_date('19/02/20','RR/MM/DD'),'2011/6/14','34627','���� ���� �߾ӷ� 185 (�ߵ�, �츮����)','���ּ�',null,null,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('asdfadfasd','asdfasdf','�׽�Ʈ1','asdf22@asdf.com','010-1234-5678','010-1234-5678',null,to_date('19/03/11','RR/MM/DD'),'1930/12/1','07805','���� ������ ����� 30 (���, ����)','����� ',null,1,0,1,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('b007s','asdfasdf','�׽�Ʈ1s','hello2@hello2.com','010-1234-5678','010-1234-5678',null,to_date('19/03/11','RR/MM/DD'),'1930/6/10','06014','���� ������ ������ 403 (û�㵿, LG û�����)','û�����',null,null,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('test001','aaaaa','�׽�Ʈ','test001@naver.com','010-4807-9310','031-000-0000',null,to_date('19/03/18','RR/MM/DD'),'1930/1/1','34672','���� ���� �Ǳ�1�� 3 (�Ǿϵ�)',null,null,null,2,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('test002','aaaaa','�׽���','test002@naver.com','010-7777-7777','031-111-1111','test00203562cc5f7ce4cefb39ba809653459ab.jpg',to_date('19/03/18','RR/MM/DD'),'1944/9/6','27372','��� ���ֽ� ������ 114 (������, �����ϳ�����Ʈ)',null,null,1,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('cccc','ccccc','�赿��','cccc@dddd.com','010-1234-1234','02-1234-3214',null,to_date('19/03/19','RR/MM/DD'),'1930/1/1','13487','��� ������ �д籸 ����Ǳ��� 579 (����, ���ΰ��� �Ǳ�������)',null,null,null,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free9','free','��������z','freefree@example.com','010-1111-1112','02-111-1111','free067016964d72425e8da92b0bf9196551.jpg',to_date('19/02/15','RR/MM/DD'),'1980/07/04','123-123','���������� �߱� ���ﵿ 500','���κ��� 3��',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('qkrtlcks94','qkrtlcks','����','pac9422@naver.com','010-1511-1351','042-02-0157',null,to_date('19/03/19','RR/MM/DD'),'1932/5/4','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','2��',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('testfree','aaaaa','�׽�','pac9422@naver.com','010-1212-1515','042-125-4854','testfree3d1d3d47807940498b663c5818fcb073.jpg',to_date('19/03/20','RR/MM/DD'),'1930/1/1','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','102ȣ',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('testclient','aaaaa','������','gkssud@naver.com','010-4234-1234','042-125-4854',null,to_date('19/03/20','RR/MM/DD'),'1947/3/16','16666','��� ������ �Ǽ��� ������ 131 (�Ǽ���)','102ȣ',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('free0001','aaaaa','������','pac9422@naver.com','010-8244-7460','042-015-1574',null,to_date('19/03/20','RR/MM/DD'),'1937/8/7','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','102�� 102ȣ',null,0,0,0,2,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('qkrtlcks9422','aaaaa','������','pac9422@naver.com','010-8422-4515','042-125-1504',null,to_date('19/03/20','RR/MM/DD'),'1988/4/18','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','102ȣ',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('jns37789','df1818','������','asd@naver.com','010-4807-9310','042-111-111',null,to_date('19/03/11','RR/MM/DD'),'2008/3/14','17775','��� ���ý� ����� 1337 (������)','������',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('kyg3333','rkd990114','YG','asd@asd.com','010-1111-2222','123',null,to_date('19/03/14','RR/MM/DD'),'1930/1/1','123','123','123',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('pac9422','aaaaa','�ڽ���','pac9422@naver.com','010-4807-9088','010-1111-1111',null,to_date('19/03/15','RR/MM/DD'),'1994/9/22','16585','��� ������ �Ǽ��� ������ 270 (�Ǽ���, ��������)','��������',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('asdfasdf1','asdfasdf','�׽�Ʈ','hello@hello.com','010-2222-2222','031-555-5555',null,to_date('19/03/16','RR/MM/DD'),'1930/7/19','07622','���� ������ ���μ�ȯ�� 11 (���׵�, ������Ʈ����4��)','Ʈ����',null,3,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('psc9422','qkrtlcks','�ڽ���','pac9422@naver.com','010-4234-1234','042-425-4123',null,to_date('19/03/19','RR/MM/DD'),'2006/4/5','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','���� ����Ʈ',null,0,0,null,1,'0');
Insert into MEMBER (MEM_ID,MEM_PASS,MEM_NAME,MEM_MAIL,MEM_HP,MEM_FAX,MEM_PICTURE,MEM_DATE,MEM_BIR,MEM_ZIPCODE,MEM_ADD1,MEM_ADD2,MEM_URL,MTYPE_NUM,STATUS_NUM,FTYPE_NUM,IDEN_NUM,MEM_LOGIN) values ('client9422','qkrtlcks','�ڽ���','pac9422@naver.com','010-8244-7460','042-125-4854',null,to_date('19/03/19','RR/MM/DD'),'1932/4/3','16666','��� ������ �Ǽ��� ������ 123 (�Ǽ���)','����Ʈ',null,0,0,null,1,'0');
REM INSERTING into MESSAGE
SET DEFINE OFF;
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (2,'qwer','zxcv','����',to_date('19/03/11','RR/MM/DD'),'y',8);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (502,'client','zxcv','Ŭ���̾�Ʈ��',to_date('19/03/13','RR/MM/DD'),'y',4);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (854,'free','test','test',to_date('19/03/15','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1,'free','zxcv','���� ���',to_date('19/03/09','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (462,'zxcv','free','���� test',to_date('19/03/11','RR/MM/DD'),'y',3);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (470,'zxcv','qwer','RE : ����',to_date('19/03/11','RR/MM/DD'),'y',2);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (471,'qwer','zxcv','RE : RE : ����',to_date('19/03/11','RR/MM/DD'),'y',3);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (473,'zxcv','qwer','������ ��Ź�� �Ȱ��� ',to_date('19/03/11','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (474,'zxcv','free','��,,',to_date('19/03/11','RR/MM/DD'),'y',6);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (467,'zxcv','qwer','����',to_date('19/03/11','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (475,'free','zxcv','RE : ��,,',to_date('19/03/11','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (590,'seojin','qwer','�Ϳ�� ��������!',to_date('19/03/14','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1338,'free','client9422','����ϼ̽��ϴ�',to_date('19/03/19','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1366,'cli001','qwer','�����մϴ�',to_date('19/03/20','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1367,'qwer','cli001','RE : �����մϴ�',to_date('19/03/20','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1394,'qwer','cli001','�׵��� �����ϼ̽��ϴ�',to_date('19/03/20','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1169,'free','free','������ ������',to_date('19/03/19','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (1395,'cli001','qwer','RE : �׵��� �����ϼ̽��ϴ�',to_date('19/03/20','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (468,'zxcv','zxcv','������ ������',to_date('19/03/11','RR/MM/DD'),'y',1);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (476,'free','test','asd',to_date('19/03/11','RR/MM/DD'),'y',3);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (477,'test','free','RE : asd',to_date('19/03/11','RR/MM/DD'),'y',2);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (478,'free','zxcv','RE : ��,,',to_date('19/03/12','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (523,'free','client','Ŭ���̾�Ʈ��',to_date('19/03/14','RR/MM/DD'),'y',0);
Insert into MESSAGE (MSG_NUM,MSG_FROM,MSG_TO,MSG_TITLE,MSG_DATE,MSG_STATUS,MSG_HIT) values (524,'free','client','������',to_date('19/03/14','RR/MM/DD'),'y',0);
REM INSERTING into NOTICE
SET DEFINE OFF;
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (9,'������',to_date('19/02/19','RR/MM/DD'),10,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (10,'123',to_date('19/02/19','RR/MM/DD'),1,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (11,'1',to_date('19/02/19','RR/MM/DD'),8,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (12,'2����',to_date('19/02/19','RR/MM/DD'),12,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (13,'3����',to_date('19/02/19','RR/MM/DD'),22,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (14,'2������',to_date('19/02/19','RR/MM/DD'),13,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (15,'223',to_date('19/02/19','RR/MM/DD'),27,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (41,'asd',to_date('19/02/27','RR/MM/DD'),1,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (81,'���� ��Ŀ� ���ؼ�',to_date('19/03/19','RR/MM/DD'),9,'y');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (1,'�������� ���� ������ �����ִ� ���ǿ��� ���˼��� ������ �Ұ��մϴ�!',to_date('19/02/15','RR/MM/DD'),39,'y');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (2,'Ȥ�� �� ���ﵵ �����ϰ� �ذ��� �� �ֵ���! - "�Ƚ�����ַ�� 3�ܰ�"��?',to_date('19/02/15','RR/MM/DD'),59,'y');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (7,'1������',to_date('19/02/19','RR/MM/DD'),90,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (8,'������',to_date('19/02/19','RR/MM/DD'),3,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (16,'����',to_date('19/02/20','RR/MM/DD'),2,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (17,'������������23444',to_date('19/02/20','RR/MM/DD'),45,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (21,'�ν¿��� ��',to_date('19/02/20','RR/MM/DD'),7,'n');
Insert into NOTICE (NO_NUM,NO_TITLE,NO_DATE,NO_HIT,NO_STATUS) values (64,'111',to_date('19/03/04','RR/MM/DD'),102,'n');
REM INSERTING into NOTICE_FILE
SET DEFINE OFF;
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (3,12,'Penguins.jpg','Penguins5304d34f582d4ec08f263f8156215c56.jpg','image/jpeg',777835,'n',to_date('19/02/19','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (41,12,'Chrysanthemum.jpg','Chrysanthemum009f374e75e74b69bd131a3d599421c9.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (5,14,'Tulips.jpg','Tulips1ff3180e3768452ebf09bdc56688d6b1.jpg','image/jpeg',620888,'n',to_date('19/02/19','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (21,21,'Tulips.jpg','Tulipscefe5dec0bbf4bc4b0c89fc3b14c6a2a.jpg','image/jpeg',620888,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (45,21,'Desert.jpg','Desert9fbe8cfaff774af0b1576d369fb8892b.jpg','image/jpeg',845941,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (48,21,'Jellyfish.jpg','Jellyfishdc95518af5ef41a5aaa677a2e83a7ae4.jpg','image/jpeg',775702,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (55,21,'Jellyfish.jpg','Jellyfish3c0b6dff0c2d498aa568987bb44bab3b.jpg','image/jpeg',775702,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (56,21,'Lighthouse.jpg','Lighthousef29994f0331144338ce04075637385f6.jpg','image/jpeg',561276,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (61,17,'Koala.jpg','Koala9b7ad8c2470043feb0f043dd510d90fc.jpg','image/jpeg',780831,'n',to_date('19/02/21','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (62,17,'Penguins.jpg','Penguins63a6a241fbce4c13a7e9d040a6243485.jpg','image/jpeg',777835,'n',to_date('19/02/21','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (101,41,'Hydrangeas.jpg','Hydrangeas010530f6e1a047aba6e635d820e30215.jpg','image/jpeg',595284,'y',to_date('19/02/27','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (25,21,'Jellyfish.jpg','Jellyfish9784fcd9856a4d1394c22c55f23153a5.jpg','image/jpeg',775702,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (26,21,'Chrysanthemum.jpg','Chrysanthemum690b30f0e9084735848a90784ee99841.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (28,21,'Hydrangeas.jpg','Hydrangeasbadd5ab066c8475ba442621730942a28.jpg','image/jpeg',595284,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (43,17,'Lighthouse.jpg','Lighthouse403bee76d5844cbb9feb3989297ff25c.jpg','image/jpeg',561276,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (44,21,'Chrysanthemum.jpg','Chrysanthemumd4cc92674f0f455bb489a7bde7d0fb91.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (2,7,'Desert.jpg','Desertf0ddfef6c98c4fb8b247dab3dad30e06.jpg','image/jpeg',845941,'n',to_date('19/02/19','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (22,14,'Chrysanthemum.jpg','Chrysanthemumf411458c6dba479ab3f6f7e6ba8bc9a9.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (23,21,'Chrysanthemum.jpg','Chrysanthemumc2cf8498a5fb4f7eaa97c13e12561a99.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (24,21,'Chrysanthemum.jpg','Chrysanthemumf08a65e68882480fbb4a02f1b9dabdff.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (27,21,'Chrysanthemum.jpg','Chrysanthemumee43348dc9b744b19b6dd73f1a96f8cf.jpg','image/jpeg',879394,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (49,21,'Desert.jpg','Desert4bac745affb64d118dec5945193b4885.jpg','image/jpeg',845941,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (50,21,'Koala.jpg','Koala0423f8a84ec94f09b54ed8845b3e6b95.jpg','image/jpeg',780831,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (51,21,'Koala.jpg','Koalaf5403d3ca1454d2f85242b320fe246a5.jpg','image/jpeg',780831,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (52,21,'Hydrangeas.jpg','Hydrangeas8d83d0024b9f4e33a80f5ac96304ef98.jpg','image/jpeg',595284,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (53,21,'Tulips.jpg','Tulipseb597b8f658d4bbe97ab07988c3613c6.jpg','image/jpeg',620888,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (81,17,'Desert.jpg','Desert731187e0d0994b18bb1a82de3bcd3c53.jpg','image/jpeg',845941,'n',to_date('19/02/25','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (121,17,'Koala.jpg','Koalafb44968d91de4e1f84cc61ff8f67b33c.jpg','image/jpeg',780831,'n',to_date('19/03/04','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (126,7,'Jellyfish.jpg','Jellyfishd16fac26f7324a67a8e98b0b7b84c8b8.jpg','image/jpeg',775702,'y',to_date('19/03/04','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (142,2,'Koala.jpg','Koala120137d39b884f739d923be547e14f48.jpg','image/jpeg',780831,'n',to_date('19/03/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (143,1,'Chrysanthemum.jpg','Chrysanthemumb62a44e55c404f059649f48847fd6301.jpg','image/jpeg',879394,'n',to_date('19/03/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (11,16,'������ǥ ����Ʈ.txt','������ǥ ����Ʈc9620261cc784550920825ada22e5fc2.txt','text/plain',522,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (12,17,'������ǥ ����Ʈ.txt','������ǥ ����Ʈ813e10393720499394c9f44cd9e0862d.txt','text/plain',522,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (9,13,'Tulips.jpg','Tulipsca1bce8b206f407ca217cee66f08c204.jpg','image/jpeg',620888,'n',to_date('19/02/19','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (46,21,'Tulips.jpg','Tulipsa44b0cc7be1546e3b1083ea5827774c9.jpg','image/jpeg',620888,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (42,21,'Desert.jpg','Desertb4f0b91cf29a4abb8653d28c6a5f50d3.jpg','image/jpeg',845941,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (47,21,'Hydrangeas.jpg','Hydrangeas83b0ce0bcc524340a2b3276dd9345d91.jpg','image/jpeg',595284,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (54,21,'Jellyfish.jpg','Jellyfish3df1ab81d23442ec8b92803585630fee.jpg','image/jpeg',775702,'n',to_date('19/02/20','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (132,64,'Hydrangeas.jpg','Hydrangeas3b866e03a9bb4b8d96df2fe81f69c07c.jpg','image/jpeg',595284,'y',to_date('19/03/04','RR/MM/DD'),0);
Insert into NOTICE_FILE (NOFILE_NUM,NOFILE_NOTI_NUM,NOFILE_NAME,NOFILE_SAVE_NAME,NOFILE_TYPE,NOFILE_SIZE,NOFILE_STATUS,NOFILE_DATE,NOFILE_HIT) values (141,81,'Desert.jpg','Deserta3f09c34e6854bfb99a2cde8dabf9962.jpg','image/jpeg',845941,'n',to_date('19/03/19','RR/MM/DD'),0);
REM INSERTING into OUTPUT
SET DEFINE OFF;
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (14,'D         ','Ŭ���� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (15,'D         ','Ŭ���� ���̾�׷�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (0,'A         ','��������');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (1,'A         ','�䱸���� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (2,'A         ','�������̽� ���̾�׷�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (3,'A         ','�������̽� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (4,'A         ','�������� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (5,'A         ','��� ����');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (6,'A         ','ǥ�� �ܾ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (7,'A         ','�ڷ� ����');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (8,'D         ','ERD');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (9,'D         ','���̺� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (10,'D         ','�޴� ������');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (11,'D         ','ȭ�� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (12,'D         ','���μ��� ���Ǽ�');
Insert into OUTPUT (OUPUT_NUM,OUTPUT_TYPE,OUTPUT_NAME) values (13,'D         ','���μ��� �帧��');
REM INSERTING into PART
SET DEFINE OFF;
Insert into PART (PART_NUM,PART) values (0,'PM');
Insert into PART (PART_NUM,PART) values (1,'PL');
Insert into PART (PART_NUM,PART) values (2,'TA');
Insert into PART (PART_NUM,PART) values (3,'DA');
Insert into PART (PART_NUM,PART) values (4,'AA');
Insert into PART (PART_NUM,PART) values (5,'BA');
Insert into PART (PART_NUM,PART) values (6,'UA');
REM INSERTING into PORTFOLIO
SET DEFINE OFF;
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (5,'free',null,5,'daaasw',to_date('71/06/01','RR/MM/DD'),to_date('75/02/01','RR/MM/DD'),5,'1',3,'y',24,'eewew');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (39,'free',null,12,'���� ���� ����Ʈ ����',to_date('71/03/01','RR/MM/DD'),to_date('74/03/01','RR/MM/DD'),22,'1',2,'y',53,'���� ���� ����Ʈ ���� �̹����Դϴ�');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (6,'free',null,11,'��Ʈ2',to_date('19/02/01','RR/MM/DD'),to_date('19/02/01','RR/MM/DD'),5,'1',2,'y',21,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (41,'free',null,10,'it ��� Ȩ������ ����',to_date('72/02/01','RR/MM/DD'),to_date('75/02/01','RR/MM/DD'),22,'0',3,'y',21,'it ��� Ȩ������ ���� �̹��� �Դϴ�');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (102,'qwer',null,14,'�� ����Ʈ ���� ��Ʈ������ �Դϴ�',to_date('13/03/01','RR/MM/DD'),to_date('15/05/01','RR/MM/DD'),5,'1',1,'y',33,'��Ʈ������ �̹��� �Դϴ�.');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (103,'qwer',null,19,'������ũ ����Ʈ �����Դϴ�',to_date('14/04/01','RR/MM/DD'),to_date('14/08/01','RR/MM/DD'),5,'0',2,'y',40,'��Ʈ������ �̹��� �Դϴ�.');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (107,'qwer',null,10,'ī��24 ��� ȸ�� Ȩ������ ������ �� �ۺ��� ������',to_date('17/02/01','RR/MM/DD'),to_date('17/03/01','RR/MM/DD'),null,'1',0,'n',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (101,'free',null,13,'������Ʈ������',to_date('71/03/01','RR/MM/DD'),to_date('78/04/01','RR/MM/DD'),22,'0',2,'y',58,'��Ʈ������ �����Դϴ�');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (108,'qwer',null,10,'ī��24 ��� ȸ�� Ȩ������ ������ �� �ۺ��� ������',to_date('17/02/01','RR/MM/DD'),to_date('17/03/01','RR/MM/DD'),25,'0',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (109,'qwer',null,10,'���������� ��� ���� �̹� ���� ȸ���� �������� ����',to_date('17/06/01','RR/MM/DD'),to_date('17/09/01','RR/MM/DD'),null,'0',0,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (110,'qwer',null,11,'BAGEL LABS, Smart tape measure Device ����� IoT �÷��� 2�� ����',to_date('16/05/01','RR/MM/DD'),to_date('16/11/01','RR/MM/DD'),26,'1',3,'y',70,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (111,'qwer',null,11,'������',to_date('17/08/01','RR/MM/DD'),to_date('17/10/01','RR/MM/DD'),26,'1',4,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (112,'qwer',null,11,'1365�ڿ�����˸���',to_date('18/11/01','RR/MM/DD'),to_date('18/12/01','RR/MM/DD'),24,'1',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (113,'test',null,10,'�ر� ERP',to_date('17/01/01','RR/MM/DD'),to_date('17/12/01','RR/MM/DD'),25,'0',0,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (114,'test',null,10,'SimplyCRF ����',to_date('16/09/01','RR/MM/DD'),to_date('16/10/01','RR/MM/DD'),22,'0',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (115,'test',null,11,'XMPP ��� �ȵ���̵� ä�� APP Client ����',to_date('17/05/01','RR/MM/DD'),to_date('17/10/01','RR/MM/DD'),24,'1',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (116,'test',null,11,'��ŷ�� �������� �ȵ���̵��',to_date('15/03/01','RR/MM/DD'),to_date('15/06/01','RR/MM/DD'),26,'1',3,'y',40,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (81,'free',null,3,'������ ��Ʈ���׽�Ʈ',to_date('72/04/01','RR/MM/DD'),to_date('76/02/01','RR/MM/DD'),22,'0',3,'y',17,'��Ʈ������ �̹����Դϴ�.');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (35,'free',null,10,'�Ǽ�����б� Ȩ������ ����',to_date('74/04/01','RR/MM/DD'),to_date('78/03/01','RR/MM/DD'),23,'1',4,'y',21,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (105,'qwer',null,11,'Citizoom',to_date('17/01/01','RR/MM/DD'),to_date('17/02/01','RR/MM/DD'),26,'1',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (106,'qwer',null,11,'�ݷ����� ��ǰ ���� ����',to_date('16/10/01','RR/MM/DD'),to_date('16/11/01','RR/MM/DD'),26,'1',3,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (117,'test',null,20,'�㸮�� �ڼ��ν� ������Ʈ',to_date('18/03/01','RR/MM/DD'),to_date('18/08/01','RR/MM/DD'),30,'1',0,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (118,'test',null,11,'������� �̿��� �ѱ� �ձ۾� ���� �ν� ����Ʈ����',to_date('16/01/01','RR/MM/DD'),to_date('16/03/01','RR/MM/DD'),23,'1',0,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (119,'test',null,20,'�׽�Ʈ ���� �� ����͸� �ý���',to_date('16/09/01','RR/MM/DD'),to_date('16/10/01','RR/MM/DD'),2,'1',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (120,'test',null,20,'QT�� �̿��� ��Ű��� ������Ʈ',to_date('14/01/01','RR/MM/DD'),to_date('16/01/01','RR/MM/DD'),1,'1',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (121,'test',null,11,'���� ���̺� ����� �� ���� ''����ٺ�Ʈ''',to_date('17/08/01','RR/MM/DD'),to_date('17/12/01','RR/MM/DD'),33,'0',1,'y',100,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (122,'qwer',null,11,'�Ǽ�����б� ����������Ʈ',to_date('14/09/01','RR/MM/DD'),to_date('15/02/01','RR/MM/DD'),26,'1',1,'y',70,'�Ǽ��� ���� �̹����Դϴ�');
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (29,'free',null,10,'ddd',to_date('70/04/01','RR/MM/DD'),to_date('74/05/01','RR/MM/DD'),23,'1',1,'y',23,null);
Insert into PORTFOLIO (PO_NUM,MEM_ID,PR_NUM,PO_CATE_NUM,PO_TITLE,PO_START,PO_END,PO_TECH,PO_REPRE,PART_NUM,PO_STATUS,PO_PERCENT,PO_EXPLAINFILE) values (64,'b003',null,10,'�߰�������Ʈ',to_date('18/10/01','RR/MM/DD'),to_date('18/12/01','RR/MM/DD'),4,'1',1,'y',100,'LMS');
REM INSERTING into PORTFOLIO_FILE
SET DEFINE OFF;
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (2,5,'Chrysanthemum.jpg','Chrysanthemumcfc02a2847b44dc28ec865f3c52e9772.jpg','image/jpeg',879394,'n',to_date('19/02/27','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (102,39,'��Ʈ3.jpg','��Ʈ37ba8f72112d74710b15855e52efb75f5.jpg','image/jpeg',112073,'y',to_date('19/03/18','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (125,81,'sample.png','sample81bfcc98933b4d8c8f99e8238b6defae.png','image/png',3238350,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (48,39,'Lighthouse.jpg','Lighthouse5b78a986739341058e66442dcb119e70.jpg','image/jpeg',561276,'n',to_date('19/03/06','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (49,41,'Tulips.jpg','Tulips85029c85490f4d11adb55dc175132459.jpg','image/jpeg',620888,'n',to_date('19/03/06','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (63,5,'splash3.bmp','splash34b47cc761ec4450284d8e84e82c904a8.bmp','image/bmp',36431,'y',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (64,35,'team.png','teamc0d1e752757a431aaa6ac858decc8d8a.png','image/png',9524,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (65,39,'��Ʈ.JPG','��Ʈ6aeab8c92cd94911a7017a6b8464f299.JPG','image/jpeg',49120,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (105,102,'��Ʈ1.jpg','��Ʈ105061b51a41640db92aa4c3bbfa016de.jpg','image/jpeg',66863,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (106,103,'��Ʈ2.jpg','��Ʈ2e5d2465d72d848feaf30fd4cbe09fc4a.jpg','image/jpeg',428709,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (41,6,'Tulips.jpg','Tulips51f729bbc689444db0cb6affda9c35b8.jpg','image/jpeg',620888,'n',to_date('19/03/05','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (104,101,'notitle.png','notitle9ce3d8f1a4a04ff3b6e98585954619a4.png','image/png',388834,'y',to_date('19/03/19','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (109,107,'����3.png','����306fd4463484c4337b5fa91055ed9fe81.png','image/png',139794,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (110,108,'����3.png','����3391e80ad3f6543489c0d465c3e0ba50e.png','image/png',139794,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (111,109,'����4.jpg','����48bf024c0ca544badacb2c1058366aa27.jpg','image/jpeg',112492,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (112,110,'����4.png','����43d2ec5f6b78d4154a30b40255b9bac5c.png','image/png',21782,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (113,111,'����5.jpg','����5bccd957fb27443faac7f5cdddbfff899.jpg','image/jpeg',539880,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (114,112,'����5.png','����57a9f5f0d8eb246bdbec74a8820e23c45.png','image/png',37395,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (115,113,'1.png','13da74602ce674cc8befc77964ff69d64.png','image/png',88377,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (116,114,'2.png','29726c15cc7154b758fc55bf390dc12b6.png','image/png',130987,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (117,115,'3.jpeg','3d74fea86cfdd41279a37acbe67b06092.jpeg','image/jpeg',30246,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (118,116,'4.png','4731b4b2793454e15b9b6fa9c2a0d299a.png','image/png',46616,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (119,117,'5.png','5d52e2cbc70084c7fa83eedf0cdb50661.png','image/png',8134,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (120,118,'6.png','603131f965e1e4cc38286372852f0d6ad.png','image/png',38878,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (121,119,'7.png','72ec195ddf3b64f8289cf7b6d300ebe16.png','image/png',204072,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (122,120,'8.png','8c4df6563b0bd4cdcb674cdb79ef65234.png','image/png',26932,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (123,121,'9.jpeg','98de557525c504802a604429de6f2432d.jpeg','image/jpeg',24965,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (124,122,'sample.png','sample49c455c2019b4481833089d5a5336c2c.png','image/png',3238350,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (47,35,'Hydrangeas.jpg','Hydrangeas46e25560d35e4f61b9f61bfa0d20e597.jpg','image/jpeg',595284,'n',to_date('19/03/05','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (66,35,'resume.png','resumeac8e53edf4534d1b963a16e66f59413b.png','image/png',3707,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (67,35,'��Ʈ2.jpg','��Ʈ2ca2aab2635194c1193d8964d6a45491e.jpg','image/jpeg',83137,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (68,39,'��Ʈ2.jpg','��Ʈ28753671c68f749e2aae70f6876f708de.jpg','image/jpeg',83137,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (69,41,'��Ʈ2.jpg','��Ʈ20d0b9d6c832b4b0e9850a774419b6eeb.jpg','image/jpeg',83137,'y',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (70,35,'��Ʈ.JPG','��Ʈ7e2b9431071c42bebc106cc34f80dd10.JPG','image/jpeg',49120,'y',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (71,39,'��Ʈ3.jpg','��Ʈ3bceeaa460d0b4f7db1cb4062fb5c8ed9.jpg','image/jpeg',112073,'n',to_date('19/03/14','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (101,39,'��Ʈ2.jpg','��Ʈ299172e53a1ca47b789bf3a339e75c0eb.jpg','image/jpeg',83137,'n',to_date('19/03/18','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (103,81,'��Ʈ4.jpg','��Ʈ4e12f8f193e6f4a2cbfb6335d98636589.jpg','image/jpeg',51566,'n',to_date('19/03/18','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (107,105,'����1.png','����17c7c384446334b159ad291dd56523ce4.png','image/png',241500,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (108,106,'����2.png','����2070c261948864be48c3ce5ef52791313.png','image/png',171289,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (46,29,'Penguins.jpg','Penguins4d21f16ca21f4ecc96ec394d660ece01.jpg','image/jpeg',777835,'n',to_date('19/03/05','RR/MM/DD'));
Insert into PORTFOLIO_FILE (POFILE_NUM,PO_NUM,POFILE_FILE_NAME,POFILE_SAVE_NAME,POFILE_TYPE,POFILE_SIZE,POFILE_STATUS,POFILE_DATE) values (83,64,'KakaoTalk_20190214_094818365.png','KakaoTalk_20190214_094818365a489665c27e64267a4ad45d526c580e5.png','image/png',19559,'y',to_date('19/03/15','RR/MM/DD'));
REM INSERTING into PROJECT
SET DEFINE OFF;
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (261,4,'������ ������Ʈ �ۺ���',5,20000000,to_date('19/02/01','RR/MM/DD'),null,to_date('19/02/03','RR/MM/DD'),'1','���������� ������ ���� �������� ',to_date('19/03/13','RR/MM/DD'),'n','client',5,1,0,to_date('19/04/08','RR/MM/DD'),to_date('19/03/15','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (262,4,'iot ��Ʈ�Ͻ� ���� ���� �� �����ͺ��̽� ����',5,5000000,to_date('19/02/03','RR/MM/DD'),null,to_date('19/02/11','RR/MM/DD'),'1','���������� �߱� �߱�û�� ���κ��� ',to_date('19/02/18','RR/MM/DD'),'n','asdf',2,1,0,to_date('19/03/01','RR/MM/DD'),to_date('19/02/05','RR/MM/DD'),null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (281,1,'����/Ŭ���̾�Ʈ ��� ���α׷� ����',90,20000000,to_date('19/02/28','RR/MM/DD'),null,to_date('19/03/13','RR/MM/DD'),'1','��û�ϵ� ���ֽ� �� ���տ��ǽ��� 12',to_date('19/03/20','RR/MM/DD'),'n','client',3,1,0,to_date('19/06/25','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (30,1,'DB ������ ��ȸ �ȵ���̵� �� iOS ���̺긮�� ��',60,10000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/17','RR/MM/DD'),'0','��� ������ �д籸 �Ǳ���',to_date('19/03/22','RR/MM/DD'),'n','client',2,3,1,to_date('19/04/11','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (39,9,'� ���� �踮 ���α׷� Oracle DB �� SQL ����ȭ Ʃ��',30,10000000,to_date('19/02/15','RR/MM/DD'),null,to_date('19/04/13','RR/MM/DD'),'1','��⵵ ������ �д籸 ����Ǳ���644���� 12',to_date('19/05/01','RR/MM/DD'),'n','asdf',2,1,0,to_date('19/06/04','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (282,1,'�ֽ� ���� ���� SNS �� �÷��� ���� �� 1�� ���� �',90,200000000,to_date('19/02/28','RR/MM/DD'),null,to_date('19/03/21','RR/MM/DD'),'1','����Ư���� �������� ',to_date('19/03/20','RR/MM/DD'),'y','zxcv',2,1,0,to_date('19/06/25','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (10,4,'ReactJS ��� ���� ��ȭ �� ���ø����̼� ����',35,7000000,to_date('19/02/25','RR/MM/DD'),null,to_date('19/03/05','RR/MM/DD'),'0','����Ư���� ������ �󼭵� ��õ����Ʈ',to_date('19/03/11','RR/MM/DD'),'n','client',2,3,1,to_date('19/04/10','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (15,13,'�귣�� 5�� �ΰ� �� ��Ű�� ������',30,8000000,to_date('19/02/25','RR/MM/DD'),null,to_date('19/03/05','RR/MM/DD'),'0','���������� ���� ���ȵ� ���κ���',to_date('19/03/06','RR/MM/DD'),'n','client',2,3,1,to_date('19/04/02','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (254,1,'�����ڿ� ������ ���� �� ��������/��� Web �÷��� ����',30,70000000,to_date('19/02/27','RR/MM/DD'),null,to_date('19/02/27','RR/MM/DD'),'1','��⵵ ������ �д籸 ����Ǳ���644���� 12',to_date('19/03/01','RR/MM/DD'),'n','client',5,3,1,to_date('19/07/07','RR/MM/DD'),to_date('19/03/15','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (74,21,'ICī�� �������� read/wirte HW ���� �׽�Ʈ',31,3000000,to_date('19/02/20','RR/MM/DD'),null,to_date('19/04/10','RR/MM/DD'),'0','��� ������ �д籸 �Ǳ���',to_date('19/04/18','RR/MM/DD'),'n','client',2,3,1,to_date('19/05/20','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (75,19,'���� �� ���� �ѱ� �ܼ�Ʈ ��ȭ �۾�',30,8500000,to_date('19/02/20','RR/MM/DD'),null,to_date('19/04/10','RR/MM/DD'),'0','����Ư���� �������� Ÿ�ӽ�����',to_date('19/04/18','RR/MM/DD'),'n','asdfasdf',6,3,1,to_date('19/05/20','RR/MM/DD'),null,'�ȵ˴ϴ�.','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (76,1,'N�� ���� �ű� ��ü DB ���� �� DB ���� �۾�',15,4000000,to_date('19/02/20','RR/MM/DD'),null,to_date('19/03/10','RR/MM/DD'),'0','��⵵ ���� �ϻ굿��',to_date('19/04/01','RR/MM/DD'),'n','asdfasdf',2,3,1,to_date('19/04/20','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (84,2,'��ġ��� ������� �˻�/�������� �� ����',90,95000000,to_date('19/02/20','RR/MM/DD'),null,to_date('19/03/10','RR/MM/DD'),'0','����Ư���� ������ ����1�� ',to_date('19/04/15','RR/MM/DD'),'n','asdfasdf',5,3,1,to_date('19/07/20','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (89,2,'���ν� AR ��ī �� �߰� ��� �� ����ȭ ����',60,10000000,to_date('19/02/07','RR/MM/DD'),null,to_date('19/02/13','RR/MM/DD'),'0','����Ư���� �߱� ������� 40 ���ʹ�',to_date('19/02/20','RR/MM/DD'),'n','client',2,3,1,to_date('19/05/06','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1,1,'Hello WOrld ����',20,1000000,to_date('19/02/15','RR/MM/DD'),null,to_date('19/03/19','RR/MM/DD'),'0','��⵵ ���ý� ��ź�� 170',to_date('19/02/08','RR/MM/DD'),'n','client',3,1,0,to_date('19/02/28','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (257,4,'������� �ۺ��� ���� �� �ű�P �ڵ�',5,600000,to_date('19/02/27','RR/MM/DD'),null,to_date('19/02/28','RR/MM/DD'),'1','���������� ���� �Ǿϵ� �Ǿ��ְ�����Ʈ ',to_date('19/03/01','RR/MM/DD'),'n','asdf',6,1,0,to_date('19/03/07','RR/MM/DD'),null,'�ȵǿ�','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (258,1,'ASP.NET MVC4 ��� MES �������� �� ����',5,30000000,to_date('19/02/01','RR/MM/DD'),null,to_date('19/03/18','RR/MM/DD'),'1','���������� ���� �� ����������Ʈ ',to_date('19/02/15','RR/MM/DD'),'n','asdf',3,1,0,to_date('19/03/22','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (259,21,'Iot ��� ���� ��ü �� ȯ�� ���� ���� �� ����',5,15000000,to_date('19/02/01','RR/MM/DD'),null,to_date('19/02/08','RR/MM/DD'),'1','���������� �߱� ���ൿ �������̰Ÿ� ',to_date('19/03/15','RR/MM/DD'),'n','client',2,1,0,to_date('19/04/08','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (260,7,'�ȵ���̵� �� iOS �ʵ��л��� �̴ϰ��� App ����',5,20000000,to_date('19/02/27','RR/MM/DD'),null,to_date('19/03/01','RR/MM/DD'),'1','���������� ������ ���� �������� ',to_date('19/03/05','RR/MM/DD'),'n','client',6,1,2,to_date('19/04/26','RR/MM/DD'),null,'�ٽ� �ۼ����ּ���.','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (314,5,'�������� �̿��� �ͳ� �� ���� ���� �м� ���α׷�',30,10000000,to_date('19/03/05','RR/MM/DD'),null,to_date('19/03/11','RR/MM/DD'),'0','��� ������ �д籸 ���� 636',to_date('19/03/20','RR/MM/DD'),'n','zxcv',7,2,0,to_date('19/04/25','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (804,2,'Ǫ�� �˸� ���� �ȵ���̵� �� ������ �� ����',30,2000000,to_date('19/03/15','RR/MM/DD'),null,to_date('19/03/22','RR/MM/DD'),'1','��� ���� �ϻ굿�� ������ 1 (������)',to_date('19/03/29','RR/MM/DD'),'n','jns37789',2,1,1,to_date('19/04/29','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (861,5,'sss',2,2222222222,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/22','RR/MM/DD'),'1','���� ������ ������ 376 (���赿)',to_date('19/03/22','RR/MM/DD'),'n','client',7,0,1,to_date('19/03/29','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1001,1,'�ڻ� �ַ�� �ΰ����� AI ��� ����',180,18000000,to_date('19/03/18','RR/MM/DD'),'https://github.com/jns37789/sichan_JJANGGG',to_date('19/03/21','RR/MM/DD'),'1','���� ������ ������� 238 (���, ��ī�̽�����)',to_date('19/03/25','RR/MM/DD'),'y','cli001',5,0,0,to_date('19/09/30','RR/MM/DD'),to_date('19/03/18','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (827,null,'�ӽ�����',null,null,to_date('19/03/15','RR/MM/DD'),null,null,'1',null,null,'n','client',7,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (893,5,'������ �м��Ƿ� �� �����ý��� ����',120,77000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'1','���� ���ϱ� �ﰢ��� 1 (������, ��������)',to_date('19/04/08','RR/MM/DD'),'n','jns37789',5,0,1,to_date('19/06/10','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (897,9,'������ ���� � �� ����',300,60000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'1','��� ������ ���뱸 ������ 32 (���ǵ�, �Ƹ��б�)',to_date('19/04/01','RR/MM/DD'),'n','asdfasdf',5,0,0,to_date('19/12/18','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (308,2,'���� �귣�� ����� Ȩ������ �ۺ��� �� ����',90,9000000,to_date('19/03/04','RR/MM/DD'),null,to_date('19/03/08','RR/MM/DD'),'1','���� ���α� �������� 127-9',to_date('19/03/11','RR/MM/DD'),'n','zxcv',6,0,0,to_date('19/06/11','RR/MM/DD'),null,'�ȵ˴ϴ�.','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (860,null,null,null,null,to_date('19/03/15','RR/MM/DD'),null,null,'1',null,null,'n','b007',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (869,null,null,null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'n','client',7,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (870,null,null,null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'n','client',7,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (871,null,null,null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'n','client',7,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (872,1,'asdasd',null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'y','client',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (873,null,null,null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'y','client',0,1,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (888,null,'�ӽ� ����',null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'n','zxcv',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (889,4,'�ۺ���',10,10000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/17','RR/MM/DD'),'1',null,null,'n','zxcv',0,0,2,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (890,11,'������ ���ø����̼�',11,11,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/17','RR/MM/DD'),'1',null,null,'n','zxcv',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (901,1,'���� ���� ���� �� Ǯ�� �� ����Ʈ �÷��� ����',100,40000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/30','RR/MM/DD'),'1','���� ���۱� �����ʵ�� 3 (��1��)',to_date('19/04/03','RR/MM/DD'),'n','asdf',5,0,1,to_date('19/06/28','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (908,3,'���������� ����Ʈ ������ ������ �� ����',5,1000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/04/02','RR/MM/DD'),'0','���� ������ ������ 1 (��ϵ�)',to_date('19/04/10','RR/MM/DD'),'n','zxcv',5,0,1,to_date('19/04/15','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (283,8,'�Ƿ� ������ ������ ���� SNS �� ���� ����',150,20000000,to_date('19/02/28','RR/MM/DD'),null,to_date('19/04/21','RR/MM/DD'),'1','���ֱ����� ���� �� 112 ',to_date('19/04/23','RR/MM/DD'),'n','zxcv',5,1,0,to_date('19/09/25','RR/MM/DD'),to_date('19/03/14','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (284,10,'�ؿܱ������ ��� �ý��� �߰� ����',20,8000000,to_date('19/02/25','RR/MM/DD'),null,to_date('19/03/01','RR/MM/DD'),'1','��⵵ �ϳ��� ',to_date('19/03/05','RR/MM/DD'),'n','zxcv',6,1,0,to_date('19/03/25','RR/MM/DD'),null,'�����մϴ�','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (285,4,'����ǹ��� �� ����Ʈ ��ũ�� ����',150,24500000,to_date('19/02/15','RR/MM/DD'),null,to_date('19/03/04','RR/MM/DD'),'1','����Ư���� ���ı� ',to_date('19/03/05','RR/MM/DD'),'n','zxcv',2,1,0,to_date('19/08/01','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (286,10,'������� ������ ���� ������ �� ����Ʈ ����',45,8000000,to_date('19/03/05','RR/MM/DD'),null,to_date('19/03/14','RR/MM/DD'),'0','����Ư���� ������ ',to_date('19/03/18','RR/MM/DD'),'n','zxcv',3,1,2,to_date('19/05/01','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (287,10,'���ι�ũ ä�� ���� �� ����Ʈ���� ���� ���� �� PL',330,73700000,to_date('19/02/28','RR/MM/DD'),null,to_date('19/03/04','RR/MM/DD'),'0','����Ư���� ������ ',to_date('19/03/06','RR/MM/DD'),'n','client',2,1,0,to_date('20/02/01','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (303,8,'Ŀ�´�Ƽ ���� ����� �� GUI ������',21,2000000,to_date('19/03/04','RR/MM/DD'),null,to_date('19/03/09','RR/MM/DD'),'0','���� �������� ������� 312 (�븲��, �ŵ��ƾ���Ʈ)',to_date('19/03/13','RR/MM/DD'),'n','zxcv',7,0,2,to_date('19/07/10','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (807,2,'������ ���� � �� ����',300,60000000,to_date('19/03/15','RR/MM/DD'),null,to_date('19/03/18','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/25','RR/MM/DD'),'y','pac9422',3,0,2,to_date('19/05/07','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (857,5,'������ �м��Ƿ� �� �����ý��� ����',120,77000000,to_date('19/03/15','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'1','���� ���ʱ� ������� 27 (���絿, AT����)',to_date('19/04/08','RR/MM/DD'),'n','jns37789',0,1,1,to_date('19/06/08','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (879,null,'�ӽ����� �׽�Ʈ�Դϴ�.',null,null,to_date('19/03/16','RR/MM/DD'),null,null,'1',null,null,'n','client',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (317,2,'�뷡�� ���� Android �� iOS �� ����',120,15000000,to_date('19/03/05','RR/MM/DD'),null,to_date('19/03/18','RR/MM/DD'),'0','��� ������ �д籸 ���� 636',to_date('18/04/02','RR/MM/DD'),'n','zxcv',3,1,1,to_date('19/07/02','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (449,15,'�ӽ�����',11,11,to_date('19/03/08','RR/MM/DD'),null,to_date('19/03/21','RR/MM/DD'),'0','���� ����� ����� 2 (������)�� ������',to_date('19/03/07','RR/MM/DD'),'y','asdfasdf',0,2,0,to_date('19/03/16','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (450,14,'�ӽ�����',123,92000000,to_date('19/03/13','RR/MM/DD'),null,null,'1','��� ������ �д籸 ����Ǳ��� 477 (�Ǳ���, ��������б�)',null,'n','client',7,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (874,2,'������ �м��Ƿ� �� �����ý��� ����',120,77000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/18','RR/MM/DD'),'1','��� ������ �д籸 ������ 582-7',to_date('19/03/22','RR/MM/DD'),'y','client',3,0,0,to_date('19/07/10','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (389,null,null,null,null,to_date('19/03/07','RR/MM/DD'),null,null,'1',null,null,'n','1004',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (390,null,null,null,null,to_date('19/03/07','RR/MM/DD'),null,null,'1',null,null,'n','1004',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (391,null,null,null,null,to_date('19/03/07','RR/MM/DD'),null,null,'1',null,null,'n','1004',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (392,null,null,null,null,to_date('19/03/07','RR/MM/DD'),null,null,'1',null,null,'n','1004',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (882,3,'������ ���� � �� ����',300,60000000,to_date('19/03/16','RR/MM/DD'),null,to_date('19/03/18','RR/MM/DD'),'1','��� ������ �д籸 �Ǳ����� 6-5 (������)',to_date('19/03/25','RR/MM/DD'),'y','client',3,0,0,to_date('19/12/31','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1006,7,'�� ��� ������ Ű��� ���� ����',90,80000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/22','RR/MM/DD'),'1','���� ������ ������ 202 (������, ���κ���)',to_date('19/03/25','RR/MM/DD'),'n','zxcv',1,0,0,to_date('19/06/26','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1325,3,'�������������Ʈ',40,20000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/03/13','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/21','RR/MM/DD'),'n','client9422',5,0,0,to_date('19/04/12','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1381,4,'�������б� ����Ʈ ����',50,30000000,to_date('19/03/20','RR/MM/DD'),null,to_date('19/05/09','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/22','RR/MM/DD'),'n','qkrtlcks9422',4,0,0,to_date('19/05/23','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1401,1,'���������б� ����',60,200000000,to_date('19/03/20','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 131 (�Ǽ���)',to_date('19/03/22','RR/MM/DD'),'n','qkrtlcks9422',2,0,0,to_date('19/04/27','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1101,2,'�ȵ���̵� ���� �ٿ�ε� �� ���� ����',90,30000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/28','RR/MM/DD'),'1','���� ���ϱ� ������ 93-9 (����)',to_date('19/04/07','RR/MM/DD'),'n','1004',1,1,0,to_date('19/07/07','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1104,9,'� ���� Android �� iOS �� ��������',365,5000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/30','RR/MM/DD'),'1','���� ����� ������ 538 (�߸���)',to_date('19/04/15','RR/MM/DD'),'n','asdf',1,2,2,to_date('20/04/15','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1113,2,'��ġ��� ���� ��Ī ������ �� ���� ����',60,20000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/04/01','RR/MM/DD'),'1','���� ������ ������� 272 (���, ����Ǫ������)',to_date('19/04/15','RR/MM/DD'),'n','a002',1,1,1,to_date('19/06/15','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1117,11,'���� ���� ��/�� ȭ�� ��ȹ �� ������ �۾�',30,4500000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/04/10','RR/MM/DD'),'1','��� ����� �����ູ�� 55-7 (������, ���꼼��2���� A-7BL ��)',to_date('19/04/20','RR/MM/DD'),'y','a003',1,2,1,to_date('19/05/20','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1175,3,'���������� ����Ʈ ������ ������ �� ����',5,1000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/03/21','RR/MM/DD'),'0','���� ������ ������� ���� 100 (������, ������)',to_date('19/03/25','RR/MM/DD'),'n','client',1,1,0,to_date('19/03/30','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1180,5,'�� ��� ��� ��� ���� �м� ���� �ý���',150,40000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/03/20','RR/MM/DD'),'1','���� ���� �Ǿϵ� 729-1',to_date('19/03/25','RR/MM/DD'),'n','cccc',3,0,0,to_date('19/06/27','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1192,1,'�μ� ���� ���θ� �� ��Ʈ��� ����',150,130000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/09/05','RR/MM/DD'),'0','���� �߱� �߾ӷ� 76 (���ﵿ, ���κ���) 2��',to_date('19/04/08','RR/MM/DD'),'n','client',6,1,1,to_date('19/09/05','RR/MM/DD'),null,'�ߺ� ���','0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1076,1,'� ��ġ �� ���� �߰� �� �÷��� ����',60,10000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/04/01','RR/MM/DD'),'1','���� ����� ����� 2 (������)',to_date('19/04/07','RR/MM/DD'),'n','client',1,1,1,to_date('19/06/07','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1197,1,'�μ� ���� ���θ� �� ��Ʈ��� ����',150,130000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/09/05','RR/MM/DD'),'0','���� �߱� �߾ӷ� 76 (���ﵿ, ���κ���) 2��',to_date('19/04/08','RR/MM/DD'),'n','client',4,1,1,to_date('19/09/05','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1341,4,'���������Ʈ',60,30000000,to_date('19/03/20','RR/MM/DD'),null,to_date('19/03/28','RR/MM/DD'),'1','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/28','RR/MM/DD'),'n','clientsichan',2,0,0,to_date('19/06/06','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1352,6,'������б� ����Ʈ ����',60,30000000,to_date('19/03/20','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/28','RR/MM/DD'),'n','testclient',4,0,0,to_date('19/06/13','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1065,7,'���÷��� ��ġ�� �� ȭ�� ������',7,500000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/28','RR/MM/DD'),'1','��� ������ �д籸 ��ΰ�ӵ��� 409 (����)',to_date('19/04/01','RR/MM/DD'),'n','asdfasdf',3,0,0,to_date('19/04/05','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1087,1,'��ü ���� �� �Ұ��� ��� ����� �� ����Ʈ ����',25,2300000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/04/01','RR/MM/DD'),'1','��� ����� ������ 72 (������)',to_date('19/04/10','RR/MM/DD'),'n','a003',1,0,0,to_date('19/05/06','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1093,2,'AR �������� �̹��� ��ĵ Android �� ����',50,5500000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/04/01','RR/MM/DD'),'1','�λ� ������ �����ؾȷ� 173-1 (���ϵ�)',to_date('19/05/01','RR/MM/DD'),'n','asdf',1,0,0,to_date('19/06/20','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1099,17,'�ߴ� ��� �Ƶ� ���� ���� ��� �� �ִϸ��̼� ������',36,3600000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/30','RR/MM/DD'),'1','���� ���ϱ� ������ 117-8 (����)',to_date('19/04/07','RR/MM/DD'),'y','1004',1,2,1,to_date('19/05/15','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1285,3,'ASP �� VBSCRIPT ���� �� �湮 ��ġ',45,45000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/03/15','RR/MM/DD'),'1','��� ���ý� ����� 1337 (������)',to_date('19/03/20','RR/MM/DD'),'n','dkssud',2,0,0,to_date('19/03/21','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1368,2,'�Ǽ�����б� ����Ʈ����',60,30000000,to_date('19/03/20','RR/MM/DD'),null,to_date('18/03/22','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 123 (�Ǽ���)',to_date('19/03/22','RR/MM/DD'),'n','clientsichan',4,0,0,to_date('19/06/13','RR/MM/DD'),to_date('19/03/20','RR/MM/DD'),null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1021,9,'������ �м��Ƿ� �� �����ý��� ����',120,77000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/29','RR/MM/DD'),'1','���� ���ʱ� ������ 4 (������, �������)',to_date('19/04/08','RR/MM/DD'),'n','zxcv',1,0,0,to_date('19/08/12','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1085,5,'������ȭ ���� ���� ���α׷� �߰� ��� ����',30,3000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/25','RR/MM/DD'),'1','���� ������ ���� 351-18 (�浿)',to_date('19/04/01','RR/MM/DD'),'n','a002',1,0,1,to_date('19/05/01','RR/MM/DD'),null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1147,null,'Hello World',null,null,to_date('19/03/18','RR/MM/DD'),null,null,'1',null,null,'n','dhaudgkr',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1148,14,'����ȭ�� �м��� �ִ� �ȵ���̵� APP Native ��Ʈ ����',120,5000000,to_date('19/03/18','RR/MM/DD'),null,to_date('19/03/20','RR/MM/DD'),'0','���� ������ ������� 403 (�Ｚ��, �ϸ�� ����)',to_date('19/03/25','RR/MM/DD'),'y','dhaudgkr',3,0,1,to_date('19/07/22','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),null,'1');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1149,null,'����ȭ�� �м��� �ִ� �ȵ���̵� APP Native ��Ʈ ����',null,null,to_date('19/03/18','RR/MM/DD'),null,null,'1',null,null,'n','dhaudgkr',0,0,0,null,null,null,'0');
Insert into PROJECT (PR_NUM,PR_CATE_NUM,PR_TITLE,PR_EX_PERIOD,PR_PAYMENT,PR_DATE,PR_GITURL,PR_DEADLINE,PR_MEETING,PR_ADD,PR_START,PR_SUPPORT,CLIENT,PR_STATUS,MTYPE_NUM,PR_TYPE,PR_END,PR_CHECK,PR_REF,PR_ENDCHECK) values (1298,11,'������簳�߿�',2,50000000,to_date('19/03/19','RR/MM/DD'),null,to_date('19/03/14','RR/MM/DD'),'0','��� ������ �Ǽ��� ������ 131 (�Ǽ���)',to_date('19/03/14','RR/MM/DD'),'n','qkrtlcks94',4,0,0,to_date('19/03/28','RR/MM/DD'),to_date('19/03/19','RR/MM/DD'),'wa','0');
REM INSERTING into PROJECT_FILE
SET DEFINE OFF;
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1001,'�� �ؽ�Ʈ ����.txt','�� �ؽ�Ʈ ����fc8c28325a6e4bcfa2a3251e80a8ac89.txt','text/plain',0,'y',to_date('19/03/18','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (303,'projectForm2.PNG','projectForm2a37cd3ced3fb4ec8a5c9967461133a3a.PNG','image/png',1867,'y',to_date('19/03/04','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1076,'Lighthouse.jpg','Lighthousece8efb2a25a947108e330b2284d8b02e.jpg','image/jpeg',561276,'y',to_date('19/03/18','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1192,'1.png','1d08a6fd0a8754601be735d3de7f5f3e8.png','image/png',221573,'y',to_date('19/03/19','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1197,'1.png','19af67db4ae4c468f98989d92722a2521.png','image/png',221573,'y',to_date('19/03/19','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1341,'Hydrangeas.jpg','Hydrangeasd8b9ae1588dd48ef88400976786a9bff.jpg','image/jpeg',595284,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1325,'notitle.png','notitle115c791b5e9d43bab1e0ed6a95772300.png','image/png',388834,'y',to_date('19/03/19','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1381,'Jellyfish.jpg','Jellyfish9affdc0224e84aeea8571c35d07ec52c.jpg','image/jpeg',775702,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1401,'Hydrangeas.jpg','Hydrangeas2a54e9ebcab9440892cea850e49bbb04.jpg','image/jpeg',595284,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1285,'����� �������丮�����.txt','����� �������丮�����81533497286c4cb0bc5274f8156d2886.txt','text/plain',2566,'y',to_date('19/03/19','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1352,'Hydrangeas.jpg','Hydrangeasd896be80399f4a05aed2457a17c33a2a.jpg','image/jpeg',595284,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1368,'Jellyfish.jpg','Jellyfishf5dcddb6b0c04a12824527bdabe1ee4e.jpg','image/jpeg',775702,'y',to_date('19/03/20','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (308,'projectForm5.PNG','projectForm500a82bf82cce40d092b637e6f2fd54a5.PNG','image/png',1936,'y',to_date('19/03/04','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (874,'�� �ؽ�Ʈ ����.txt','�� �ؽ�Ʈ ����6479362a4e6044418ce730372dfeaffb.txt','text/plain',0,'y',to_date('19/03/16','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (882,'�� �ؽ�Ʈ ����.txt','�� �ؽ�Ʈ ����62fabb9f270b450cbfd6246edacf5c52.txt','text/plain',0,'y',to_date('19/03/16','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1065,'�� �ؽ�Ʈ ����.txt','�� �ؽ�Ʈ ����4b1778b192e343c79cc22d1122a7ecc4.txt','text/plain',0,'y',to_date('19/03/18','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1148,'3�� ����������Ʈ �����ȹ�� .hwp','3�� ����������Ʈ �����ȹ�� ad23bd5562dd40499799e9483da29611.hwp','application/haansofthwp',21504,'y',to_date('19/03/18','RR/MM/DD'));
Insert into PROJECT_FILE (PR_NUM,PRFILE_NAME,PRFILE_SAVE_NAME,PRFILE_TYPE,PRFILE_SIZE,PRFILE_STATUS,PRFILE_DATE) values (1298,'Koala.jpg','Koala6d8c969f01c74f63a3962f93126ed9fe.jpg','image/jpeg',780831,'y',to_date('19/03/19','RR/MM/DD'));
REM INSERTING into PROJECT_NOTICE
SET DEFINE OFF;
Insert into PROJECT_NOTICE (PRNO_NUM,PR_NUM,PRNO_WRITER,PRNO_DATE,PRNO_HIT,PRNO_TITLE,PRNO_STATUS) values (192,1197,'client',to_date('19/03/29','RR/MM/DD'),0,'��� �� ù ���� �ȳ�','y');
Insert into PROJECT_NOTICE (PRNO_NUM,PR_NUM,PRNO_WRITER,PRNO_DATE,PRNO_HIT,PRNO_TITLE,PRNO_STATUS) values (193,1197,'client',to_date('19/04/08','RR/MM/DD'),0,'���� ���� �ȳ�','y');
Insert into PROJECT_NOTICE (PRNO_NUM,PR_NUM,PRNO_WRITER,PRNO_DATE,PRNO_HIT,PRNO_TITLE,PRNO_STATUS) values (195,1197,'client',to_date('19/04/19','RR/MM/DD'),0,'����� �ް� �ȳ�','y');
Insert into PROJECT_NOTICE (PRNO_NUM,PR_NUM,PRNO_WRITER,PRNO_DATE,PRNO_HIT,PRNO_TITLE,PRNO_STATUS) values (172,1,'client',to_date('19/03/15','RR/MM/DD'),0,'�ȳ��ϼ���','y');
Insert into PROJECT_NOTICE (PRNO_NUM,PR_NUM,PRNO_WRITER,PRNO_DATE,PRNO_HIT,PRNO_TITLE,PRNO_STATUS) values (194,1197,'client',to_date('19/04/10','RR/MM/DD'),0,'���� ���� ���� ���� �ȳ�','y');
REM INSERTING into PROJECT_NOTICE_FILE
SET DEFINE OFF;
REM INSERTING into PROJECT_OUTPUT
SET DEFINE OFF;
Insert into PROJECT_OUTPUT (PROUT_NUM,MEM_ID,PR_NUM,PROUT_NAME,PROUT_SAVE_NAME,PROUT_TYPE,PROUT_SIZE,PROUT_STATUS,PROUT_DATE,OUPUT_NUM,PROUT_CHECK) values (101,'free',254,'����� �������丮�����.txt','����� �������丮�����7f3e0109fae24b1da0dfade309f1670a.txt','text/plain',2566,'n',to_date('19/03/15','RR/MM/DD'),0,'n');
Insert into PROJECT_OUTPUT (PROUT_NUM,MEM_ID,PR_NUM,PROUT_NAME,PROUT_SAVE_NAME,PROUT_TYPE,PROUT_SIZE,PROUT_STATUS,PROUT_DATE,OUPUT_NUM,PROUT_CHECK) values (121,'qwer',1197,'notitle.png','notitle0f66394280ab42768f5bae40c2a64a29.png','image/png',388834,'y',to_date('19/03/19','RR/MM/DD'),0,'n');
Insert into PROJECT_OUTPUT (PROUT_NUM,MEM_ID,PR_NUM,PROUT_NAME,PROUT_SAVE_NAME,PROUT_TYPE,PROUT_SIZE,PROUT_STATUS,PROUT_DATE,OUPUT_NUM,PROUT_CHECK) values (123,'qwer',1001,'Chrysanthemum.jpg','Chrysanthemumabbd32701cb941bbad067992c3e0d193.jpg','image/jpeg',879394,'y',to_date('19/03/20','RR/MM/DD'),0,'n');
Insert into PROJECT_OUTPUT (PROUT_NUM,MEM_ID,PR_NUM,PROUT_NAME,PROUT_SAVE_NAME,PROUT_TYPE,PROUT_SIZE,PROUT_STATUS,PROUT_DATE,OUPUT_NUM,PROUT_CHECK) values (122,'qwer',1001,'Jellyfish.jpg','Jellyfish574fdebd79ba41c1ae00e657a5d5cc18.jpg','image/jpeg',775702,'n',to_date('19/03/20','RR/MM/DD'),0,'n');
Insert into PROJECT_OUTPUT (PROUT_NUM,MEM_ID,PR_NUM,PROUT_NAME,PROUT_SAVE_NAME,PROUT_TYPE,PROUT_SIZE,PROUT_STATUS,PROUT_DATE,OUPUT_NUM,PROUT_CHECK) values (103,'free',261,'11.PNG','11a1ded505fbe04f6084329017d95f2805.PNG','image/png',1029108,'y',to_date('19/03/15','RR/MM/DD'),0,'n');
REM INSERTING into PROJECT_REPLY
SET DEFINE OFF;
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (2,'free',259,to_date('19/03/14','RR/MM/DD'),0,2,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (3,'free',259,to_date('19/03/14','RR/MM/DD'),0,3,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (5,'free',259,to_date('19/03/15','RR/MM/DD'),0,5,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (6,'free',259,to_date('19/03/15','RR/MM/DD'),0,6,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (7,'free',259,to_date('19/03/15','RR/MM/DD'),0,7,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (41,'client',259,to_date('19/03/18','RR/MM/DD'),0,41,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (42,'free',259,to_date('19/03/18','RR/MM/DD'),1,41,1,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (96,'free0001',1381,to_date('19/03/20','RR/MM/DD'),0,96,0,'y','free0001');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (11,'free',259,to_date('19/03/16','RR/MM/DD'),0,11,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (12,'free',259,to_date('19/03/16','RR/MM/DD'),1,5,4,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (13,'free',259,to_date('19/03/16','RR/MM/DD'),3,5,3,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (14,'free',259,to_date('19/03/16','RR/MM/DD'),1,8,1,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (43,'free',259,to_date('19/03/18','RR/MM/DD'),0,43,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (33,'free',259,to_date('19/03/16','RR/MM/DD'),0,33,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (51,'free',259,to_date('19/03/18','RR/MM/DD'),0,51,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (52,'free',259,to_date('19/03/18','RR/MM/DD'),0,52,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (53,'free',1065,to_date('19/03/18','RR/MM/DD'),0,53,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (54,'free',1065,to_date('19/03/18','RR/MM/DD'),0,54,0,'y','free');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (64,'cheeze',804,to_date('19/03/18','RR/MM/DD'),0,64,0,'y','cheeze');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (89,'free',1325,to_date('19/03/19','RR/MM/DD'),0,89,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (90,'free',1325,to_date('19/03/19','RR/MM/DD'),0,90,0,'y','free');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (95,'freesichan',1368,to_date('19/03/20','RR/MM/DD'),0,95,0,'y','freesichan');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (4,'free',259,to_date('19/03/15','RR/MM/DD'),0,4,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (8,'free',259,to_date('19/03/15','RR/MM/DD'),0,8,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (91,'client',1285,to_date('19/03/20','RR/MM/DD'),0,91,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (92,'client',259,to_date('19/03/20','RR/MM/DD'),1,59,1,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (93,'nworang',259,to_date('19/03/20','RR/MM/DD'),1,60,1,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (94,'testfree',1352,to_date('19/03/20','RR/MM/DD'),0,94,0,'y','testfree');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (9,'free',259,to_date('19/03/16','RR/MM/DD'),1,5,1,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (10,'free',259,to_date('19/03/16','RR/MM/DD'),2,5,2,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (17,'nworang',259,to_date('19/03/16','RR/MM/DD'),0,17,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (29,'free',259,to_date('19/03/16','RR/MM/DD'),0,29,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (44,'free',259,to_date('19/03/18','RR/MM/DD'),0,44,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (56,'free',259,to_date('19/03/18','RR/MM/DD'),0,56,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (57,'free',259,to_date('19/03/18','RR/MM/DD'),0,57,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (58,'free',259,to_date('19/03/18','RR/MM/DD'),0,58,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (59,'free',259,to_date('19/03/18','RR/MM/DD'),0,59,0,'y','free');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (60,'free',259,to_date('19/03/18','RR/MM/DD'),0,60,0,'y','free');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (61,'free',259,to_date('19/03/18','RR/MM/DD'),0,61,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (62,'1004',259,to_date('19/03/18','RR/MM/DD'),0,62,0,'y','1004');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (63,'test001',804,to_date('19/03/18','RR/MM/DD'),0,63,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (81,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),0,81,0,'n',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (82,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),1,64,1,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (83,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),1,64,2,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (84,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),1,63,1,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (85,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),2,64,3,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (86,'qkrtlcks94',804,to_date('19/03/19','RR/MM/DD'),0,86,0,'y','qkrtlcks94');
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (87,'free',1298,to_date('19/03/19','RR/MM/DD'),0,87,0,'y',null);
Insert into PROJECT_REPLY (PRRE_NUM,MEM_ID,PR_NUM,PRRE_DATE,PRRE_DEPTH,PRRE_GROUP,PRRE_SEQ,PRRE_STATUS,PRRE_PASS) values (88,'free',1298,to_date('19/03/19','RR/MM/DD'),0,88,0,'y','free');
REM INSERTING into PROJECT_STATUS
SET DEFINE OFF;
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (4,'���� ��');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (5,'�Ϸ�');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (1,'�˼� ���');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (0,'�ӽ�����');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (2,'���(���� ���)');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (6,'����');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (3,'��� ��');
Insert into PROJECT_STATUS (PR_STATUS,STATUS_NAME) values (7,'����');
REM INSERTING into PROJECT_TECH
SET DEFINE OFF;
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (94,281,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (95,281,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (96,281,11);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (97,281,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (98,257,7);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (99,257,8);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (100,257,9);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (101,257,10);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (102,257,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (103,257,21);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (104,282,1);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (105,282,2);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (106,282,3);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (107,282,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (108,282,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (109,282,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (110,282,8);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (111,282,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1112,282,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (112,283,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (113,283,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (114,283,21);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (115,283,30);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (116,283,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (117,283,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (118,284,7);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (119,284,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (120,284,8);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (121,284,9);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (122,284,10);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (123,284,11);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (124,284,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (125,285,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (126,285,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (899,897,16);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (900,897,24);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (902,901,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (903,901,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (904,901,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (894,893,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (895,893,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (896,893,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (898,897,32);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (905,901,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (906,901,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (907,901,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (909,908,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (910,908,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (911,908,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1002,1001,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1003,1001,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1004,1001,18);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (892,890,29);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1077,1076,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1078,1076,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1079,1076,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1080,1076,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1088,1087,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1089,1087,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (42,39,28);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (43,39,29);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (44,39,30);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (891,890,27);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1090,1087,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1091,1087,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1094,1093,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1095,1093,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1096,1093,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1097,1093,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1098,1093,34);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1193,1192,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1194,1192,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1195,1192,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1196,1192,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1198,1197,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1199,1197,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1200,1197,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1201,1197,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1344,1341,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1345,1341,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (863,30,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (864,30,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (865,30,24);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (866,30,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (867,30,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (868,30,27);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1384,1381,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1385,1381,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1328,1325,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1329,1325,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1402,1401,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1403,1401,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (862,30,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (77,76,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (78,76,30);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (79,76,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (80,74,31);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (81,74,32);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (82,75,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (83,75,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (85,84,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (86,84,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (87,84,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (88,84,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (90,89,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (91,89,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (92,89,34);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (93,89,35);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (351,314,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (352,314,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (353,314,10);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (354,314,29);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (806,804,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1086,1085,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1176,1175,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1177,1175,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (355,286,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (356,286,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (357,286,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (358,286,30);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (359,286,31);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (805,804,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1178,1175,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1185,1180,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1186,1180,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1187,1180,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1188,1180,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1355,1352,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1356,1352,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1369,1368,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1370,1368,28);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1290,1285,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1291,1285,3);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1292,1285,6);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1293,1285,27);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (309,308,13);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (310,308,10);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (311,308,31);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (312,308,32);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (875,874,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (876,874,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (877,874,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (878,874,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (883,882,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (884,882,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (885,882,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (886,882,24);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (887,882,28);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1067,1065,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1100,1099,34);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1019,1006,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1020,1006,8);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1022,1021,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1023,1021,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1024,1021,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1066,1065,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1102,1101,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1103,1101,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1105,1104,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1106,1104,8);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1107,1104,5);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1108,1104,23);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1109,1104,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1110,1104,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1114,1113,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1115,1113,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1116,1113,33);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1118,1117,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1119,1117,100);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1304,1298,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1305,1298,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1306,1298,22);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1153,1148,26);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1154,1148,4);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1155,1148,25);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1307,1298,24);
Insert into PROJECT_TECH (PTECH_NUM,PROJECT_NUM,TECH_NUM) values (1308,1298,1);
REM INSERTING into PROJECT_TYPE
SET DEFINE OFF;
Insert into PROJECT_TYPE (PTYPE_NUM,PTYPE_NAME) values (0,'���̵�');
Insert into PROJECT_TYPE (PTYPE_NUM,PTYPE_NAME) values (1,'�ʿ� ���� ����');
Insert into PROJECT_TYPE (PTYPE_NUM,PTYPE_NAME) values (2,'���� ���� ����');
REM INSERTING into QNA
SET DEFINE OFF;
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (226,'client',1,'daf',to_date('19/03/18','RR/MM/DD'),'n',0,226,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (227,'client',4,'��������������',to_date('19/03/18','RR/MM/DD'),'n',0,227,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (228,'free',1,'gg',to_date('19/03/18','RR/MM/DD'),'n',0,228,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (229,'free',8,'�ٺ�',to_date('19/03/18','RR/MM/DD'),'n',0,229,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (225,'client',2,'�ñ�',to_date('19/03/18','RR/MM/DD'),'n',0,225,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (123,'client',92,'����ݸ�',to_date('19/03/05','RR/MM/DD'),'n',0,123,'client');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (162,'admin',20,'���',to_date('19/03/07','RR/MM/DD'),'n',1,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (163,'admin',12,'����ݸ�',to_date('19/03/07','RR/MM/DD'),'n',1,123,'client');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (230,'admin',4,'�ٺ�',to_date('19/03/18','RR/MM/DD'),'n',1,229,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (56,'admin',19,'ggg121233444',to_date('19/02/23','RR/MM/DD'),'n',1,25,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (183,'client',38,'�ñ�',to_date('19/03/08','RR/MM/DD'),'n',0,183,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (201,'free',1,'rr',to_date('19/03/15','RR/MM/DD'),'n',0,201,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (161,'free',107,'���',to_date('19/03/07','RR/MM/DD'),'n',0,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (221,'admin',1,'���',to_date('19/03/18','RR/MM/DD'),'n',1,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (222,'admin',1,'���',to_date('19/03/18','RR/MM/DD'),'n',1,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (223,'admin',1,'���',to_date('19/03/18','RR/MM/DD'),'n',1,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (224,'admin',1,'���',to_date('19/03/18','RR/MM/DD'),'n',1,161,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (231,'a003',1,'������Ʈ ��Ͻ� ����� �峪��?',to_date('19/03/19','RR/MM/DD'),'r',0,231,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (232,'client',2,'������Ʈ�� ���� �Ⱓ, ���� ���� ������ �ۼ��ϱ� ��ƽ��ϴ�.',to_date('19/03/19','RR/MM/DD'),'n',0,232,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (234,'admin',3,'���������� Ŭ���̾�Ʈ �Ѵ� ���ÿ� ���ϳ���?',to_date('19/03/19','RR/MM/DD'),'y',1,25,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (235,'admin',0,'������Ʈ ��Ͻ� ����� �峪��?',to_date('19/03/19','RR/MM/DD'),'y',1,231,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (236,'admin',0,'������Ʈ ������ �ܺη� ����Ǹ� �ȵǴ� ��쿡�� ��� �ϳ���?',to_date('19/03/19','RR/MM/DD'),'y',1,233,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (237,'free',2,'������Ʈ ������ �� �� �ֳ���?',to_date('19/03/19','RR/MM/DD'),'r',0,237,'free');
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (238,'asdfasdf',1,'���� �� �̿����� �߻��ϳ���?',to_date('19/03/19','RR/MM/DD'),'r',0,238,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (22,'free',151,'gg',to_date('19/02/22','RR/MM/DD'),'n',0,22,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (25,'free',312,'���������� Ŭ���̾�Ʈ �Ѵ� ���ÿ� ���ϳ���?',to_date('19/02/22','RR/MM/DD'),'r',0,25,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (233,'1004',1,'������Ʈ ������ �ܺη� ����Ǹ� �ȵǴ� ��쿡�� ��� �ϳ���?',to_date('19/03/19','RR/MM/DD'),'r',0,233,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (239,'asdf',2,'�ſ� ������ �� �ؾ� �ϳ���?',to_date('19/03/19','RR/MM/DD'),'r',0,239,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (240,'admin',1,'�ſ� ������ �� �ؾ� �ϳ���?',to_date('19/03/19','RR/MM/DD'),'y',1,239,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (241,'admin',0,'���� �� �̿����� �߻��ϳ���?',to_date('19/03/19','RR/MM/DD'),'y',1,238,null);
Insert into QNA (QA_NUM,MEM_ID,QA_HIT,QA_TITLE,QA_DATE,QA_STATUS,QA_DEPTH,QA_GROUP,QA_PASS) values (242,'admin',0,'������Ʈ ������ �� �� �ֳ���?',to_date('19/03/19','RR/MM/DD'),'y',1,237,'free');
REM INSERTING into QNA_FILE
SET DEFINE OFF;
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (3,25,'Koala.jpg','Koala4e244b67a3a542b280205393012ea581.jpg','image/jpeg',780831,'n',to_date('19/02/22','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (101,225,'Penguins.jpg','Penguins936c2d894560488c9641533aba43646e.jpg','image/jpeg',777835,'y',to_date('19/03/18','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (4,25,'Jellyfish.jpg','Jellyfishbc020410485f4f3fb93467185eb44a9d.jpg','image/jpeg',775702,'n',to_date('19/02/22','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (61,161,'Hydrangeas.jpg','Hydrangeas7aaed39d7b8d4a6cacb45d84078bb35d.jpg','image/jpeg',595284,'n',to_date('19/03/09','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (62,161,'Penguins.jpg','Penguinsca648bfe0ab04cc98254c8fb83bef014.jpg','image/jpeg',777835,'y',to_date('19/03/09','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (21,56,'Chrysanthemum.jpg','Chrysanthemumd7766be9da7043d48cc168667cbbf7fb.jpg','image/jpeg',879394,'y',to_date('19/02/23','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (81,201,'gh.jpg','ghd9d8bec92e424b0fa14446c0448cf51e.jpg','image/jpeg',879394,'y',to_date('19/03/15','RR/MM/DD'));
Insert into QNA_FILE (QAFILE_NUM,QAFILE_QA_NUM,QAFILE_NAME,QAFILE_SAVE_NAME,QAFILE_TYPE,QAFILE_SIZE,QAFILE_STATUS,QAFILE_DATE) values (2,22,'Hydrangeas.jpg','Hydrangeas00859fc445834e61ad0ab206dd3edc0a.jpg','image/jpeg',595284,'y',to_date('19/02/22','RR/MM/DD'));
REM INSERTING into SCHEDULE
SET DEFINE OFF;
REM INSERTING into SIGN
SET DEFINE OFF;
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('asdf','temp76d2633dedb94f3d8d0472cbbbcc80f7.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',85);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('zxcv','temp5794001ab2ca4a1b82ba47cf81994bbd.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',86);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('c001','temp69778b8e388b48b3872169d5e935750a.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',87);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('designer','temp3d3c92aefdd74cc39ad82936380e06d3.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',88);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('hello3','tempb118b7d2f927419faa20f039f078930f.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',89);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('jns37789','temp5be25c4879e842c6ab41bbd245e692df.jpg','y',to_date('19/03/16','RR/MM/DD'),'1',83);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('asdfasdf','temp661e991b5f80463798bf2fa1e826a465.jpg','y',to_date('19/03/16','RR/MM/DD'),'0',84);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('cli001','temp734953be4a1042d387b3f2652e3f665c.jpg','y',to_date('19/03/18','RR/MM/DD'),'0',103);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('dhaudgkr','temp4c7ff3d12ebb44e5bbbcca6a4ef7fbc6.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',109);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('cheeze','tempb0ae678b88874b7285dc3291517aa7f3.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',111);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('cccc','temp5f1e532c5be3431889ef01dcb5324627.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',113);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('seojin','temp530201b3058d4627b44a50050faf230a.jpg','n',to_date('19/03/19','RR/MM/DD'),'0',115);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks9422','temp65fb03f9a2a1474491463f5f263c909f.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',140);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks9422','temp5bf7e29fa414418ca25f71449c3018f8.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',142);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('client','tempa903cb52bf8e478bb6f8652b61f1954d.jpg','n',to_date('19/03/14','RR/MM/DD'),'0',48);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('a003','tempd7d2a460b7f24ed4ac369d620a444a0c.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',107);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('seojin','temp1a63241672ee429692cd66c31f285c04.jpg','n',to_date('19/03/19','RR/MM/DD'),'0',123);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('seojin','temp0fdc0eebdb5e4f5b97e9d5fbb496aeff.jpg','n',to_date('19/03/19','RR/MM/DD'),'0',124);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qwer','tempd50bc6a0054c422bae60a085adee4519.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',45);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('client','tempa28acf52953640ef99b77c0b1cf65ad0.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',47);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('seojin','temp6a405beb2cd648a9a61a7137db0e8d16.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',125);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('clientsichan','temp68667173ae90448cb9048af39f2d31ac.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',130);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('clientsichan','tempc155ac3d31db4d789514d6ff7c002c25.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',131);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('clientsichan','temp5a8a79c319b04dd2bdc8401859a2f036.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',132);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('freesichan','temp19c6508d57d44e5fb2a408f9813dfc98.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',133);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('freesichan','tempbed6aa8b1819426ea4090bc0e0ef4fe5.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',134);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('freesichan','temp320fed805ce04608a9fc96154a0ec82f.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',135);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('test','temp4a60d65a62cb4f8ebff78e6a99a3cc78.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',46);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('seojin','temp28a61f01a7a3490bbcd033d6b0c034b6.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',116);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('sysy','temp3f2f09f5f0424c9484d2703381f6bb44.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',117);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('free','temp22ed9f014d9f4048b7173dd2a0b67bac.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',43);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('free','tempabc905bec3c04498af966d18fe7f00ab.jpg','y',to_date('19/03/14','RR/MM/DD'),'0',44);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('client9422','temp8ff18763ecfc47f6a0de5abbe7097c0a.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',127);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('client9422','tempfa3f6a65f11d4284b0332e94929171d5.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',128);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('client9422','temp030507964f8545d8b0771a00f67b2c0c.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',129);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('testfree','temp47529d6b367d4dd4a4172d23957e0368.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',139);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('free0001','tempde975da12fcd41079e652b2ee3a6c28b.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',143);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('dkssud','temp81588eb375974a769fcb56bb42bead72.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',118);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks94','temp5319fd0738894c3086a489f69c6fb799.jpg','y',to_date('19/03/19','RR/MM/DD'),'1',126);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('a002','temp5e4ab627f82d4cecb2a2a718d3ffe7b0.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',106);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('sysy','tempfe2f2a7e2fd9486ea26f3e4ae99896c6.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',114);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('testclient','temp8ca91bb7f0744a9dab19aef16dbcaf8b.jpg','y',to_date('19/03/20','RR/MM/DD'),'1',136);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('testclient','temp7c7ceed69f6a4d798ade495eaa5bf1e3.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',137);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('testclient','temp56eae44eb01c4376b918c9f8194eb05a.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',138);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks9422','temp958bd2ea661344c285bd0803b74dafdc.jpg','y',to_date('19/03/20','RR/MM/DD'),'0',141);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('b002','temp4c569a3670fb463e902b2f9917f35725.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',63);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('b003','tempe8b45550d95141edb9629c6ad7510671.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',64);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('pac9422','temp04f28299e1ed42259491d6891633daf2.jpg','y',to_date('19/03/15','RR/MM/DD'),'1',65);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('cli001','temp3d5a17aba73546f084c6989d602b442f.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',104);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('asdfasdf','temp9df618e9e05a46f9bdcc81820dd3d1f5.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',105);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('1004','tempc2dfce8fc6a44e46a38d6aaff31c3c9b.jpg','y',to_date('19/03/18','RR/MM/DD'),'1',108);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('dhaudgkr','temp9387b602896049a7a4390a4bf7c4f0be.jpg','y',to_date('19/03/18','RR/MM/DD'),'0',110);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('zxcv','temp2e84fd2a98da48e3b742de5b7c9c5493.jpg','n',to_date('19/03/14','RR/MM/DD'),'0',49);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('a001','temp0ce69a9bbca141bfaaf021f33bd4f9dc.jpg','y',to_date('19/03/14','RR/MM/DD'),'1',50);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('cheeze','temp5cf4d73a2e7240aabc5aef92d1836df2.jpg','y',to_date('19/03/18','RR/MM/DD'),'0',112);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks94','tempc9ea364f7c854ea7978e84f776df0a3d.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',119);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks94','tempa4873e04400d433ca28def0217ae3852.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',120);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('qkrtlcks94','tempc8c38cf5caa74c66940402dd385cb081.jpg','n',to_date('19/03/19','RR/MM/DD'),'0',121);
Insert into SIGN (MEM_ID,SIGN_SAVE_NAME,SIGN_STATUS,SIGN_DATE,SIGN_TYPE,SIGN_NUM) values ('free','temp27469a9a6a4546e7b09a62705506adf4.jpg','y',to_date('19/03/19','RR/MM/DD'),'0',122);
REM INSERTING into TABLE_DATA
SET DEFINE OFF;
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('41',1148,1,'cheeze',to_date('19/03/19','RR/MM/DD'),'y');
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('43',1197,1,'qwer',to_date('19/03/19','RR/MM/DD'),'y');
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('46',1001,1,'qwer',to_date('19/03/20','RR/MM/DD'),'y');
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('21',283,1,'zxcv',to_date('19/03/14','RR/MM/DD'),'y');
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('22',283,6,'zxcv',to_date('19/03/14','RR/MM/DD'),'y');
Insert into TABLE_DATA (DATA_NUM,PR_NUM,OUTPUT_NUM,MEM_ID,DATA_DATE,DATA_STATUS) values ('24',261,1,'client',to_date('19/03/15','RR/MM/DD'),'y');
REM INSERTING into TECHNIQUE
SET DEFINE OFF;
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (265,'b003',5,'2','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (269,'b002',7,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (196,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (272,'free',2,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (275,'free',24,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (277,'free',23,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (280,'free',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (286,'free',28,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (288,'free',28,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (289,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (293,'free',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (296,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (302,'free',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (303,'free',0,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (304,'free',24,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (308,'free',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (309,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (312,'free',28,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (324,'free',27,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (327,'free',22,'1','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (331,'free',32,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (336,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (340,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (347,'free',34,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (358,'free',28,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (360,'test',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (364,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (371,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (381,'seojin',24,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (388,'c001',28,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (391,'s001',27,'1','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (396,'freelancer',23,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (399,'asdfadfasd',22,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (404,'designer',25,'0','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (411,'b002',27,'2','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (412,'b002',26,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (413,'b002',27,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (415,'b002',27,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (417,'b002',27,'2','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (419,'b002',27,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (425,'free',26,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (427,'free',3,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (431,'free',3,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (448,'free',9,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (450,'free',8,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (466,'free',7,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (511,'free',24,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (514,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (520,'free',4,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (521,'free',23,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (529,'free',4,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (221,'zxcv',22,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (222,'test',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (195,'free',23,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (243,'free',9,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (276,'free',3,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (279,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (285,'free',24,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (290,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (386,'c001',7,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (390,'s001',23,'0','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (397,'freelancer',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (401,'asdfadfasd',24,'2','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (407,'designer',24,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (470,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (471,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (472,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (473,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (474,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (475,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (477,'free',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (482,'free',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (502,'free',4,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (531,'free',27,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (538,'free',7,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (542,'free',6,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (545,'free',0,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (551,'test',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (552,'test',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (564,'test',26,'1','3�� �̻� 5�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (567,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (570,'free',28,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (571,'freelancer',28,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (574,'freelancer',23,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (573,'freelancer',24,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (577,'free2',22,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (580,'free2',28,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (586,'free2',23,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (590,'free2',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (597,'free2',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (598,'free2',4,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (616,'free',8,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (617,'free',7,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (620,'free',2,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (626,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (634,'free',26,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (635,'free',5,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (656,'free5',24,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (658,'free5',26,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (681,'free7',9,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (682,'free7',1,'2','3�� �̻� 5�� �̸�','n','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (683,'free7',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (684,'free7',23,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (685,'free8',22,'0','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (686,'free8',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (687,'free8',24,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (688,'free8',25,'0','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (689,'free8',26,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (690,'free8',28,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (691,'free8',33,'0','1�� �̻� 3�� �̸�','n','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (698,'free',23,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (700,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (702,'free',2,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (703,'free',0,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (704,'free',29,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (717,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (718,'free',3,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (719,'free',28,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (720,'free',23,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (721,'free',23,'0',null,'n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (722,'free',29,'0',null,'n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (723,'free',8,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (724,'free',8,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (738,'qwer',26,'0','1�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (739,'qwer',25,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (740,'qwer',4,'0','5�� �̻� 10�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (741,'qwer',9,'1','1�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (190,'free',22,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (188,'free',26,'2','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (191,'free',19,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (192,'free',30,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (194,'free',29,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (217,'free',4,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (246,'free',25,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (247,'free',5,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (264,'b003',4,'1','3�� �̻� 5�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (270,'b002',9,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (316,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (317,'free',30,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (318,'free',29,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (320,'free',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (321,'free',26,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (328,'free',26,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (329,'free',25,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (332,'free',8,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (334,'free',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (339,'free',28,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (341,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (344,'free',28,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (345,'free',26,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (349,'free',32,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (351,'test',24,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (353,'test',23,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (357,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (362,'test',26,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (361,'test',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (365,'free',26,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (367,'free',24,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (368,'free',23,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (369,'free',22,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (370,'free',24,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (374,'test',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (375,'test',24,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (376,'test',26,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (377,'test',25,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (382,'seojin',23,'2','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (384,'c001',27,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (393,'s001',29,'2','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (394,'freelancer',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (400,'asdfadfasd',23,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (403,'asdfadfasd',6,'1','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (406,'designer',22,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (440,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (442,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (469,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (476,'free',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (483,'free',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (489,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (492,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (499,'free',4,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (505,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (508,'free',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (512,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (517,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (524,'free',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (528,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (543,'free',8,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (544,'free',9,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (554,'test',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (556,'free',3,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (560,'test',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (569,'free',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (575,'freelancer',3,'1','1�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (578,'free2',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (593,'free2',4,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (594,'free2',8,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (607,'free2',27,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (609,'free2',25,'1','3�� �̻� 5�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (615,'free2',6,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (622,'free',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (623,'free',23,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (628,'free',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (629,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (630,'free',27,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (631,'free',9,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (632,'free',2,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (636,'test',23,'0','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (637,'test',22,'1','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (638,'test',28,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (639,'test',24,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (640,'test',27,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (641,'test',5,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (648,'free4',27,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (649,'free4',22,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (650,'free4',23,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (651,'free4',25,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (652,'free4',24,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (653,'free4',26,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (654,'free5',22,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (701,'free',28,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (712,'free',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (713,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (714,'free',8,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (715,'free',30,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (716,'free',3,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (736,'free',28,'0','3�� �̻� 5�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (737,'free',8,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (204,'free',2,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (242,'free',33,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (244,'free',8,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (245,'free',32,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (263,'b003',28,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (267,'b002',22,'2','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (273,'free',25,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (281,'free',26,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (283,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (284,'free',25,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (292,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (297,'free',26,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (305,'free',22,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (306,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (307,'free',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (189,'free',4,'0','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (315,'free',3,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (323,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (326,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (338,'free',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (342,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (343,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (354,'test',27,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (355,'free',30,'0','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (380,'seojin',25,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (409,'b002',27,'2','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (410,'b002',27,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (414,'b002',27,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (416,'b002',27,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (418,'b002',27,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (420,'b002',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (421,'b002',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (422,'b002',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (423,'b002',25,'1','3�� �̻� 5�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (428,'free',22,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (430,'free',2,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (432,'free',23,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (433,'free',33,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (434,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (435,'free',2,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (438,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (439,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (445,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (446,'free',24,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (447,'free',28,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (461,'free',22,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (462,'free',1,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (468,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (478,'free',24,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (479,'free',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (484,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (486,'free',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (490,'free',23,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (493,'free',23,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (496,'free',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (497,'free',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (498,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (503,'free',23,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (506,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (532,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (533,'free',24,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (535,'free',6,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (540,'free',27,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (546,'free',24,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (549,'test',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (557,'free',30,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (562,'test',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (565,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (581,'free2',27,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (584,'free2',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (587,'free2',5,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (591,'free2',22,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (596,'free2',9,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (599,'free2',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (600,'free2',6,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (602,'free2',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (604,'free2',8,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (605,'free2',29,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (606,'free2',3,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (611,'free2',22,'1','1�� �̻� 3�� �̸�','n','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (612,'free2',26,'1','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (613,'free2',9,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (614,'free2',7,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (621,'free',0,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (624,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (625,'free',24,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (627,'free',26,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (642,'free3',24,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (643,'free3',22,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (644,'free3',23,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (645,'free3',25,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (646,'free3',26,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (647,'free3',27,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (657,'free5',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (659,'free5',23,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (660,'free5',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (661,'free5',25,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (662,'free5',26,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (663,'free5',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (664,'free5',22,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (665,'free5',24,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (666,'free5',25,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (667,'free5',27,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (668,'free5',9,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (669,'free5',7,'1','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (675,'free7',22,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (676,'free7',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (677,'free7',24,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (678,'free7',25,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (679,'free7',26,'1','1�� �̻� 3�� �̸�','n','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (680,'free7',27,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (699,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (705,'free',26,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (726,'free6',23,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (727,'free6',24,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (728,'free6',24,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (729,'free6',5,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (201,'free',7,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (202,'free',7,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (203,'free',33,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (193,'free',30,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (241,'free',32,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (261,'b003',0,'1','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (262,'b003',27,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (266,'b002',23,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (268,'b002',28,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (271,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (274,'free',22,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (278,'free',25,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (282,'free',0,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (287,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (291,'free',27,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (294,'free',24,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (295,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (298,'free',27,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (299,'free',28,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (300,'free',24,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (301,'free',26,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (310,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (311,'free',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (313,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (314,'free',6,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (319,'free',22,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (322,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (325,'free',24,'2','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (330,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (333,'free',34,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (335,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (337,'free',25,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (346,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (348,'free',35,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (350,'test',26,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (352,'test',0,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (356,'free',2,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (359,'test',22,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (363,'free',22,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (366,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (372,'free',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (373,'test',22,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (378,'seojin',22,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (379,'seojin',26,'0','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (383,'c001',22,'2','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (385,'c001',4,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (387,'c001',1,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (389,'s001',25,'2','10�� �̻�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (392,'s001',2,'2','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (395,'freelancer',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (398,'freelancer',26,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (402,'asdfadfasd',25,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (408,'designer',23,'0','1�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (405,'designer',27,'1','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (424,'free',22,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (426,'free',2,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (429,'free',26,'1','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (436,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (437,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (441,'free',2,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (443,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (444,'free',2,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (449,'free',27,'2','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (464,'free',23,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (463,'free',30,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (465,'free',24,'1','10�� �̻�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (467,'free',5,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (480,'free',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (481,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (485,'free',24,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (487,'free',27,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (488,'free',22,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (491,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (494,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (495,'free',25,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (500,'free',26,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (501,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (504,'free',22,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (507,'free',23,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (509,'free',27,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (510,'free',25,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (513,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (515,'free',25,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (516,'free',22,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (518,'free',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (519,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (522,'free',22,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (523,'free',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (525,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (526,'free',28,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (527,'free',24,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (530,'free',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (534,'free',28,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (536,'free',30,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (537,'free',8,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (539,'free',26,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (541,'free',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (547,'free',7,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (548,'free',22,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (550,'test',25,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (553,'test',27,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (555,'free',26,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (558,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (559,'free',27,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (561,'test',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (563,'test',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (566,'free',23,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (568,'free',27,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (572,'freelancer',25,'1','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (576,'freelancer',28,'2','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (579,'free2',8,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (582,'free2',3,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (583,'free2',24,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (585,'free2',6,'2','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (588,'free2',7,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (589,'free2',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (592,'free2',30,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (595,'free2',7,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (601,'free2',29,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (603,'free2',0,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (608,'free2',24,'1','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (610,'free2',27,'2','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (618,'free',9,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (619,'free',23,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (633,'free',23,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (655,'free5',23,'1','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (670,'free6',22,'2','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (671,'free6',23,'1','1�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (672,'free6',24,'0','5�� �̻� 10�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (673,'free6',25,'0','1�� �̻� 3�� �̸�','n','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (674,'free6',26,'0','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (692,'free9',27,'0','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (693,'free9',26,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (694,'free9',25,'1','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (695,'free9',24,'2','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (696,'free9',23,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (697,'free9',22,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (706,'free',24,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (707,'free',22,'0','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (708,'free',5,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (709,'free',27,'0','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (710,'free',0,'1','1�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (711,'free',30,'0','3�� �̻� 5�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (725,'free6',28,'0','5�� �̻� 10�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (730,'free',22,'0','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (731,'free',23,'1','1�� �̻� 3�� �̸�','y','0');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (732,'free',24,'1','1�� �̻� 3�� �̸�','n','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (733,'free',24,'2','3�� �̻� 5�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (734,'free',25,'1','1�� �̻� 3�� �̸�','y','1');
Insert into TECHNIQUE (TECH_NUM,MEM_ID,TECH_TYPE,TECH_FLUENT,TECH_PERIOD,TECH_STATUS,TECH_REPRE) values (735,'free',26,'1','1�� �̻� 3�� �̸�','y','0');
REM INSERTING into TEST
SET DEFINE OFF;
Insert into TEST (TEST_NUM,TEST_PR_NUM,MEM_ID,TEST_TITLE,TEST_TYPE,TEST_STATUS,TEST_DATE) values (42,283,'zxcv','�ٽ�','0','0',to_date('19/03/14','RR/MM/DD'));
Insert into TEST (TEST_NUM,TEST_PR_NUM,MEM_ID,TEST_TITLE,TEST_TYPE,TEST_STATUS,TEST_DATE) values (41,283,'zxcv','�ȳ礱����������','0','4',to_date('19/03/14','RR/MM/DD'));
REM INSERTING into WORK
SET DEFINE OFF;
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (143,'free','qwer',1,'1','asdasdasdsd',to_date('19/03/15','RR/MM/DD'),'100','8',to_date('19/03/16','RR/MM/DD'),to_date('19/03/23','RR/MM/DD'),'y',null,'143');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (144,'free','b002',254,'0','��������',to_date('19/03/15','RR/MM/DD'),'80','2',to_date('19/03/29','RR/MM/DD'),to_date('19/03/30','RR/MM/DD'),'y',null,'144');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (161,'cheeze','cheeze',1148,'2','�ȳ�ȳ�',to_date('19/03/19','RR/MM/DD'),'70','8',to_date('19/03/20','RR/MM/DD'),to_date('19/03/22','RR/MM/DD'),'y',null,'161');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (162,'a001','qwer',1197,'1','������Ʈ ���� ��� ����',to_date('19/03/19','RR/MM/DD'),'60','12',to_date('19/03/27','RR/MM/DD'),to_date('19/03/28','RR/MM/DD'),'y',null,'162');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (163,'a001','qwer',1197,'1','������Ʈ ���� �� ��� ����',to_date('19/03/19','RR/MM/DD'),'60','10',to_date('19/03/29','RR/MM/DD'),to_date('19/03/30','RR/MM/DD'),'y','1','162');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (164,'a001','seojin',1197,'0','ȸ�� ����',to_date('19/03/19','RR/MM/DD'),'90','8',to_date('19/03/27','RR/MM/DD'),to_date('19/03/29','RR/MM/DD'),'y',null,'164');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (165,'a001','sysy',1197,'1','������Ʈ ����',to_date('19/03/19','RR/MM/DD'),'70','10',to_date('19/03/29','RR/MM/DD'),to_date('19/03/30','RR/MM/DD'),'y','3','164');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (166,'a001','a001',1197,'1','������Ʈ ���',to_date('19/03/19','RR/MM/DD'),'60','8',to_date('19/03/30','RR/MM/DD'),to_date('19/03/31','RR/MM/DD'),'y',null,'166');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (167,'a001','a001',1197,'2','���� ������Ʈ ���',to_date('19/03/19','RR/MM/DD'),'80','8',to_date('19/04/01','RR/MM/DD'),to_date('19/04/02','RR/MM/DD'),'y','5','166');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (168,'a001','a001',1197,'2','���� ������Ʈ ����',to_date('19/03/19','RR/MM/DD'),'100','8',to_date('19/04/02','RR/MM/DD'),to_date('19/04/03','RR/MM/DD'),'y','5','166');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (169,'a001','qwer',1197,'0','������Ʈ �ϰ� ���',to_date('19/03/19','RR/MM/DD'),'90','8',to_date('19/04/05','RR/MM/DD'),to_date('19/04/06','RR/MM/DD'),'y','1','162');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (170,'a001','qwer',1197,'0','��Ʈ��Ʈ ����',to_date('19/03/19','RR/MM/DD'),'40','8',to_date('19/04/06','RR/MM/DD'),to_date('19/04/07','RR/MM/DD'),'y','8','169');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (171,'a001','qwer',1197,'0','Ķ���� ����',to_date('19/03/19','RR/MM/DD'),'70','10',to_date('19/04/07','RR/MM/DD'),to_date('19/04/08','RR/MM/DD'),'y',null,'171');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (172,'a001','a001',1197,'1','ǮĶ���� ����',to_date('19/03/19','RR/MM/DD'),'50','10',to_date('19/04/10','RR/MM/DD'),to_date('19/04/11','RR/MM/DD'),'y','10','171');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (173,'a001','qwer',1197,'1','ȸ������',to_date('19/03/19','RR/MM/DD'),'60','8',to_date('19/03/29','RR/MM/DD'),to_date('19/03/30','RR/MM/DD'),'y',null,'173');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (174,'a001','qwer',1197,'0','ĸí',to_date('19/03/19','RR/MM/DD'),'100','10',to_date('19/04/03','RR/MM/DD'),to_date('19/04/06','RR/MM/DD'),'y','12','173');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (175,'a001','qwer',1197,'0','������Ʈ ����',to_date('19/03/19','RR/MM/DD'),'100','12',to_date('19/04/02','RR/MM/DD'),to_date('19/04/07','RR/MM/DD'),'y','4','165');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (176,'qwer','a001',1197,'1','�޷� ����',to_date('19/03/19','RR/MM/DD'),'40','30',to_date('19/03/14','RR/MM/DD'),to_date('19/03/29','RR/MM/DD'),'y',null,'176');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (178,'qwer','b002',1001,'1','ȸ������ ����',to_date('19/03/20','RR/MM/DD'),'30','6',to_date('19/03/22','RR/MM/DD'),to_date('19/03/29','RR/MM/DD'),'y',null,'178');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (177,'qwer','qwer',1001,'1','�α��� ����',to_date('19/03/20','RR/MM/DD'),'50','1',to_date('19/03/22','RR/MM/DD'),to_date('19/03/29','RR/MM/DD'),'y',null,'177');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (141,'qwer','qwer',283,'0','�ȳ�',to_date('19/03/14','RR/MM/DD'),'30','10',to_date('19/03/14','RR/MM/DD'),to_date('19/03/16','RR/MM/DD'),'y',null,'141');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (142,'qwer','test',283,'0','�μ�',to_date('19/03/14','RR/MM/DD'),'100','8',to_date('19/03/26','RR/MM/DD'),to_date('19/03/28','RR/MM/DD'),'y','1','141');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (146,'free','free',261,'0','����',to_date('19/03/15','RR/MM/DD'),'80','8',to_date('19/03/29','RR/MM/DD'),to_date('19/03/29','RR/MM/DD'),'y','1','145');
Insert into WORK (WORK_NUM,MEM_ID,WORK_CHAR_ID,WORK_PROJ_NUM,WORK_PRIORITY,WORK_TITLE,WORK_DATE,WORK_PROGRESS,WORK_TIME,WORK_START,WORK_END,WORK_STATUS,WORK_ORDER,WORK_GROUP) values (145,'free','test',261,'1','��Ա�',to_date('19/03/15','RR/MM/DD'),'80','8',to_date('19/03/22','RR/MM/DD'),to_date('19/03/27','RR/MM/DD'),'y',null,'145');
--------------------------------------------------------
--  DDL for Index PLAYER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAYER_PK" ON "ACADEMIC" ("AC_NUM")
--------------------------------------------------------
--  DDL for Index PK_ARALM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ARALM" ON "ALARM" ("MEM_ID")
--------------------------------------------------------
--  DDL for Index PK_ARLARM_MESSAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ARLARM_MESSAGE" ON "ALARM_MESSAGE" ("ARMSG_NUM")
--------------------------------------------------------
--  DDL for Index APMEETING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "APMEETING_PK" ON "APMEETING" ("APMT_NUM")
--------------------------------------------------------
--  DDL for Index PK_APPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_APPLY" ON "APPLY" ("AP_NUM")
--------------------------------------------------------
--  DDL for Index PK_BANK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BANK" ON "BANK" ("BANK_CODE")
--------------------------------------------------------
--  DDL for Index PK_BANK_ACCOUNT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BANK_ACCOUNT" ON "BANK_ACCOUNT" ("AC_NUM")
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD" ON "BOARD" ("BO_NUM")
--------------------------------------------------------
--  DDL for Index PK_BOARD_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD_FILE" ON "BOARD_FILE" ("BOFILE_NUM")
--------------------------------------------------------
--  DDL for Index PK_BOARD_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD_REPLY" ON "BOARD_REPLY" ("BORE_NUM")
--------------------------------------------------------
--  DDL for Index PK_CAREER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CAREER" ON "CAREER" ("CA_NUM")
--------------------------------------------------------
--  DDL for Index PK_CATEGORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CATEGORY" ON "CATEGORY" ("CATE_NUM")
--------------------------------------------------------
--  DDL for Index PK_CHAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CHAT" ON "CHAT" ("CHAT_NUM")
--------------------------------------------------------
--  DDL for Index PK_CONSTRACT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CONSTRACT" ON "CONSTRACT" ("CONS_NUM")
--------------------------------------------------------
--  DDL for Index PK_CONSTRACT_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CONSTRACT_FILE" ON "CONSTRACT_FILE" ("CONS_NUM")
--------------------------------------------------------
--  DDL for Index DIAGRAM_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIAGRAM_DATA_PK" ON "DIAGRAM_DATA" ("DATA_NUM")
--------------------------------------------------------
--  DDL for Index PK_EVALATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EVALATION" ON "EVALATION" ("EV_NUM")
--------------------------------------------------------
--  DDL for Index PK_FREE_TYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FREE_TYPE" ON "FREE_TYPE" ("FTYPE_NUM")
--------------------------------------------------------
--  DDL for Index PK_INTEREST_PROJECT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INTEREST_PROJECT" ON "INTEREST_PROJECT" ("INPR_NUM")
--------------------------------------------------------
--  DDL for Index PK_INTEST_FREELANCER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INTEST_FREELANCER" ON "INTEST_FREELANCER" ("INFR_NUM")
--------------------------------------------------------
--  DDL for Index LANGUAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LANGUAGE_PK" ON "LANGUAGE" ("LAN_NUM")
--------------------------------------------------------
--  DDL for Index LICENSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LICENSE_PK" ON "LICENSE" ("LI_NUM")
--------------------------------------------------------
--  DDL for Index PK_MEETING
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEETING" ON "MEETING" ("MT_NUM")
--------------------------------------------------------
--  DDL for Index PK_MEM_IDENTITY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEM_IDENTITY" ON "MEM_IDENTITY" ("IDEN_NUM")
--------------------------------------------------------
--  DDL for Index PK_MEM_STATUS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEM_STATUS" ON "MEM_STATUS" ("STATUS_NUM")
--------------------------------------------------------
--  DDL for Index PK_MEM_TYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEM_TYPE" ON "MEM_TYPE" ("MTYPE_NUM")
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEMBER" ON "MEMBER" ("MEM_ID")
--------------------------------------------------------
--  DDL for Index PK_MESSAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MESSAGE" ON "MESSAGE" ("MSG_NUM")
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTICE" ON "NOTICE" ("NO_NUM")
--------------------------------------------------------
--  DDL for Index PK_NOTICE_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTICE_FILE" ON "NOTICE_FILE" ("NOFILE_NUM")
--------------------------------------------------------
--  DDL for Index PK_OUTPUT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OUTPUT" ON "OUTPUT" ("OUPUT_NUM")
--------------------------------------------------------
--  DDL for Index PK_PART
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PART" ON "PART" ("PART_NUM")
--------------------------------------------------------
--  DDL for Index PK_PORTFOLIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PORTFOLIO" ON "PORTFOLIO" ("PO_NUM")
--------------------------------------------------------
--  DDL for Index PK_PORTFOLIO_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PORTFOLIO_FILE" ON "PORTFOLIO_FILE" ("POFILE_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT" ON "PROJECT" ("PR_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_FILE" ON "PROJECT_FILE" ("PR_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_NOTICE" ON "PROJECT_NOTICE" ("PRNO_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_NOTICE_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_NOTICE_FILE" ON "PROJECT_NOTICE_FILE" ("PRNOFILE_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_OUTPUT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_OUTPUT" ON "PROJECT_OUTPUT" ("PROUT_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_REPLY" ON "PROJECT_REPLY" ("PRRE_NUM")
--------------------------------------------------------
--  DDL for Index PK_PROJECT_STATUS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_STATUS" ON "PROJECT_STATUS" ("PR_STATUS")
--------------------------------------------------------
--  DDL for Index PROJECT_TECH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT_TECH_PK" ON "PROJECT_TECH" ("PTECH_NUM")
--------------------------------------------------------
--  DDL for Index PROJECT_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT_TYPE_PK" ON "PROJECT_TYPE" ("PTYPE_NUM")
--------------------------------------------------------
--  DDL for Index PK_QNA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_QNA" ON "QNA" ("QA_NUM")
--------------------------------------------------------
--  DDL for Index PK_QNA_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_QNA_FILE" ON "QNA_FILE" ("QAFILE_NUM")
--------------------------------------------------------
--  DDL for Index PK_SCHEDULE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SCHEDULE" ON "SCHEDULE" ("SC_NUM")
--------------------------------------------------------
--  DDL for Index SIGN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SIGN_PK" ON "SIGN" ("SIGN_NUM")
--------------------------------------------------------
--  DDL for Index TABLE_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE_DATA_PK" ON "TABLE_DATA" ("DATA_NUM")
--------------------------------------------------------
--  DDL for Index PK_TECHNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TECHNIQUE" ON "TECHNIQUE" ("TECH_NUM")
--------------------------------------------------------
--  DDL for Index PK_TEST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TEST" ON "TEST" ("TEST_NUM")
--------------------------------------------------------
--  DDL for Index PK_WORK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_WORK" ON "WORK" ("WORK_NUM")
--------------------------------------------------------
--  Constraints for Table ACADEMIC
--------------------------------------------------------

  ALTER TABLE "ACADEMIC" MODIFY ("AC_IN" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" MODIFY ("AC_MAJOR" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" MODIFY ("AC_SCHOOL" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" MODIFY ("AC_FINAL" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" MODIFY ("AC_TYPE" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" ADD CONSTRAINT "PLAYER_PK" PRIMARY KEY ("AC_NUM") ENABLE
  ALTER TABLE "ACADEMIC" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "ACADEMIC" MODIFY ("AC_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ALARM
--------------------------------------------------------

  ALTER TABLE "ALARM" ADD CONSTRAINT "PK_ARALM" PRIMARY KEY ("MEM_ID") ENABLE
  ALTER TABLE "ALARM" MODIFY ("AR_MA_CON" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("AR_PH_CON" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("AR_MA_APPLY" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("AR_PH_APPLY" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("AR_MA_PROJECT" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("AR_PH_PROJECT" NOT NULL ENABLE)
  ALTER TABLE "ALARM" MODIFY ("MEM_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ALARM_MESSAGE
--------------------------------------------------------

  ALTER TABLE "ALARM_MESSAGE" MODIFY ("ARMSG_STAUTS" NOT NULL ENABLE)
  ALTER TABLE "ALARM_MESSAGE" MODIFY ("ARMSG_HIT" NOT NULL ENABLE)
  ALTER TABLE "ALARM_MESSAGE" ADD CONSTRAINT "PK_ARLARM_MESSAGE" PRIMARY KEY ("ARMSG_NUM") ENABLE
  ALTER TABLE "ALARM_MESSAGE" MODIFY ("ARMSG_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "ALARM_MESSAGE" MODIFY ("ARMSG_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table APMEETING
--------------------------------------------------------

  ALTER TABLE "APMEETING" ADD CONSTRAINT "APMEETING_PK" PRIMARY KEY ("APMT_NUM") ENABLE
  ALTER TABLE "APMEETING" MODIFY ("APMT_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table APPLY
--------------------------------------------------------

  ALTER TABLE "APPLY" MODIFY ("AP_STATUS" NOT NULL ENABLE)
  ALTER TABLE "APPLY" ADD CONSTRAINT "PK_APPLY" PRIMARY KEY ("AP_NUM") ENABLE
  ALTER TABLE "APPLY" MODIFY ("AP_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "APPLY" MODIFY ("AP_DATE" NOT NULL ENABLE)
  ALTER TABLE "APPLY" MODIFY ("AP_PROJECT" NOT NULL ENABLE)
  ALTER TABLE "APPLY" MODIFY ("AP_FREE" NOT NULL ENABLE)
  ALTER TABLE "APPLY" MODIFY ("AP_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table BANK
--------------------------------------------------------

  ALTER TABLE "BANK" ADD CONSTRAINT "PK_BANK" PRIMARY KEY ("BANK_CODE") ENABLE
  ALTER TABLE "BANK" MODIFY ("BANK_NAME" NOT NULL ENABLE)
  ALTER TABLE "BANK" MODIFY ("BANK_CODE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table BANK_ACCOUNT
--------------------------------------------------------

  ALTER TABLE "BANK_ACCOUNT" ADD CONSTRAINT "PK_BANK_ACCOUNT" PRIMARY KEY ("AC_NUM") ENABLE
  ALTER TABLE "BANK_ACCOUNT" MODIFY ("AC_NAME" NOT NULL ENABLE)
  ALTER TABLE "BANK_ACCOUNT" MODIFY ("AC_BANK" NOT NULL ENABLE)
  ALTER TABLE "BANK_ACCOUNT" MODIFY ("AC_MEM" NOT NULL ENABLE)
  ALTER TABLE "BANK_ACCOUNT" MODIFY ("AC_ACCOUNT" NOT NULL ENABLE)
  ALTER TABLE "BANK_ACCOUNT" MODIFY ("AC_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("BO_NUM") ENABLE
  ALTER TABLE "BOARD" MODIFY ("BO_STATUS" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("BO_DATE" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("BO_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("BO_TITLE" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("BO_HIT" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "BOARD" MODIFY ("BO_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table BOARD_FILE
--------------------------------------------------------

  ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "PK_BOARD_FILE" PRIMARY KEY ("BOFILE_NUM") ENABLE
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_SIZE" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BO_NUM" NOT NULL ENABLE)
  ALTER TABLE "BOARD_FILE" MODIFY ("BOFILE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table BOARD_REPLY
--------------------------------------------------------

  ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "PK_BOARD_REPLY" PRIMARY KEY ("BORE_NUM") ENABLE
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_SEQ" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_GROUP" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_DEPTH" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_DATE" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BO_NUM" NOT NULL ENABLE)
  ALTER TABLE "BOARD_REPLY" MODIFY ("BORE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CAREER
--------------------------------------------------------

  ALTER TABLE "CAREER" ADD CONSTRAINT "PK_CAREER" PRIMARY KEY ("CA_NUM") ENABLE
  ALTER TABLE "CAREER" MODIFY ("CA_IN" NOT NULL ENABLE)
  ALTER TABLE "CAREER" MODIFY ("CA_COMPANY" NOT NULL ENABLE)
  ALTER TABLE "CAREER" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "CAREER" MODIFY ("CA_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY ("CATE_NUM") ENABLE
  ALTER TABLE "CATEGORY" MODIFY ("CATE_DETAIL" NOT NULL ENABLE)
  ALTER TABLE "CATEGORY" MODIFY ("CATE_CATEGORY" NOT NULL ENABLE)
  ALTER TABLE "CATEGORY" MODIFY ("CATE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY ("CHAT_NUM") ENABLE
  ALTER TABLE "CHAT" MODIFY ("CHAT_DATE" NOT NULL ENABLE)
  ALTER TABLE "CHAT" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "CHAT" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "CHAT" MODIFY ("CHAT_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CONSTRACT
--------------------------------------------------------

  ALTER TABLE "CONSTRACT" MODIFY ("CONS_STATUS" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT" ADD CONSTRAINT "PK_CONSTRACT" PRIMARY KEY ("CONS_NUM") ENABLE
  ALTER TABLE "CONSTRACT" MODIFY ("CONS_PROJ_NUM" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT" MODIFY ("CONS_FREE_ID" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT" MODIFY ("CONS_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CONSTRACT_FILE
--------------------------------------------------------

  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" ADD CONSTRAINT "PK_CONSTRACT_FILE" PRIMARY KEY ("CONS_NUM") ENABLE
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_SIZE" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONSFILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "CONSTRACT_FILE" MODIFY ("CONS_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table DIAGRAM_DATA
--------------------------------------------------------

  ALTER TABLE "DIAGRAM_DATA" MODIFY ("DATA_TITLE" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("DATA_DATE" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("OUTPUT_NUM" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("DATA_STATUS" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" ADD CONSTRAINT "DIAGRAM_DATA_PK" PRIMARY KEY ("DATA_NUM") ENABLE
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("DATA_DATA" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "DIAGRAM_DATA" MODIFY ("DATA_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table EVALATION
--------------------------------------------------------

  ALTER TABLE "EVALATION" ADD CONSTRAINT "PK_EVALATION" PRIMARY KEY ("EV_NUM") ENABLE
  ALTER TABLE "EVALATION" MODIFY ("CONS_NUM" NOT NULL ENABLE)
  ALTER TABLE "EVALATION" MODIFY ("EV_TO" NOT NULL ENABLE)
  ALTER TABLE "EVALATION" MODIFY ("EV_FROM" NOT NULL ENABLE)
  ALTER TABLE "EVALATION" MODIFY ("EV_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table FREE_TYPE
--------------------------------------------------------

  ALTER TABLE "FREE_TYPE" ADD CONSTRAINT "PK_FREE_TYPE" PRIMARY KEY ("FTYPE_NUM") ENABLE
  ALTER TABLE "FREE_TYPE" MODIFY ("FTYPE_NAME" NOT NULL ENABLE)
  ALTER TABLE "FREE_TYPE" MODIFY ("FTYPE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table INTEREST_PROJECT
--------------------------------------------------------

  ALTER TABLE "INTEREST_PROJECT" ADD CONSTRAINT "PK_INTEREST_PROJECT" PRIMARY KEY ("INPR_NUM") ENABLE
  ALTER TABLE "INTEREST_PROJECT" MODIFY ("INPR_PROJECT" NOT NULL ENABLE)
  ALTER TABLE "INTEREST_PROJECT" MODIFY ("INPR_FREE" NOT NULL ENABLE)
  ALTER TABLE "INTEREST_PROJECT" MODIFY ("INPR_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table INTEST_FREELANCER
--------------------------------------------------------

  ALTER TABLE "INTEST_FREELANCER" ADD CONSTRAINT "PK_INTEST_FREELANCER" PRIMARY KEY ("INFR_NUM") ENABLE
  ALTER TABLE "INTEST_FREELANCER" MODIFY ("INFR_FREE" NOT NULL ENABLE)
  ALTER TABLE "INTEST_FREELANCER" MODIFY ("INFR_CLIENT" NOT NULL ENABLE)
  ALTER TABLE "INTEST_FREELANCER" MODIFY ("INFR_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table LANGUAGE
--------------------------------------------------------

  ALTER TABLE "LANGUAGE" ADD CONSTRAINT "LANGUAGE_PK" PRIMARY KEY ("LAN_NUM") ENABLE
  ALTER TABLE "LANGUAGE" MODIFY ("LAN_NAME" NOT NULL ENABLE)
  ALTER TABLE "LANGUAGE" MODIFY ("LAN_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table LICENSE
--------------------------------------------------------

  ALTER TABLE "LICENSE" MODIFY ("LI_DATE" NOT NULL ENABLE)
  ALTER TABLE "LICENSE" MODIFY ("LI_ORGANIZATION" NOT NULL ENABLE)
  ALTER TABLE "LICENSE" MODIFY ("LI_NAME" NOT NULL ENABLE)
  ALTER TABLE "LICENSE" ADD CONSTRAINT "LICENSE_PK" PRIMARY KEY ("LI_NUM") ENABLE
  ALTER TABLE "LICENSE" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "LICENSE" MODIFY ("LI_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEETING
--------------------------------------------------------

  ALTER TABLE "MEETING" ADD CONSTRAINT "PK_MEETING" PRIMARY KEY ("MT_NUM") ENABLE
  ALTER TABLE "MEETING" MODIFY ("MT_STATUS" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_TO_ACCEPT" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_FROM_ACCEPT" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_REASON" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_TIME" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_DATE" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_TO" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MT_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEM_IDENTITY
--------------------------------------------------------

  ALTER TABLE "MEM_IDENTITY" ADD CONSTRAINT "PK_MEM_IDENTITY" PRIMARY KEY ("IDEN_NUM") ENABLE
  ALTER TABLE "MEM_IDENTITY" MODIFY ("IDEN_NAME" NOT NULL ENABLE)
  ALTER TABLE "MEM_IDENTITY" MODIFY ("IDEN_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEM_STATUS
--------------------------------------------------------

  ALTER TABLE "MEM_STATUS" ADD CONSTRAINT "PK_MEM_STATUS" PRIMARY KEY ("STATUS_NUM") ENABLE
  ALTER TABLE "MEM_STATUS" MODIFY ("STATUS_NAME" NOT NULL ENABLE)
  ALTER TABLE "MEM_STATUS" MODIFY ("STATUS_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEM_TYPE
--------------------------------------------------------

  ALTER TABLE "MEM_TYPE" ADD CONSTRAINT "PK_MEM_TYPE" PRIMARY KEY ("MTYPE_NUM") ENABLE
  ALTER TABLE "MEM_TYPE" MODIFY ("MTYPE_NAME" NOT NULL ENABLE)
  ALTER TABLE "MEM_TYPE" MODIFY ("MTYPE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("MEM_ID") ENABLE
  ALTER TABLE "MEMBER" MODIFY ("IDEN_NUM" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_DATE" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_HP" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_MAIL" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_NAME" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_PASS" NOT NULL ENABLE)
  ALTER TABLE "MEMBER" MODIFY ("MEM_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY ("MSG_NUM") ENABLE
  ALTER TABLE "MESSAGE" MODIFY ("MSG_HIT" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_STATUS" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_DATE" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_TITLE" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_TO" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_FROM" NOT NULL ENABLE)
  ALTER TABLE "MESSAGE" MODIFY ("MSG_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" MODIFY ("NO_STATUS" NOT NULL ENABLE)
  ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NO_NUM") ENABLE
  ALTER TABLE "NOTICE" MODIFY ("NO_HIT" NOT NULL ENABLE)
  ALTER TABLE "NOTICE" MODIFY ("NO_DATE" NOT NULL ENABLE)
  ALTER TABLE "NOTICE" MODIFY ("NO_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "NOTICE" MODIFY ("NO_TITLE" NOT NULL ENABLE)
  ALTER TABLE "NOTICE" MODIFY ("NO_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table NOTICE_FILE
--------------------------------------------------------

  ALTER TABLE "NOTICE_FILE" ADD CONSTRAINT "PK_NOTICE_FILE" PRIMARY KEY ("NOFILE_NUM") ENABLE
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_SIZE" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_NOTI_NUM" NOT NULL ENABLE)
  ALTER TABLE "NOTICE_FILE" MODIFY ("NOFILE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table OUTPUT
--------------------------------------------------------

  ALTER TABLE "OUTPUT" ADD CONSTRAINT "PK_OUTPUT" PRIMARY KEY ("OUPUT_NUM") ENABLE
  ALTER TABLE "OUTPUT" MODIFY ("OUTPUT_NAME" NOT NULL ENABLE)
  ALTER TABLE "OUTPUT" MODIFY ("OUTPUT_TYPE" NOT NULL ENABLE)
  ALTER TABLE "OUTPUT" MODIFY ("OUPUT_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PART
--------------------------------------------------------

  ALTER TABLE "PART" ADD CONSTRAINT "PK_PART" PRIMARY KEY ("PART_NUM") ENABLE
  ALTER TABLE "PART" MODIFY ("PART" NOT NULL ENABLE)
  ALTER TABLE "PART" MODIFY ("PART_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PORTFOLIO
--------------------------------------------------------

  ALTER TABLE "PORTFOLIO" MODIFY ("PO_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO" ADD CONSTRAINT "PK_PORTFOLIO" PRIMARY KEY ("PO_NUM") ENABLE
  ALTER TABLE "PORTFOLIO" MODIFY ("PO_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO" MODIFY ("PO_TITLE" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO" MODIFY ("PO_CATE_NUM" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO" MODIFY ("PO_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PORTFOLIO_FILE
--------------------------------------------------------

  ALTER TABLE "PORTFOLIO_FILE" ADD CONSTRAINT "PK_PORTFOLIO_FILE" PRIMARY KEY ("POFILE_NUM") ENABLE
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("POFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("POFILE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("POFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("POFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("PO_NUM" NOT NULL ENABLE)
  ALTER TABLE "PORTFOLIO_FILE" MODIFY ("POFILE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY ("PR_NUM") ENABLE
  ALTER TABLE "PROJECT" MODIFY ("CLIENT" NOT NULL ENABLE)
  ALTER TABLE "PROJECT" MODIFY ("PR_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_FILE
--------------------------------------------------------

  ALTER TABLE "PROJECT_FILE" ADD CONSTRAINT "PK_PROJECT_FILE" PRIMARY KEY ("PR_NUM") ENABLE
  ALTER TABLE "PROJECT_FILE" MODIFY ("PRFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_FILE" MODIFY ("PRFILE_SIZE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_FILE" MODIFY ("PRFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_FILE" MODIFY ("PRFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_FILE" MODIFY ("PR_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_NOTICE
--------------------------------------------------------

  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" ADD CONSTRAINT "PK_PROJECT_NOTICE" PRIMARY KEY ("PRNO_NUM") ENABLE
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_TITLE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_HIT" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_DATE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_WRITER" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE" MODIFY ("PRNO_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_NOTICE_FILE
--------------------------------------------------------

  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNOFILE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" ADD CONSTRAINT "PK_PROJECT_NOTICE_FILE" PRIMARY KEY ("PRNOFILE_NUM") ENABLE
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNO_HIT" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNO_DATE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNO_SIZE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNOFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNOFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNOFILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNO_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_NOTICE_FILE" MODIFY ("PRNOFILE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_OUTPUT
--------------------------------------------------------

  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" ADD CONSTRAINT "PK_PROJECT_OUTPUT" PRIMARY KEY ("PROUT_NUM") ENABLE
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("OUPUT_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_DATE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_SIZE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_TYPE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_OUTPUT" MODIFY ("PROUT_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_REPLY
--------------------------------------------------------

  ALTER TABLE "PROJECT_REPLY" ADD CONSTRAINT "PK_PROJECT_REPLY" PRIMARY KEY ("PRRE_NUM") ENABLE
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_SEQ" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_GROUP" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_DEPTH" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_DATE" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_REPLY" MODIFY ("PRRE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_STATUS
--------------------------------------------------------

  ALTER TABLE "PROJECT_STATUS" ADD CONSTRAINT "PK_PROJECT_STATUS" PRIMARY KEY ("PR_STATUS") ENABLE
  ALTER TABLE "PROJECT_STATUS" MODIFY ("STATUS_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_STATUS" MODIFY ("PR_STATUS" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_TECH
--------------------------------------------------------

  ALTER TABLE "PROJECT_TECH" ADD CONSTRAINT "PROJECT_TECH_PK" PRIMARY KEY ("PTECH_NUM") ENABLE
  ALTER TABLE "PROJECT_TECH" MODIFY ("TECH_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_TECH" MODIFY ("PROJECT_NUM" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_TECH" MODIFY ("PTECH_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT_TYPE
--------------------------------------------------------

  ALTER TABLE "PROJECT_TYPE" ADD CONSTRAINT "PROJECT_TYPE_PK" PRIMARY KEY ("PTYPE_NUM") ENABLE
  ALTER TABLE "PROJECT_TYPE" MODIFY ("PTYPE_NAME" NOT NULL ENABLE)
  ALTER TABLE "PROJECT_TYPE" MODIFY ("PTYPE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY ("QA_NUM") ENABLE
  ALTER TABLE "QNA" MODIFY ("QA_GROUP" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_DEPTH" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_STATUS" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_DATE" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_TITLE" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_HIT" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "QNA" MODIFY ("QA_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table QNA_FILE
--------------------------------------------------------

  ALTER TABLE "QNA_FILE" ADD CONSTRAINT "PK_QNA_FILE" PRIMARY KEY ("QAFILE_NUM") ENABLE
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_DATE" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_STATUS" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_SIZE" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_QA_NUM" NOT NULL ENABLE)
  ALTER TABLE "QNA_FILE" MODIFY ("QAFILE_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY ("SC_NUM") ENABLE
  ALTER TABLE "SCHEDULE" MODIFY ("SC_STATUS" NOT NULL ENABLE)
  ALTER TABLE "SCHEDULE" MODIFY ("SC_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "SCHEDULE" MODIFY ("SC_START" NOT NULL ENABLE)
  ALTER TABLE "SCHEDULE" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "SCHEDULE" MODIFY ("SC_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table SIGN
--------------------------------------------------------

  ALTER TABLE "SIGN" ADD CONSTRAINT "SIGN_PK" PRIMARY KEY ("SIGN_NUM") ENABLE
  ALTER TABLE "SIGN" MODIFY ("SIGN_NUM" NOT NULL ENABLE)
  ALTER TABLE "SIGN" MODIFY ("SIGN_TYPE" NOT NULL ENABLE)
  ALTER TABLE "SIGN" MODIFY ("SIGN_SAVE_NAME" NOT NULL ENABLE)
  ALTER TABLE "SIGN" MODIFY ("MEM_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table TABLE_DATA
--------------------------------------------------------

  ALTER TABLE "TABLE_DATA" MODIFY ("DATA_DATE" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" MODIFY ("OUTPUT_NUM" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" MODIFY ("DATA_DATA" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" MODIFY ("PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" MODIFY ("DATA_STATUS" NOT NULL ENABLE)
  ALTER TABLE "TABLE_DATA" ADD CONSTRAINT "TABLE_DATA_PK" PRIMARY KEY ("DATA_NUM") ENABLE
--------------------------------------------------------
--  Constraints for Table TECHNIQUE
--------------------------------------------------------

  ALTER TABLE "TECHNIQUE" MODIFY ("TECH_TYPE" NOT NULL ENABLE)
  ALTER TABLE "TECHNIQUE" ADD CONSTRAINT "PK_TECHNIQUE" PRIMARY KEY ("TECH_NUM") ENABLE
  ALTER TABLE "TECHNIQUE" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "TECHNIQUE" MODIFY ("TECH_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table TEST
--------------------------------------------------------

  ALTER TABLE "TEST" MODIFY ("TEST_TYPE" NOT NULL ENABLE)
  ALTER TABLE "TEST" ADD CONSTRAINT "PK_TEST" PRIMARY KEY ("TEST_NUM") ENABLE
  ALTER TABLE "TEST" MODIFY ("TEST_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "TEST" MODIFY ("TEST_STATUS" NOT NULL ENABLE)
  ALTER TABLE "TEST" MODIFY ("TEST_TITLE" NOT NULL ENABLE)
  ALTER TABLE "TEST" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "TEST" MODIFY ("TEST_PR_NUM" NOT NULL ENABLE)
  ALTER TABLE "TEST" MODIFY ("TEST_NUM" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table WORK
--------------------------------------------------------

  ALTER TABLE "WORK" MODIFY ("WORK_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "WORK" ADD CONSTRAINT "PK_WORK" PRIMARY KEY ("WORK_NUM") ENABLE
  ALTER TABLE "WORK" MODIFY ("WORK_STATUS" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("WORK_TITLE" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("WORK_PROJ_NUM" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("WORK_CHAR_ID" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("MEM_ID" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("WORK_NUM" NOT NULL ENABLE)

  
  --------------------------------------------------------
--  ������ ������ - ������-3��-20-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ACADEMIC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACADEMIC_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence BANK_ACCOUNT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK_ACCOUNT_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence BOARD_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence BOARD_REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 301 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CAREER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CAREER_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CHAT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHAT_SEQ"  MINVALUE 0 MAXVALUE 99999 INCREMENT BY 1 START WITH 180 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CON_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CON_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence DIAGRAM_DATA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DIAGRAM_DATA_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence EVALATION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EVALATION_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence LICENSE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LICENSE_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence MEETING_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MEETING_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence NOTICE_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NOTICE_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NOTICE_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PORTFOLIO_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PORTFOLIO_FILE_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PORTFOLIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PORTFOLIO_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PROJECT_NOTICE_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT_NOTICE_FILE_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 102 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PROJECT_NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT_NOTICE_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 212 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PROJECT_OUTPUT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT_OUTPUT_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PROJECT_REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT_REPLY_SEQ"  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence QNA_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "QNA_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence QNA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "QNA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 261 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence SCHEDULE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCHEDULE_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence SIGN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SIGN_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 163 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence TABLE_DATA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TABLE_DATA_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence TECHNIQUE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TECHNIQUE_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 761 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence TEST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence TOTAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TOTAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1421 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence WORK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WORK_SEQ"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE
