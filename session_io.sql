SET LINESIZE 500
SET PAGESIZE 1000

COLUMN username FORMAT A10
COLUMN osuser FORMAT A25
COLUMN logon_time FORMAT A25


SELECT nvl(s.username, '(oracle)')  username,
       s.osuser,
       to_char(s.logon_time,'DD-MM-YYYY HH24:MI:SS') logon_time,
       s.sid,
       s.serial#,
       i.block_gets,
       i.consistent_gets,
       i.physical_reads,
       i.block_changes,
       i.consistent_changes
FROM   v$session s,
       v$sess_io i
WHERE  s.sid = i.sid
AND    s.TYPE <> 'BACKGROUND'
ORDER BY i.physical_reads desc, i.physical_reads desc;
