/* contrib/laowangsql/laowangsql--1.0.sql */


\echo Use "create EXTENSION laowangsql;" to add laowangsql extension. \quit

-- Return version and copyright information of laowangsql
create or replace function laowang_info() returns json as 
$$
  select '{
      "extension" : "LaoWangSQL",
      "version" : "1.0",
      "author" : "pcwang, 麓山老将, 老王, 盼盼, Pancheng Wang",
      "qq" : "593723812"
    }'::json;
$$
language 'sql';


-- Return version and copyright information of laowangsql
create or replace function laowang_version() returns json as 
$$
  select laowang_info();
$$
language 'sql';


