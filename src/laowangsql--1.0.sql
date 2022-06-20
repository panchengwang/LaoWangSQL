/* contrib/laowangsql/laowangsql--1.0.sql */


\echo Use "create EXTENSION laowangsql;" to add laowangsql extension. \quit

-- Return version and copyright information of laowangsql
create or replace function laowang_info() returns jsonb as 
$$
  select '
    {
      "extension" : "LaoWangSQL",
      "version" : "1.0",
      "author" : "pcwang, 麓山老将, 老王, 盼盼, Panpan, Pancheng Wang, wang_wang_lao",
      "qq" : "593723812"
    }'::jsonb;
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
	RETURNS integer
	AS '$libdir/laowangsql','lw_map_create'
	LANGUAGE 'c' IMMUTABLE STRICT PARALLEL SAFE;

