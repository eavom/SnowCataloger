create or replace table snow_catalog.control.catalog_settings
(
    setting_id int primary key identity(1, 1),
    item_type string not null,
    item_name string not null,
    metadata_tracking boolean default true,
    liniage_tracking boolean default true,
    profile_tracking boolean default true,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp,
    deleted_by string,
    deleted_at timestamp
);

