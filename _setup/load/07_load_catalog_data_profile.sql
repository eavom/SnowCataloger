
-- insert into snow_catalog.tracking.catalog_data_profile
-- (
--     item_id
--     , attribute_id
--     , row_count
--     , distinct_count
--     , null_count
--     , min_value
--     , max_value
--     , avg_value
--     , is_latest
-- )
-- select item.item_id as item_id
--         , attr.attribute_id as attribute_id
--         , count(1) as row_count
--         , count(distinct first_name) as distinct_count
--         , sum(iff(first_name is not null, 1, 0)) as null_count
--         , max(first_name) as max_value
--         , min(first_name) as min_value
--         , null as avg_value
--         , true
-- from tid_healthcare.natural.nurse tbl
-- inner join snow_catalog.control.catalog_item item
--     on item.item_name ilike 'nurse'
-- inner join snow_catalog.control.catalog_attribute attr
--     on attr.attribute_name ilike 'first_name'
--         and item.item_id = attr.item_id
-- group by all;


declare sql_statement string;
begin
    sql_statement := (
    select concat('insert into snow_catalog.tracking.catalog_data_profile
                    (
                        item_id
                        , attribute_id
                        , row_count
                        , distinct_count
                        , null_count
                        , min_value
                        , max_value
                        , avg_value
                        , is_latest
                    )',
                    ltrim(listagg(concat(
                    '   union 
                        select item.item_id as item_id
                                , attr.attribute_id as attribute_id
                                    , count(1) as row_count
                                    , count(distinct ', attr.attribute_name,') as distinct_count
                                    , sum(iff("', attr.attribute_name,'" is not null, 1, 0)) as null_count
                                    , max("', attr.attribute_name,'"::string) as max_value
                                    , min("', attr.attribute_name,'"::string) as min_value
                                    , null as avg_value
                                    , true
                            from ', item.item_location,' tbl
                            inner join snow_catalog.control.catalog_item item
                                on item.item_name ilike ''', item.item_name,'''
                            inner join snow_catalog.control.catalog_attribute attr
                                on attr.attribute_name ilike ''',attr.attribute_name,'''
                                    and item.item_id = attr.item_id
                            group by all '
                        , char(10)
                        )), 'union ')
            ) as sql
        from snow_catalog.control.catalog_attribute attr
        inner join snow_catalog.control.catalog_item item
            on item.item_id = attr.item_id  
    );

    execute immediate (:sql_statement);
    return 'done';
end
;