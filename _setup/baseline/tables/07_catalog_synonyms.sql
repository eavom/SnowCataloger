
-- catalog_synonyms table
create or replace table snow_catalog.control.catalog_synonyms 
(
    synonym_id int not null primary key identity(1, 1),
    synonym_name string not null,
    context string,
    is_enabled boolean default true,
    is_searchable boolean default true,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp default current_timestamp,
    deleted_by string,
    deleted_at timestamp
);