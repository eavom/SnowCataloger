
-- catalog_glossary table
create or replace table snow_catalog.control.catalog_glossary 
(
    term_id int not null primary key identity(1, 1),
    term_name string not null,
    business_definition string,
    domain_id int references snow_catalog.control.catalog_domain(domain_id),
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
    updated_at timestamp default current_timestamp,
    deleted_by string,
    deleted_at timestamp
);


'''
add Is Certified, Certified By, Centified On, Certified Revoked, Revoked By, Revoked On

-- Glossary
-- Synonyms
-- Data Domain

+ Is Serchable or something - Intended to allow chat bot to search through Snow Catalog 
- User should be able to disable particular table or column to be searched by Chat Bot
'''