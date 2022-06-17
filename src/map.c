#include <postgres.h>
#include <fmgr.h>


PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(lw_map_create);
Datum
lw_map_create(PG_FUNCTION_ARGS)
{
    PG_RETURN_NULL();
}
