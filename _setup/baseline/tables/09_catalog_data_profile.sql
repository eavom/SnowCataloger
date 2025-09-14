
-- catalog_data_profile table
create or replace table snow_catalog.tracking.catalog_data_profile 
(
    profile_id int not null primary key identity(1, 1),
    item_id int references snow_catalog.control.catalog_item(item_id),
    attribute_id int references snow_catalog.control.catalog_attribute(attribute_id),
    row_count bigint,
    distinct_count bigint,
    null_count bigint,
    min_value string,
    max_value string,
    avg_value float,
    last_profiled timestamp default current_timestamp,
    is_latest boolean default false
);
