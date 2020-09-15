SET LINESIZE 800
SET PAGESIZE 1000

COLUMN name  FORMAT A60


prompt ****************************
prompt ** Database feature usage **
prompt ****************************

prompt

SELECT u1.name,
       u1.detected_usages,
       u1.currently_used,
       u1.version
FROM   dba_feature_usage_statistics u1
WHERE  u1.version = (SELECT MAX(u2.version)
                     FROM   dba_feature_usage_statistics u2
                     WHERE  u2.name = u1.name)
AND    u1.detected_usages > 0
AND    u1.dbid = (SELECT dbid FROM v$database)
ORDER BY u1.name;
