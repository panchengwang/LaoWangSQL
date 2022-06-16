#!/bin/bash

OS=`uname`

CUR_DIR=$(cd `dirname $0`; pwd)

cd ${CUR_DIR}/src/postgis
sh create_postgis_lib.sh

cd ${CUR_DIR}
PG_SRC_PATH=$CUR_DIR/../postgresql
PG_CONTRIB_PATH=${PG_SRC_PATH}/contrib
PG_LIB_PATH=`pg_config --libdir`

if [ "${OS}" = "Linux" ];then 
    sudo cp -f ${CUR_DIR}/src/postgis/libs/libpostgis.so ${PG_LIB_PATH}
fi

if [ "${OS}" = "Darwin" ];then
    sudo cp -f ${CUR_DIR}/src/postgis/libs/libpostgis.a ${PG_LIB_PATH}
fi

rm -rf ${PG_CONTRIB_PATH}/laowangsql 
cp -rf ${CUR_DIR}/src ${PG_CONTRIB_PATH}/laowangsql
cd ${PG_CONTRIB_PATH}/laowangsql
make 
sudo make install
