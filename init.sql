-- https://www.oracle.com/kr/database/technologies/appdev/xe/quickstart.html
-- https://container-registry.oracle.com/ords/f?p=113:4:100037901111748:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:803,803,Oracle%20Database%20Express%20Edition,Oracle%20Database%20Express%20Edition,1,0&cs=36cYAmVEznYF-CzTC7QYezU7V9e5N-vRUDXiAhOhSs19D9UOGruuW1zswvm2j1XM5Rs45l6nJDXqQgf82Cu5vPA

-- select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET';


CREATE TABLESPACE userdb
DATAFILE 'userdb.dbf'
SIZE 1000M
AUTOEXTEND ON NEXT 10M;

alter session set "_ORACLE_SCRIPT"=true;

CREATE USER userdb
IDENTIFIED BY userdb
DEFAULT TABLESPACE userdb
TEMPORARY TABLESPACE TEMP
;

grant CREATE SESSION, 
      ALTER SESSION, 
      CREATE SEQUENCE, 
      CREATE TABLE, 
      CREATE VIEW, 
      UNLIMITED TABLESPACE 
  to userdb;

/*--------------------------------------*/

CREATE TABLE USERDB.TB_TEST (
	ID VARCHAR2(100) NOT NULL,
	COL1 VARCHAR2(100),
    COL2 NUMBER(5,2) NULL,
	CONSTRAINT TB_TEST_TB_TEST_PK PRIMARY KEY (ID)
)
TABLESPACE USERDB;
COMMENT ON TABLE USERDB.TB_TEST IS '테스트 테이블입니다.';
COMMENT ON COLUMN USERDB.TB_TEST.ID IS 'PK입니다';
COMMENT ON COLUMN USERDB.TB_TEST.COL1 IS '문자열입니다';
COMMENT ON COLUMN USERDB.TB_TEST.COL2 IS '숫자입니다';

/*--------------------------------------*/

INSERT INTO USERDB.TB_TEST
(ID, COL1, COL2)
VALUES(RAWTOHEX(SYS_GUID())
, '12345한글입니다.'
, 123.45);