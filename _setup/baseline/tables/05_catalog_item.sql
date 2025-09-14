
-- catalog_item table
create or replace table snow_catalog.control.catalog_item
(
    item_id int not null primary key identity(1,1),
    item_code string not null,
    item_name string not null,
    item_type string not null,
    item_location string not null,
    description string,
    domain_id int references snow_catalog.control.catalog_domain(domain_id),
    business_definition string,
    is_enabled boolean default true,
    is_searchable boolean default true,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp default current_timestamp,
    deleted_by string,
    deleted_at timestamp
);
