-- Lists database users

SET LINESIZE 200
SET PAGESIZE 1000

COLUMN username FORMAT A30
COLUMN account_status FORMAT A25
COLUMN lock_date FORMAT A11
COLUMN expiry_date FORMAT A11
COLUMN created FORMAT A11
COLUMN default_tablespace FORMAT A15
COLUMN temporary_tablespace FORMAT A15
COLUMN profile FORMAT A15

prompt ***************
prompt ** Users **
prompt ***************

prompt

SELECT username,
       account_status,
       TO_CHAR(lock_date, 'DD-MM-YYYY') AS lock_date,
       TO_CHAR(expiry_date, 'DD-MM-YYYY') AS expiry_date,
       default_tablespace,
       temporary_tablespace,
       TO_CHAR(created, 'DD-MM-YYYY') AS created,
       profile
FROM   dba_users
ORDER BY username;
