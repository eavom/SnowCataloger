-- preparing temp database list
create or replace temp table database_list (database_name string)
;

insert into database_list(database_name)
values ('DW_DEV'), ('DW_PROD')
;


declare rs resultset;
begin
    rs := (
        select database_name from database_list
    )
    ;

    for record in rs do
        execute immediate '
        grant usage on database ' || record.database_name || ' to role sysadmin;'
        ;
    end for;
    return 'Success';
end
;

