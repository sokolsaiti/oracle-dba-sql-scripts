
SET LINESIZE 600
SET PAGESIZE 1000

COLUMN action FORMAT A10
COLUMN description FORMAT A90
COLUMN action_time FORMAT A22
--COLUMN logfile FORMAT A80
COLUMN status FORMAT A10
COLUMN version FORMAT A8


select r.patch_id,
       r.action,
       TO_CHAR(r.action_time, 'DD-MI-YYYY HH24:MI:SS') AS action_time,
       r.description,
      -- r.logfile,
       r.status,
       r.version       
from sys.registry$sqlpatch r
order by r.action_time desc;
