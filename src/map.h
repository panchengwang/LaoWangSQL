#ifndef __MAP_H
#define __MAP_H



#include <postgres.h>
#include <fmgr.h>

Datum lw_map_create(PG_FUNCTION_ARGS);
Datum lw_map_destroy(PG_FUNCTION_ARGS);
Datum lw_map_get_width(PG_FUNCTION_ARGS);
Datum lw_map_get_height(PG_FUNCTION_ARGS);
Datum lw_map_get_minx(PG_FUNCTION_ARGS);
Datum lw_map_get_miny(PG_FUNCTION_ARGS);
Datum lw_map_get_maxx(PG_FUNCTION_ARGS);
Datum lw_map_get_maxy(PG_FUNCTION_ARGS);
Datum lw_map_get_scale(PG_FUNCTION_ARGS);
Datum lw_map_add_geometry(PG_FUNCTION_ARGS);

#endif
