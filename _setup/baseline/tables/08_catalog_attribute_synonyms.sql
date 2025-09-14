
-- catalog_attribute_synonyms table
create table if not exists snow_catalog.control.catalog_attribute_synonyms 
(
    attribute_synonym_id int not null primary key identity(1, 1),
    attribute_id int references snow_catalog.control.catalog_attribute(attribute_id),
    synonym_id int references snow_catalog.control.catalog_synonyms(synonym_id),
    is_enabled boolean default true,
    is_searchable boolean default true,
    created_by string,
    created_at timestamp default current_timestamp,
    updated_by string,
    updated_at timestamp default current_timestamp,
    deleted_by string,
    deleted_at timestamp
);