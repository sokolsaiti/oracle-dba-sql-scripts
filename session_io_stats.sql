SET LINESIZE 500
SET PAGESIZE 1000

COLUMN username FORMAT A10
COLUMN osuser FORMAT A30
COLUMN logon_time FORMAT A25
COLUMN machine FORMAT A25
COLUMN stat_name FORMAT A20
COLUMN client_info FORMAT A20

select s.sid,
       s.username,
       s.osuser,
       s.machine,
       s.client_info,
       to_char(s.logon_time,'DD-MM-YYYY HH24:MI:SS') logon_time,
       st.value stat_value,
       sn.name stat_name
from   v$sesstat st,
       v$statname sn,
       v$session s
where  st.statistic# = sn.statistic#
and    s.sid = st.sid
and    s.type <> 'BACKGROUND'
and    sn.name in('consistent gets', 'db block gets','physical reads','consistent changes', 'block changes')
and    st.value > 0 
order by stat_value desc;
