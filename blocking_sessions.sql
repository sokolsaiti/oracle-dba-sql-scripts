SET LINESIZE 200
SET PAGESIZE 1000

COLUMN username FORMAT A20
COLUMN osuser FORMAT A20
COLUMN wait_event_text FORMAT A40

SET VERIFY OFF;
SELECT s.sid        blocked_sid,
       s.serial#    blocked_serialno,
       s.username   blocked_username,
       s.osuser     blocked_osuser,
       s2.sid       blocking_sid,
       s2.serial#   blocking_serialno,
       s2.username  blocking_username,
       s2.osuser    blocking_osuser,
       b.wait_event_text       
FROM v$session_blockers b,
     v$session s,
     v$session s2
WHERE (b.sid = s.sid AND   b.sess_serial# = s.serial#)
AND (b.blocker_sid = s2.sid AND  b.BLOCKER_SESS_SERIAL# = s2.SERIAL#)

SET VERIFY ON;
