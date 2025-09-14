
-- catalog_domain table
create or replace table snow_catalog.control.catalog_domain 
(
    domain_id int not null primary key identity(1,1),
    domain_code string not null,
    domain_name string not null,
    description string,
    is_enabled boolean default true,
    is_searchable boolean default true,
    is_certified boolean default false,
    certified_by string,
    certified_on timestamp,
    is_revoked boolean default false,
    revoked_by string,
    revoked_on timestamp,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp,
    deleted_by string,
    deleted_at timestamp
);
