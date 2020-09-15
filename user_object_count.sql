SET LINESIZE 500
SET PAGESIZE 1000

COLUMN owner FORMAT A35
COLUMN object_type FORMAT A35
COLUMN CNT FORMAT 9999999

prompt ************************
prompt ** User objects count **
prompt ************************

prompt

select owner, object_type, count(*) CNT
  from all_objects WHERE owner not in ( 'SYS','SYSTEM')
 group by owner, object_type
 order by 1, 2, 3 desc;