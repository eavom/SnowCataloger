
insert into snow_catalog.control.catalog_attribute 
(
    item_id,
    attribute_name,
    attribute_location,
    data_type,
    allowed_length,
    position,
    is_identity,
    is_nullable,
    business_definition
)
select item.item_id
        , clm.column_name as attribute_name
        , concat(item.item_location, '.', clm.column_name) as attribute_location
        , clm.data_type as data_type
        , clm.character_maximum_length as allowed_length
        , clm.ordinal_position as position
        , (clm.is_identity = 'YES') as is_identity
        , (clm.is_nullable = 'YES') as is_nullable
        , clm.comment
from snowflake.account_usage.columns clm
inner join snow_catalog.control.catalog_item item
    on clm.table_name = item.item_name
where clm.table_catalog ilike 'TID_HEALTHCARE'
        and clm.deleted is null
order by table_name, ordinal_position;

