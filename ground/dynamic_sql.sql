-- preparing temp database list
create or replace temp table database_list (database_name string)
;

insert into database_list(database_name)
values ('DW_DEV'), ('DW_PROD')
;

-- to provide usage access to Sys Admin on all databases available in the list
declare sql_stmt string;
        user_role string default 'SYSADMIN';
        access_type string default 'USAGE';
begin
    -- prepare SQL query
    sql_stmt := (
        select listagg(
                concat('GRANT ', :access_type ,' ON DATABASE "'
                            , database_name, '" TO ROLE '
                            , :user_role
                            , '; ' || char(10)
                        )
                )
        from database_list
        group by all
    );

    sql_stmt := concat('BEGIN ', char(10), :sql_stmt, char(10), 'END;');

    -- execute sql query
    execute immediate :sql_stmt;

    -- return success message
    return 'Success';
end
;