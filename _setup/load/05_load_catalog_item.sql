
insert into snow_catalog.control.catalog_item
(
    item_code,
    item_name,
    item_type,
    item_location,
    description,
    business_definition
)
select concat(table_type,'-',table_catalog, '-', table_schema, '-', table_name) as item_code
        , table_name as item_name
        , table_type as item_type
        , concat(table_catalog, '.', table_schema, '.', table_name)
        , comment
        , null
from snowflake.account_usage.tables
where table_catalog ilike 'TID_HEALTHCARE'
        and table_schema not in ('PUBLIC')
        and deleted is null;
