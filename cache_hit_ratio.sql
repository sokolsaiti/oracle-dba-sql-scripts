--https://docs.oracle.com/en/database/oracle/oracle-database/12.2/refrn/statistics-descriptions-2.html#GUID-2FBC1B7E-9123-41DD-8178-96176260A639

COLUMN db_block_gets FORMAT 999999999999
COLUMN consistent_gets FORMAT 99999999999999
COLUMN physical_reads FORMAT 999999999999

select b.db_block_gets,
       b.consistent_gets,
       b.physical_reads,
       round((b.db_block_gets + b.consistent_gets - b.physical_reads) / (b.db_block_gets + b.consistent_gets) * 100,2) hit_ratio_pct  
from 
         (select lower(replace(a.name,' ','_')) stat_name, 
                a.value 
         from v$sysstat a)
pivot    (sum(value)  
          for (stat_name)  
          in ('db_block_gets' as db_block_gets, 
              'consistent_gets' as consistent_gets,
              'physical_reads' as physical_reads )
          ) b;
