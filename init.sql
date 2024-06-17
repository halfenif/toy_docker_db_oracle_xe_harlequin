-- https://www.oracle.com/kr/database/technologies/appdev/xe/quickstart.html
-- https://container-registry.oracle.com/ords/f?p=113:4:100037901111748:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:803,803,Oracle%20Database%20Express%20Edition,Oracle%20Database%20Express%20Edition,1,0&cs=36cYAmVEznYF-CzTC7QYezU7V9e5N-vRUDXiAhOhSs19D9UOGruuW1zswvm2j1XM5Rs45l6nJDXqQgf82Cu5vPA

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
