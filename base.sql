--------------------------------------------------------
--  File created - środa-czerwca-05-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BANKACCOUNT
--------------------------------------------------------

  CREATE TABLE "FINANCE"."BANKACCOUNT" 
   (	"IDA" NUMBER, 
	"NUMBEROFACC" VARCHAR2(50 BYTE), 
	"BALANCE" NUMBER, 
	"IDU" NUMBER, 
	"BANK" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CREDITS
--------------------------------------------------------

  CREATE TABLE "FINANCE"."CREDITS" 
   (	"IDC" NUMBER, 
	"AMOUNT" NUMBER, 
	"AMOUNTLEFT" NUMBER, 
	"LENDINGRATE" NUMBER, 
	"IDA" NUMBER, 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPOSITS
--------------------------------------------------------

  CREATE TABLE "FINANCE"."DEPOSITS" 
   (	"IDD" NUMBER, 
	"AMOUNT" NUMBER, 
	"LENDINGRATE" VARCHAR2(20 BYTE), 
	"DATEOFSTART" DATE, 
	"DATEOFEND" DATE, 
	"IDA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EXPENSES
--------------------------------------------------------

  CREATE TABLE "FINANCE"."EXPENSES" 
   (	"IDE" NUMBER, 
	"AMOUNT" NUMBER, 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"DATEE" DATE, 
	"DESCRIPTION" VARCHAR2(20 BYTE), 
	"IDA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INCOMES
--------------------------------------------------------

  CREATE TABLE "FINANCE"."INCOMES" 
   (	"IDI" NUMBER, 
	"AMOUNT" VARCHAR2(20 BYTE), 
	"DATEE" DATE, 
	"DESCRIPTION" VARCHAR2(20 BYTE), 
	"IDA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "FINANCE"."USERS" 
   (	"IDU" NUMBER, 
	"EMAIL" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence BANKACCOUNT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."BANKACCOUNT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CREDITS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."CREDITS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPOSITS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."DEPOSITS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPOSITS_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."DEPOSITS_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EXPENSES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."EXPENSES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence INCOMES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."INCOMES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TABLE1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."TABLE1_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "FINANCE"."USERS_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
REM INSERTING into FINANCE.BANKACCOUNT
SET DEFINE OFF;
Insert into FINANCE.BANKACCOUNT (IDA,NUMBEROFACC,BALANCE,IDU,BANK) values ('3','123123','1850','1','Millenium');
Insert into FINANCE.BANKACCOUNT (IDA,NUMBEROFACC,BALANCE,IDU,BANK) values ('1','1231312','350','1','Millenium');
Insert into FINANCE.BANKACCOUNT (IDA,NUMBEROFACC,BALANCE,IDU,BANK) values ('6','33','3','1','Test');
Insert into FINANCE.BANKACCOUNT (IDA,NUMBEROFACC,BALANCE,IDU,BANK) values ('7','123123','650','1','Getin');
REM INSERTING into FINANCE.CREDITS
SET DEFINE OFF;
Insert into FINANCE.CREDITS (IDC,AMOUNT,AMOUNTLEFT,LENDINGRATE,IDA,NAME) values ('26','350','100','3','1','Domek');
Insert into FINANCE.CREDITS (IDC,AMOUNT,AMOUNTLEFT,LENDINGRATE,IDA,NAME) values ('27','35000','1000','6','3','Kredyt na dom');
Insert into FINANCE.CREDITS (IDC,AMOUNT,AMOUNTLEFT,LENDINGRATE,IDA,NAME) values ('28','3500','100','3','3','Laptop');
REM INSERTING into FINANCE.DEPOSITS
SET DEFINE OFF;
Insert into FINANCE.DEPOSITS (IDD,AMOUNT,LENDINGRATE,DATEOFSTART,DATEOFEND,IDA) values ('6','4','4',to_date('19/06/04','RR/MM/DD'),to_date('19/06/11','RR/MM/DD'),'3');
Insert into FINANCE.DEPOSITS (IDD,AMOUNT,LENDINGRATE,DATEOFSTART,DATEOFEND,IDA) values ('7','5','5',to_date('19/06/11','RR/MM/DD'),to_date('19/06/04','RR/MM/DD'),'3');
Insert into FINANCE.DEPOSITS (IDD,AMOUNT,LENDINGRATE,DATEOFSTART,DATEOFEND,IDA) values ('8','1','3',to_date('19/02/12','RR/MM/DD'),to_date('19/06/10','RR/MM/DD'),null);
Insert into FINANCE.DEPOSITS (IDD,AMOUNT,LENDINGRATE,DATEOFSTART,DATEOFEND,IDA) values ('9','300','3',to_date('19/06/06','RR/MM/DD'),to_date('19/06/06','RR/MM/DD'),'6');
REM INSERTING into FINANCE.EXPENSES
SET DEFINE OFF;
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('6','3','5',to_date('19/06/06','RR/MM/DD'),'"taK"','1');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('11','350','Dom',to_date('19/06/06','RR/MM/DD'),'Sklep','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('12','1','1',to_date('19/06/06','RR/MM/DD'),'1','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('13','5','ds',to_date('19/06/06','RR/MM/DD'),'33','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('14','3','3',to_date('19/06/06','RR/MM/DD'),'res','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('15','350','3',to_date('19/06/06','RR/MM/DD'),'3','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('16','11','1',to_date('19/06/06','RR/MM/DD'),'1','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('17','5','5',to_date('19/06/06','RR/MM/DD'),'5','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('18','6','6',to_date('19/06/13','RR/MM/DD'),'6','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('19','3','3',to_date('19/03/05','RR/MM/DD'),'3','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('20','100','cos',to_date('19/06/06','RR/MM/DD'),'tak','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('21','100','test',to_date('19/06/06','RR/MM/DD'),'test','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('22','200','se',to_date('19/06/07','RR/MM/DD'),'ese','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('23','100','cos',to_date('19/06/06','RR/MM/DD'),'tak','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('24','100','see',to_date('19/06/06','RR/MM/DD'),'tak','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('25','100','se',to_date('19/06/07','RR/MM/DD'),'tak','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('26','150','231',to_date('19/05/30','RR/MM/DD'),'3','3');
Insert into FINANCE.EXPENSES (IDE,AMOUNT,CATEGORY,DATEE,DESCRIPTION,IDA) values ('27','150','3',to_date('19/06/07','RR/MM/DD'),'tak','3');
REM INSERTING into FINANCE.INCOMES
SET DEFINE OFF;
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('4','1500',to_date('19/06/05','RR/MM/DD'),'PRACA-WYNAGRODZENIE','1');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('10','150',to_date('19/06/06','RR/MM/DD'),'e','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('7','200',to_date('19/06/06','RR/MM/DD'),'tak','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('5','100',to_date('19/06/06','RR/MM/DD'),'tak','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('6','150',to_date('19/06/06','RR/MM/DD'),'5','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('8','150',to_date('19/06/06','RR/MM/DD'),'test','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('9','150',to_date('19/06/13','RR/MM/DD'),'tes','3');
Insert into FINANCE.INCOMES (IDI,AMOUNT,DATEE,DESCRIPTION,IDA) values ('11','150',to_date('19/06/07','RR/MM/DD'),'tak','3');
REM INSERTING into FINANCE.USERS
SET DEFINE OFF;
Insert into FINANCE.USERS (IDU,EMAIL,PASSWORD) values ('1','m','m');
Insert into FINANCE.USERS (IDU,EMAIL,PASSWORD) values ('2','cos@wp.pl','123456');
--------------------------------------------------------
--  DDL for Index BANKACCOUNT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."BANKACCOUNT_PK" ON "FINANCE"."BANKACCOUNT" ("IDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CREDITS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."CREDITS_PK" ON "FINANCE"."CREDITS" ("IDC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPOSITS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."DEPOSITS_PK" ON "FINANCE"."DEPOSITS" ("IDD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EXPENSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."EXPENSES_PK" ON "FINANCE"."EXPENSES" ("IDE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index INCOMES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."INCOMES_PK" ON "FINANCE"."INCOMES" ("IDI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FINANCE"."USERS_PK" ON "FINANCE"."USERS" ("IDU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger BANKACCOUNT_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."BANKACCOUNT_TRG" 
BEFORE INSERT ON BANKACCOUNT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDA IS NULL THEN
      SELECT BANKACCOUNT_SEQ.NEXTVAL INTO :NEW.IDA FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."BANKACCOUNT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CREDITS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."CREDITS_TRG" 
BEFORE INSERT ON CREDITS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDC IS NULL THEN
      SELECT CREDITS_SEQ.NEXTVAL INTO :NEW.IDC FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."CREDITS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPOSITS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."DEPOSITS_TRG" 
BEFORE INSERT ON DEPOSITS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."DEPOSITS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPOSITS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."DEPOSITS_TRG1" 
BEFORE INSERT ON DEPOSITS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDD IS NULL THEN
      SELECT DEPOSITS_SEQ1.NEXTVAL INTO :NEW.IDD FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."DEPOSITS_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EXPENSES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."EXPENSES_TRG" 
BEFORE INSERT ON EXPENSES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDE IS NULL THEN
      SELECT EXPENSES_SEQ.NEXTVAL INTO :NEW.IDE FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."EXPENSES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INCOMES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."INCOMES_TRG" 
BEFORE INSERT ON INCOMES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDI IS NULL THEN
      SELECT INCOMES_SEQ.NEXTVAL INTO :NEW.IDI FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."INCOMES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."UPC" 
AFTER INSERT ON INCOMES
FOR EACH ROW
BEGIN
  UPDATE BANKACCOUNT
  SET BALANCE = BALANCE +:New.Amount
  WHERE IDA = 3;
END UPC;
/
ALTER TRIGGER "FINANCE"."UPC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."UPDB" 
AFTER INSERT ON EXPENSES
FOR EACH ROW
BEGIN
  UPDATE BANKACCOUNT
  SET BALANCE = BALANCE -:New.Amount
  WHERE IDA = :New.IDA;
END UPDB;
/
ALTER TRIGGER "FINANCE"."UPDB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."UPE" 
AFTER INSERT ON EXPENSES
FOR EACH ROW
BEGIN
  UPDATE BANKACCOUNT
  SET BALANCE = BALANCE -:New.Amount
  WHERE IDA = 3;
END UPE;
/
ALTER TRIGGER "FINANCE"."UPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."UPI" 
AFTER INSERT ON EXPENSES
FOR EACH ROW
BEGIN
  UPDATE BANKACCOUNT
  SET BALANCE = BALANCE +:New.Amount
  WHERE IDA = :New.IDA;
END UPDB;
/
ALTER TRIGGER "FINANCE"."UPI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPII
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."UPII" 
AFTER INSERT ON EXPENSES
FOR EACH ROW
BEGIN
  UPDATE BANKACCOUNT
  SET BALANCE = BALANCE -:New.Amount
  WHERE IDA = 3;
END UPII;
/
ALTER TRIGGER "FINANCE"."UPII" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FINANCE"."USERS_TRG" 
BEFORE INSERT ON USERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDU IS NULL THEN
      SELECT USERS_SEQ1.NEXTVAL INTO :NEW.IDU FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FINANCE"."USERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACCOUNT_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."ACCOUNT_DELETE" (
a_ida IN number) AS 
BEGIN
      DELETE from BANKACCOUNT where IDA=a_ida;
COMMIT;
END ACCOUNT_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure ACCOUNT_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."ACCOUNT_INSERT" (
    a_bank in BANKACCOUNT.BANK%type,
    a_numberofacc in BANKACCOUNT.NUMBEROFACC%type,
    a_balance in BANKACCOUNT.BALANCE%type,
    u_email in USERS.EMAIL%type
    )
IS
cur sys_refcursor;
iduu number;
BEGIN
    open cur for select IDU from USERS where Email=u_email;
    fetch cur into iduu;
    Insert into BANKACCOUNT (IDA, NUMBEROFACC, BALANCE,IDU,BANK)
        values (null, a_numberofacc, a_balance, iduu, a_bank);
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure ACCOUNT_SELECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."ACCOUNT_SELECT" (cur out sys_refcursor,
u_email in USERS.EMAIL%type
) AS  
curr sys_refcursor;
iduu number;
BEGIN
    open curr for select IDU from USERS where EMAIL=u_email;
    fetch curr into iduu;
  open cur for select * from BANKACCOUNT where IDU=iduu;
END ACCOUNT_SELECT;

/
--------------------------------------------------------
--  DDL for Procedure ACCOUNT_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."ACCOUNT_UPDATE" (
    a_bank in BANKACCOUNT.BANK%type,
    a_numberofacc in BANKACCOUNT.NUMBEROFACC%type,
    a_balance in BANKACCOUNT.BALANCE%type,
    a_ida in BANKACCOUNT.IDA%type) AS
BEGIN
  UPDATE BANKACCOUNT
    SET BANK = a_bank,
        NUMBEROFACC=a_numberofacc,
        BALANCE=a_balance
    where IDA = a_ida;
COMMIT;
END ACCOUNT_UPDATE;

/
--------------------------------------------------------
--  DDL for Procedure CREDIT_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."CREDIT_DELETE" (
c_idc IN number) AS 
BEGIN
      DELETE from CREDITS where IDC=c_idc;
COMMIT;
END CREDIT_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure CREDIT_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."CREDIT_INSERT" (
    c_amount in Credits.AMOUNT%type,
    c_amountleft in Credits.AMOUNTLEFT%type,
    c_lendingrate in Credits.LENDINGRATE%type,
    c_name in CREDITS.NAME%type,
    c_ida in BankAccount.IDA%type
    )
IS
cur sys_refcursor;
idaa number;
BEGIN
    open cur for select IDA from bankaccount where NUMBEROFACC=c_ida;
    fetch cur into idaa;
    Insert into CREDITS (IDC, AMOUNT, AMOUNTLEFT, LENDINGRATE,IDA, NAME)
        values (null, c_amount, c_amountleft, c_lendingrate,idaa, c_name);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREDIT_SELECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."CREDIT_SELECT" (cur out sys_refcursor, a_number in BANKACCOUNT.NUMBEROFACC%type) AS
curr sys_refcursor;
idaa number;
BEGIN
      open curr for select IDA from bankaccount where NUMBEROFACC=a_number;
    fetch curr into idaa;
  open cur for select * from CREDITS where IDA=idaa;
END CREDIT_SELECT;

/
--------------------------------------------------------
--  DDL for Procedure CREDIT_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."CREDIT_UPDATE" (
    c_idc in Credits.IDC%type,
    c_amount in Credits.AMOUNT%type,
    c_amountleft in Credits.AMOUNTLEFT%type,
    c_lendingrate in Credits.LENDINGRATE%type,
    c_name in CREDITS.NAME%type
    )AS 
BEGIN
  UPDATE Credits
    SET AMOUNT = c_amount,
        AMOUNTLEFT=c_amountleft,
        LENDINGRATE=c_lendingrate,
        NAME=c_name
    where IDC = c_idc;
COMMIT;
END CREDIT_UPDATE;

/
--------------------------------------------------------
--  DDL for Procedure DEPOSIT_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."DEPOSIT_DELETE" (
d_id IN number) AS 
BEGIN
      DELETE from DEPOSITS where IDD=d_id;
COMMIT;
END DEPOSIT_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure DEPOSIT_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."DEPOSIT_INSERT" (
    d_amount in DEPOSITS.AMOUNT%type,
    d_lendingrate in DEPOSITS.LENDINGRATE%type,
    d_start in DEPOSITS.DATEOFSTART%type,
    d_end in DEPOSITS.DATEOFEND%type,
    c_ida in BankAccount.IDA%type
    )
    AS
cur sys_refcursor;
idaa number;
BEGIN
    open cur for select IDA from bankaccount where NUMBEROFACC=c_ida;
    fetch cur into idaa;
    Insert into DEPOSITS (IDD, AMOUNT, LENDINGRATE, DATEOFSTART,DATEOFEND, IDA)
        values (null, d_amount, d_lendingrate, d_start,d_end, idaa);
END;

/
--------------------------------------------------------
--  DDL for Procedure DEPOSIT_SELECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."DEPOSIT_SELECT" (cur out sys_refcursor,
a_number in BANKACCOUNT.NUMBEROFACC%type
) AS  
curr sys_refcursor;
idaa number;
BEGIN
      open curr for select IDA from bankaccount where NUMBEROFACC=a_number;
    fetch curr into idaa;
  open cur for select * from DEPOSITS where IDA=idaa;
END DEPOSIT_SELECT;

/
--------------------------------------------------------
--  DDL for Procedure DEPOSIT_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."DEPOSIT_UPDATE" (
    d_amount in DEPOSITS.AMOUNT%type,
    d_lendingrate in DEPOSITS.LENDINGRATE%type,
    d_start in DEPOSITS.DATEOFSTART%type,
    d_end in DEPOSITS.DATEOFEND%type,
    d_ida in DEPOSITS.IDD%type
)AS 
BEGIN
  UPDATE Deposits
    SET AMOUNT=d_amount,
      LENDINGRATE=d_lendingrate,
      DATEOFSTART=d_start,
      DATEOFEND=d_end
      where IDD=d_ida;
  
END DEPOSIT_UPDATE;

/
--------------------------------------------------------
--  DDL for Procedure EXPENSE_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."EXPENSE_DELETE" (
e_id IN number) AS 
BEGIN
      DELETE from EXPENSES where IDE=e_id;
COMMIT;
END EXPENSE_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure EXPENSE_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."EXPENSE_INSERT" (
    e_amount in EXPENSES.AMOUNT%type,
    e_category in EXPENSES.CATEGORY%type,
    e_datee in EXPENSES.DATEE%type,
    e_description in EXPENSES.DESCRIPTION%type,
    e_ida in BankAccount.IDA%type) 
    AS
cur sys_refcursor;
idaa number;
BEGIN
    open cur for select IDA from bankaccount where NUMBEROFACC=e_ida;
    fetch cur into idaa;
    Insert into EXPENSES (IDE, AMOUNT, CATEGORY, DATEE,DESCRIPTION, IDA)
        values (null, e_amount, e_category, e_datee,e_description, idaa);
END EXPENSE_INSERT;

/
--------------------------------------------------------
--  DDL for Procedure EXPENSE_SELECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."EXPENSE_SELECT" (cur out sys_refcursor,
a_number in BANKACCOUNT.NUMBEROFACC%type
) AS 
curr sys_refcursor;
idaa number;
BEGIN
      open curr for select IDA from bankaccount where NUMBEROFACC=a_number;
    fetch curr into idaa;
  open cur for select * from EXPENSES where IDA=idaa;
END EXPENSE_SELECT;

/
--------------------------------------------------------
--  DDL for Procedure EXPENSE_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."EXPENSE_UPDATE" (
    e_amount in EXPENSES.AMOUNT%type,
    e_category in EXPENSES.CATEGORY%type,
    e_datee in EXPENSES.DATEE%type,
    e_description in EXPENSES.DESCRIPTION%type,
    e_ide in EXPENSES.IDE%type)  AS 
BEGIN
  UPDATE EXPENSES
    SET AMOUNT=e_amount,
      CATEGORY=e_category,
      DATEE=e_datee,
      DESCRIPTION=e_description
      where IDE=e_ide;
END EXPENSE_UPDATE;

/
--------------------------------------------------------
--  DDL for Procedure INCOME_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."INCOME_DELETE" (
i_id IN number) AS 
BEGIN
      DELETE from INCOMES where IDI=i_id;
COMMIT;
END INCOME_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure INCOME_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."INCOME_INSERT" (
    i_amount in INCOMES.AMOUNT%type,
    i_datee in INCOMES.DATEE%type,
    i_description in INCOMES.DESCRIPTION%type,
    i_ida in BankAccount.IDA%type) AS 
cur sys_refcursor;
idaa number;
BEGIN
    open cur for select IDA from bankaccount where NUMBEROFACC=i_ida;
    fetch cur into idaa;
    Insert into INCOMES (IDI, AMOUNT, DATEE,DESCRIPTION, IDA)
        values (null, i_amount, i_datee,i_description, idaa);
END INCOME_INSERT;

/
--------------------------------------------------------
--  DDL for Procedure INCOME_SELECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."INCOME_SELECT" (cur out sys_refcursor,
a_number in BANKACCOUNT.NUMBEROFACC%type
) AS  
curr sys_refcursor;
idaa number;
BEGIN
      open curr for select IDA from bankaccount where NUMBEROFACC=a_number;
    fetch curr into idaa;
  open cur for select * from INCOMES where IDA=idaa;
END INCOME_SELECT;

/
--------------------------------------------------------
--  DDL for Procedure INCOME_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."INCOME_UPDATE" (
    i_amount in INCOMES.AMOUNT%type,
    i_datee in INCOMES.DATEE%type,
    i_description in INCOMES.DESCRIPTION%type,
    i_idi in INCOMES.IDI%type) AS 
BEGIN
   UPDATE INCOMES
    SET AMOUNT=i_amount,
      DATEE=i_datee,
      DESCRIPTION=i_description
      where IDI=i_idi;
END INCOME_UPDATE;

/
--------------------------------------------------------
--  DDL for Procedure LOGIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."LOGIN" (
    u_email in USERS.EMAIL%type,
    u_password in USERS.PASSWORD%type,
    cur out sys_refcursor)
IS
BEGIN
    open cur for select EMAIL, PASSWORD from USERS where EMAIL=u_email and PASSWORD=u_password;
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure Login
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."Login" (
    u_email in USERS.EMAIL%type,
    u_password in USERS.PASSWORD%type)
IS
BEGIN
    Insert into users (IDU, EMAIL, PASSWORD)
        values (null, u_email, u_password);
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure USER_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FINANCE"."USER_INSERT" (
    u_email in USERS.EMAIL%type,
    u_password in USERS.PASSWORD%type)
IS
BEGIN
    Insert into users (IDU, EMAIL, PASSWORD)
        values (null, u_email, u_password);
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Function LOGGING
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FINANCE"."LOGGING" 
(
    u_email in USERS.EMAIL%type,
    u_password in USERS.PASSWORD%type)
    RETURN number AS
    id_t number;
BEGIN
  Select
  IDU
  into
  id_t
  from
  Users
  where
  EMAIL=u_email and
  PASSWORD=u_password;
   RETURN id_t;
END LOGGING;

/
--------------------------------------------------------
--  DDL for Function SUM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FINANCE"."SUM" RETURN NUMBER AS 
suma number;
BEGIN
  SELECT
  SUM(BALANCE)
  into suma
  From BANKACCOUNT;
  return suma;
END SUM;

/
--------------------------------------------------------
--  DDL for Function SUMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FINANCE"."SUMA" RETURN NUMBER AS 
suma number;
BEGIN
  SELECT
  SUM(BALANCE)
  into suma
  From BANKACCOUNT;
  return suma;
END SUMA;

/
--------------------------------------------------------
--  Constraints for Table INCOMES
--------------------------------------------------------

  ALTER TABLE "FINANCE"."INCOMES" MODIFY ("IDI" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."INCOMES" ADD CONSTRAINT "INCOMES_PK" PRIMARY KEY ("IDI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BANKACCOUNT
--------------------------------------------------------

  ALTER TABLE "FINANCE"."BANKACCOUNT" MODIFY ("IDU" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."BANKACCOUNT" ADD CONSTRAINT "BANKACCOUNT_PK" PRIMARY KEY ("IDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXPENSES
--------------------------------------------------------

  ALTER TABLE "FINANCE"."EXPENSES" MODIFY ("IDE" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."EXPENSES" ADD CONSTRAINT "EXPENSES_PK" PRIMARY KEY ("IDE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CREDITS
--------------------------------------------------------

  ALTER TABLE "FINANCE"."CREDITS" MODIFY ("IDC" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."CREDITS" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."CREDITS" ADD CONSTRAINT "CREDITS_PK" PRIMARY KEY ("IDC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "FINANCE"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("IDU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPOSITS
--------------------------------------------------------

  ALTER TABLE "FINANCE"."DEPOSITS" MODIFY ("IDD" NOT NULL ENABLE);
  ALTER TABLE "FINANCE"."DEPOSITS" ADD CONSTRAINT "DEPOSITS_PK" PRIMARY KEY ("IDD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BANKACCOUNT
--------------------------------------------------------

  ALTER TABLE "FINANCE"."BANKACCOUNT" ADD CONSTRAINT "USERACC" FOREIGN KEY ("IDU")
	  REFERENCES "FINANCE"."USERS" ("IDU") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CREDITS
--------------------------------------------------------

  ALTER TABLE "FINANCE"."CREDITS" ADD CONSTRAINT "CRACC" FOREIGN KEY ("IDA")
	  REFERENCES "FINANCE"."BANKACCOUNT" ("IDA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPOSITS
--------------------------------------------------------

  ALTER TABLE "FINANCE"."DEPOSITS" ADD CONSTRAINT "DEPACC" FOREIGN KEY ("IDA")
	  REFERENCES "FINANCE"."BANKACCOUNT" ("IDA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INCOMES
--------------------------------------------------------

  ALTER TABLE "FINANCE"."INCOMES" ADD CONSTRAINT "INACC" FOREIGN KEY ("IDA")
	  REFERENCES "FINANCE"."BANKACCOUNT" ("IDA") ENABLE;
