SET LINESIZE 500
SET PAGESIZE 1000

set verify off

COLUMN username FORMAT A15
COLUMN granted_role FORMAT A25
COLUMN privilege FORMAT A25
COLUMN object_name FORMAT A30
COLUMN object_type FORMAT A15


select a.username,
       a.granted_role,
       a.object_type,
       a.object_name,
       a.privilege
 from (
select   
       -- Object privileges granted through a role
         u.username, 
         r.granted_role, 
         s.privilege,
         s.type object_type,
         s.table_name object_name
    from dba_role_privs r,
         dba_users u,
         dba_tab_privs s
    where r.grantee = u.username
    and   u.username <> 'SYS'
and s.grantee = r.granted_role
union all
      -- Object privileges granted directly
select  u.username, 
        'GRANTED DIRECTLY' granted_role, 
        s.privilege,
        s.type object_type,
        s.table_name object_name
from dba_users u,
     dba_tab_privs s
where  u.username <> 'SYS'
and   s.grantee =  u.username ) a
where a.username = UPPER('&1')
order by a.username

set verify on

/
