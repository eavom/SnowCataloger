insert into snow_catalog.control.catalog_version
(
    version,
    release_note,
    is_latest
)
select '1.0.0', 'Initial Version', true
from dual
where not exists(select 1 from snow_catalog.control.catalog_version where version = '1.0.0')
;

select * from snow_catalog.control.catalog_version;