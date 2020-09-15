
SET LINESIZE 200
prompt *****************
prompt ** Tablespaces **
prompt *****************

prompt
SELECT tablespace_name,
       block_size,
       extent_management,
       allocation_type,
       segment_space_management,
       status
FROM   dba_tablespaces
ORDER BY tablespace_name;
