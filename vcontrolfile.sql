SET LINESIZE 500
SET PAGESIZE 1000

COLUMN status FORMAT A10
COLUMN name FORMAT A70
COLUMN is_recovery_dest_file FORMAT A15


select nvl(c.status,'VALID') status,
       c.name,
       c.is_recovery_dest_file,
       c.block_size,
       c.file_size_blks
from v$controlfile c;
