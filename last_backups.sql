
SET LINESIZE 500
SET PAGESIZE 1000

column recid format 9999999999
column BACKUP_TYPE  format  A2
column CONTROLFILE_INCLUDED  format  A3
column DEVICE_TYPE  format  A10
column HANDLE format  A50
column START_TIME format  A20
column completion_time format  A20


set verify off

prompt *******************************
prompt ** Backups in the last month **
prompt *******************************

prompt

select bp.RECID,
       bs.BACKUP_TYPE,
       bs.CONTROLFILE_INCLUDED,
       bp.DEVICE_TYPE,
       bp.HANDLE,
       to_char(bp.START_TIME, 'DD-MM-YYYY HH24:MI:SS') START_TIME,
       to_char(bp.completion_time, 'DD-MM-YYYY HH24:MI:SS') completion_time
  from v$backup_piece bp
  join v$backup_set bs
    on bp.RECID = bs.RECID
 where trunc(bs.START_TIME) > add_months(trunc(sysdate), -1)
 order by bp.START_TIME desc;