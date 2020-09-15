SET LINESIZE 500
SET PAGESIZE 1000

COLUMN type FORMAT A30


prompt **************************
prompt ** Control file records **
prompt **************************

prompt

select r.type,
       r.record_size,
       r.records_total,
       r.records_used 
from v$controlfile_record_section r
where r.records_used > 0
order by r.records_total desc; 
