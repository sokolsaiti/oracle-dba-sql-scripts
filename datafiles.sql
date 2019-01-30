SET LINESIZE 200
SET PAGESIZE 1000

COLUMN file_name FORMAT A70
COLUMN status FORMAT A15
COLUMN autoextensible FORMAT A3

SELECT file_id,
       file_name,
       round(bytes/1024/1024/1024) AS size_gb,
       round(maxbytes/1024/1024/1024) AS max_size_gb,
       autoextensible,
       increment_by,
       status
FROM   dba_data_files
ORDER BY bytes desc;
