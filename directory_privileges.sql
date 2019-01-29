SET LINESIZE 550
SET PAGESIZE 1000

COLUMN owner FORMAT A20
COLUMN directory_name FORMAT A25
COLUMN directory_path FORMAT A60
COLUMN grantor FORMAT A20
COLUMN grantee FORMAT A20
COLUMN privilege FORMAT A15


select p.owner, 
       p.table_name directory_name,
       d.directory_path,
       p.grantor,
       p.grantee,
       p.privilege
from dba_tab_privs p,
     dba_directories d 
where p.type = 'DIRECTORY'
and   p.table_name = d.directory_name
--and table_name = UPPER('&1')
;

