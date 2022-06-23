create extension postgis;
create extension postgis_topology;
create extension laowangsql;
create extension "uuid-ossp";

select laowang_info();



create or replace function test_map() returns varchar as 
$$
declare
    map MemAddress;
begin
    map := lw_map_create(
        800 * 25.4 / 72.0, 600 * 25.4 /72.0,
        108,24,115,30.2,
        72 / 25.4,
        'png'
    );
    
    perform lw_map_begin(map);
    raise notice 'width: %',lw_map_get_width(map);
    raise notice 'height: %',lw_map_get_height(map);
    raise notice 'minx: %',lw_map_get_minx(map);
    raise notice 'miny: %',lw_map_get_miny(map);
    raise notice 'maxx: %',lw_map_get_maxx(map);
    raise notice 'maxy: %',lw_map_get_maxy(map);
    raise notice 'scale: %',lw_map_get_scale(map);
    perform lw_map_add_geometry(map,geom) from town;
    perform lw_map_add_geometry(map,geom) from railway;
    perform lw_map_end(map);
    perform lw_map_save_to_file(map,'/tmp/' || lw_uuid() || '.png');
    perform lw_map_destroy(map);
    
    return 'ok';
end;
$$ language 'plpgsql';


select test_map();