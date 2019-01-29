--Shows the currently running jobs

SET LINESIZE 500
SET PAGESIZE 1000


SELECT r.job,
       j.what,
       r.sid,
       r.failures,       
       TO_CHAR(r.last_date,'DD-MM-YYYY HH24:MI:SS') LAST_DATE,      
       TO_CHAR(r.this_date,'DD-MM-YYYY HH24:MI:SS') THIS_DATE            
FROM   dba_jobs_running r join dba_jobs j on r.job = j.job;
