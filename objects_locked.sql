--Lists the objects which are locked

--https://docs.oracle.com/database/121/REFRN/GUID-3F9F26AA-197F-4D36-939E-FAF1EFD8C0DD.htm#REFRN30125

SET LINESIZE 500
SET PAGESIZE 1000

column username format A15
column os_user_name format A15
column locked_mode format A15
column object_name format A20
column owner format A15


select l.session_id sid,
       s.serial# serial_no,
       nvl(l.oracle_username, '(oracle)') username,
       o.owner object_owner,
       o.object_name,
       decode(l.locked_mode, 0, 'None',
                             1, 'Null (NULL)',
                             2, 'Row-S (SS)',
                             3, 'Row-X (SX)',
                             4, 'Share (S)',
                             5, 'S/Row-X (SSX)',
                             6, 'Exclusive (X)',
                             l.locked_mode) locked_mode,
       l.os_user_name
from   v$locked_object l,
       dba_objects o, 
       v$session s  
where  o.object_id = l.object_id
and    l.session_id = s.sid
order by l.session_id;

/
