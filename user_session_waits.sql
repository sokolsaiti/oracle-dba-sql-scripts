--Lists user sessions wait time

SET LINESIZE 200
SET PAGESIZE 1000

COLUMN username FORMAT A20
COLUMN event FORMAT A30

SELECT NVL(s.username, '(oracle)') AS username,
       s.sid,
       s.serial#,
       w.event,
       w.wait_time,
       w.seconds_in_wait,
       w.state
FROM   v$session_wait w,
       v$session s
WHERE  s.sid = w.sid
AND    s.TYPE <> 'BACKGROUND'
ORDER BY w.seconds_in_wait DESC;
