/* contrib/laowangsql/laowangsql--1.0.sql */


\echo Use "create EXTENSION laowangsql;" to add laowangsql extension. \quit



CREATE or replace FUNCTION lw_version_info()
    RETURNS text
    AS '$libdir/laowangsql','lw_version_info'
    LANGUAGE C IMMUTABLE STRICT;



-- Return version and copyright information of laowangsql
create or replace function laowang_info() returns jsonb as 
$$
  select lw_version_info()::jsonb ;
$$
language 'sql';


-- Return version and copyright information of laowangsql
create or replace function laowang_version() returns jsonb as 
$$
  select laowang_info();
$$
language 'sql';


-- create type MemAddress;

CREATE or replace FUNCTION lw_memadd_in(cstring)
    RETURNS MemAddress
    AS '$libdir/laowangsql','lw_memadd_in'
    LANGUAGE C IMMUTABLE STRICT;

CREATE or replace FUNCTION lw_memadd_out(MemAddress)
    RETURNS cstring
    AS '$libdir/laowangsql','lw_memadd_out'
    LANGUAGE C IMMUTABLE STRICT;


CREATE TYPE MemAddress (
   internallength = 8,
   input = lw_memadd_in,
   output = lw_memadd_out,
   alignment = double
);


CREATE OR REPLACE FUNCTION lw_map_create(
  width float8,
  height float8,
  minx float8,
  miny float8,
  maxx float8,
  maxy float8,
  pointsPerMilliMeter float8,
  format varchar
)
	RETURNS MemAddress
	AS '$libdir/laowangsql','lw_map_create'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;



CREATE OR REPLACE FUNCTION lw_map_destroy(
  map MemAddress
)
	RETURNS MemAddress
	AS '$libdir/laowangsql','lw_map_destroy'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;



CREATE OR REPLACE FUNCTION lw_map_get_width(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_width'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_get_height(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_height'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;



CREATE OR REPLACE FUNCTION lw_map_get_minx(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_minx'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_get_miny(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_miny'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_get_maxx(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_maxx'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_get_maxy(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_maxy'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_get_scale(
  map MemAddress
)
	RETURNS float8
	AS '$libdir/laowangsql','lw_map_get_scale'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;

CREATE OR REPLACE FUNCTION lw_map_begin(
  map MemAddress
)
	RETURNS MemAddress
	AS '$libdir/laowangsql','lw_map_begin'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;


CREATE OR REPLACE FUNCTION lw_map_end(
  map MemAddress
)
	RETURNS MemAddress
	AS '$libdir/laowangsql','lw_map_end'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;

CREATE OR REPLACE FUNCTION lw_map_save_to_file(
  map MemAddress, varchar filename
)
	RETURNS MemAddress
	AS '$libdir/laowangsql','lw_map_save_to_file'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;
