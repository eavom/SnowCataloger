
-- catalog_lineage table
create table if not exists snow_catalog.tracking.catalog_lineage (
    lineage_id string not null primary key,
    source_item_id int references snow_catalog.control.catalog_item(item_id),
    target_item_id int references snow_catalog.control.catalog_item(item_id),
    transformation_description string,
    is_enabled boolean default true,
    created_at timestamp default current_timestamp
);
