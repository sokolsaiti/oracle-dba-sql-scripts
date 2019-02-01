SET LINESIZE 500
SET PAGESIZE 1000

COLUMN start_time FORMAT A20
COLUMN end_time FORMAT A20
COLUMN status FORMAT A10
COLUMN oper_mode FORMAT A10
COLUMN oper_type FORMAT A15
COLUMN component FORMAT A25
COLUMN parameter FORMAT A25



SELECT to_char(start_time,'DD-MM-YYYY HH24:MI:SS') start_time,
       to_char(end_time,'DD-MM-YYYY HH24:MI:SS') end_time,
       component,
       oper_type,
       oper_mode,
       parameter,
       ROUND(initial_size/1024/1024) AS initial_size_mb,
       ROUND(target_size/1024/1024) AS target_size_mb,
       ROUND(final_size/1024/1024) AS final_size_mb,
       status
FROM   v$memory_resize_ops
ORDER BY start_time;
