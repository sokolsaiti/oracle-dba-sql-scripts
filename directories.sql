-- Lists all directories

SET LINESIZE 300
SET PAGESIZE 1000

COLUMN owner FORMAT A20
COLUMN directory_name FORMAT A25
COLUMN directory_path FORMAT A80

select d.owner,
       d.directory_name,
       d.directory_path
from  dba_directories d
order by d.owner,
         d.directory_name;
