
-- catalog_attribute table
create or replace table snow_catalog.control.catalog_attribute 
(
    attribute_id int not null primary key identity(1, 1),
    item_id int references snow_catalog.control.catalog_item(item_id),
    attribute_name string not null,
    attribute_location string not null,
    data_type string not null,
    allowed_length string,
    position int,
    is_identity boolean default false,
    is_nullable boolean default false,
    is_primary boolean default false,
    is_unique boolean default false,
    is_virtual boolean default false,
    is_sensitive boolean default false,
    is_masked boolean default false,
    default_value string,
    lookup_attribute string,
    business_definition string,
    glossary_term_id int references snow_catalog.control.catalog_glossary(term_id),
    is_enabled boolean default false,
    is_searchable boolean default true,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp default current_timestamp,
    deleted_by string,
    deleted_at timestamp
);
