#!/bin/sh

CUR_DIR=$(cd `dirname $0`; pwd)

DBNAME=laowangdb
dropdb ${DBNAME}
createdb ${DBNAME}
psql -d ${DBNAME} -f ${CUR_DIR}/data/hunan/hunan.sql
psql -d ${DBNAME} -f ${CUR_DIR}/data/hunan/lake.sql
psql -d ${DBNAME} -f ${CUR_DIR}/data/hunan/town.sql
psql -d ${DBNAME} -f ${CUR_DIR}/data/hunan/county.sql
psql -d ${DBNAME} -f ${CUR_DIR}/data/hunan/railway.sql
psql -d ${DBNAME} -f ${CUR_DIR}/test.sql
