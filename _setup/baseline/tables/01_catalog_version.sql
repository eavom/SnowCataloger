
-- catalog_version table
create table if not exists snow_catalog.control.catalog_version 
(
    version_id int not null primary key identity(1,1),
    version string not null,
    release_note string not null,
    is_latest boolean default false,
    updated_at timestamp default current_timestamp
);