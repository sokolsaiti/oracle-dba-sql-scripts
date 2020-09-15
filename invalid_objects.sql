--Lists the invalid objects

SET LINESIZE 500
SET PAGESIZE 1000

COLUMN owner FORMAT A15
COLUMN object_type FORMAT A15
COLUMN object_name FORMAT A50
COLUMN status FORMAT A10

prompt *********************
prompt ** Invalid objects **
prompt *********************

prompt
SELECT owner,
       object_type,
       object_name,
       status
FROM   dba_objects
WHERE  status = 'INVALID'
ORDER BY owner, object_type, object_name;
