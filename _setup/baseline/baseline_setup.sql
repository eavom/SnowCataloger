use role accountadmin;

use warehouse compute_wh;

create warehouse if not exists snow_catalog_wh
    warehouse_size = large
    warehouse_type = standard
    auto_suspend = 60
    auto_resume = true
    initially_suspended = true
    comment = 'warehouse for data cataloging in snowflake with snowcataloger'
;

create role if not exists snow_cataloger
    comment = 'Used for processing on meta data from SNOWFLAKE.ACCOUNT_USAGE views'
;

grant imported privileges on database snowflake 
    to role snow_cataloger
;

grant role snow_cataloger to user mo;


grant usage on warehouse snow_catalog_wh 
    to role snow_cataloger
;

use warehouse snow_catalog_wh
;

create database if not exists snow_catalog;

create schema if not exists snow_catalog.control;

create schema if not exists snow_catalog.tracking;

-- grant database-level access
grant usage on database snow_catalog to role snow_cataloger;

-- Grant schema-level access
grant usage on all schemas in database snow_catalog to role snow_cataloger;

grant usage on future schemas in database snow_catalog to role snow_cataloger;

-- grant object-level access
grant all privileges on all tables in schema snow_catalog.control to role snow_cataloger;
grant all privileges on all tables in schema snow_catalog.tracking to role snow_cataloger;


grant all privileges on future tables in schema snow_catalog.control to role snow_cataloger;
grant all privileges on future tables in schema snow_catalog.tracking to role snow_cataloger;


grant all privileges on future views in schema snow_catalog.control to role snow_cataloger;
grant all privileges on future views in schema snow_catalog.tracking to role snow_cataloger;


grant all privileges on all views in schema snow_catalog.control to role snow_cataloger;
grant all privileges on all views in schema snow_catalog.tracking to role snow_cataloger;
