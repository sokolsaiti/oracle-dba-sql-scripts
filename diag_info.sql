SET LINESIZE 200
COLUMN name FORMAT A30
COLUMN value FORMAT A110

prompt *********************
prompt ** Diagnostic info **
prompt *********************

prompt

SELECT *
FROM   v$diag_info;