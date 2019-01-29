--When run, this script will show the active user sessions currently running 
--on the database instance. 

SET LINESIZE 500
SET PAGESIZE 1000

COLUMN username FORMAT A15
COLUMN osuser FORMAT A25
COLUMN spid FORMAT A10
COLUMN status FORMAT A6
COLUMN service_name FORMAT A15
COLUMN module FORMAT A20
COLUMN machine FORMAT A25
COLUMN program FORMAT A20
COLUMN logon_time FORMAT A20

SELECT NVL(s.username, '(oracle)') AS username,
       s.osuser,
       s.sid,
       s.serial#,
       p.spid,
       s.status,
       s.module,
       s.machine,
       s.program,
       TO_CHAR(s.logon_Time,'DD-MON-YYYY HH24:MI:SS') AS logon_time
FROM   v$session s,
       v$process p
WHERE  s.paddr  = p.addr
AND    s.status = 'ACTIVE'
and    s.type <> 'BACKGROUND'
ORDER BY s.username, s.osuser;
