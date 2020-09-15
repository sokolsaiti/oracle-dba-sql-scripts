
SET LINESIZE 500
SET PAGESIZE 1000

set verify off

COLUMN username FORMAT A15
COLUMN granted_role FORMAT A25
COLUMN privilege FORMAT A25

prompt ****************************
prompt ** User system privileges **
prompt ****************************

prompt

select a.username,
       a.granted_role,
       a.privilege 
from ( 
     -- Privileges obtained through Roles               
    select  u.username, 
            r.granted_role, 
            s.privilege
    from dba_role_privs r,
         dba_users u,
         dba_sys_privs s
    where r.grantee = u.username
    and   u.username <> 'SYS'
    and   s.grantee = r.granted_role
    union all
    -- Privileges obtained directly    
    select  u.username, 
            'GRANTED DIRECTLY' GRANTED_ROLE, 
            s.privilege
    from dba_users u,
         dba_sys_privs s
    where  u.username <> 'SYS'
    and   s.grantee =  u.username ) a
where
    -- Uncomment to list privileges for just one user 
    -- a.username = UPPER('&1')
order by a.username, a.granted_role

set verify on

/
