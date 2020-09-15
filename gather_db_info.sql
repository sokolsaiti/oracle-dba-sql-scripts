spool db_info.txt replace
set feedback on
prompt *****************************************************************
prompt ** Gathering basic information about database and its instance **
prompt *****************************************************************

prompt

@vdatabase.sql;
@database_properties.sql;
@datafiles;
@db_feature_usage.sql;
@directories.sql;
@invalid_objects.sql;
@sqlpatch_history.sql;
@tablespaces.sql;
@user_object_count.sql;
--@user_object_privileges.sql
--@user_system_privileges.sql
@users.sql;
@vcontrolfile_records.sql;
@vcontrolfile.sql;
@vdatafiles.sql;
@last_backups.sql;

spool off

exit