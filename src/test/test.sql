create extension postgis;
create extension postgis_topology;
create extension laowangsql;


select laowang_info();

select 'aaaa' || lw_map_create(
    800 * 25.4 / 72.0, 600 * 25.4 /72.0,
    -180,-90,180,90,
    72 / 25.4,
    'png'
);