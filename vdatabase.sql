set linesize 500
set pagesize 10000

column dbid format 9999999999
column db_unique_name  format  A10
column name  format  A10
column created  format  A15
column log_mode format  A15
column platform_name format  A20

prompt ****************
prompt ** v$Database **
prompt ****************

prompt


select d.DBID,
       d.DB_UNIQUE_NAME,
       d.NAME,
       d.CREATED,
       d.LOG_MODE,
       d.PLATFORM_NAME
  from v$database d;