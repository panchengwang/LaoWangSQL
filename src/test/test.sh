#!/bin/sh

CUR_DIR=$(cd `dirname $0`; pwd)

DBNAME=laowangdb
dropdb ${DBNAME}
createdb ${DBNAME}
psql -d ${DBNAME} -f ${CUR_DIR}/test.sql
