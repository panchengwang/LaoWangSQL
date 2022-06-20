#include <postgres.h>
#include <fmgr.h>
#include <utils/builtins.h>


PG_FUNCTION_INFO_V1(lw_version_info);
Datum lw_version_info(PG_FUNCTION_ARGS)
{
    char *str = "{\"qq\": \"593723812\", \"author\": \"pcwang, Panpan, Pancheng Wang, wang_wang_lao, 麓山老将, 老王, 盼盼, 扫地师\", \"version\": \"1.0\", \"extension\": \"LaoWangSQL\"}";

    PG_RETURN_TEXT_P(cstring_to_text(str));
}
