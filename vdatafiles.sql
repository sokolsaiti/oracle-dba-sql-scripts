SET LINESIZE 300
SET PAGESIZE 1000

COLUMN file_name FORMAT A70
COLUMN status FORMAT A15
COLUMN enabled FORMAT A15
COLUMN checkpoint_time FORMAT A20

select d.file# file_id,
       d.name file_name,
       round(d.bytes/1024/1024/1024) size_gb,
       d.status,
       d.enabled,
       to_char(d.checkpoint_time,'DD-MM-YYYY HH24:MI:SS') checkpoint_time    
from    v$datafile d;
