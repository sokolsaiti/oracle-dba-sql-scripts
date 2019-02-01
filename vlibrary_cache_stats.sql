SET LINESIZE 500
SET PAGESIZE 1000

COLUMN namespace FORMAT A20
COLUMN gethitratio FORMAT A10
COLUMN pinhitratio FORMAT A10
COLUMN gets FORMAT 99999999999
COLUMN gethits FORMAT 99999999999
COLUMN pins FORMAT 99999999999
COLUMN pinhits FORMAT 99999999999
COLUMN gethits FORMAT 9999999
COLUMN invalidations FORMAT 9999999


SELECT c.namespace,
       c.gets,
       c.gethits,
       to_char(Round(c.gethitratio,2) * 100) ||'%' gethitratio,
       c.pins ,
       c.pinhits ,
       to_char(Round(c.pinhitratio,2) *100) ||'%' pinhitratio,
       c.reloads,
       c.invalidations 
FROM   v$librarycache c
ORDER BY c.pins desc, 
         c.pinhitratio asc;
