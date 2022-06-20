#include "map.h"
#include <utils/builtins.h>
#include <canvas.h>
#include <memadd.h>


PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(lw_map_create);
Datum
lw_map_create(PG_FUNCTION_ARGS)
{
    double width    = PG_GETARG_FLOAT8(0);
    double height   = PG_GETARG_FLOAT8(1);
    double minx     = PG_GETARG_FLOAT8(2);
    double miny     = PG_GETARG_FLOAT8(3);
    double maxx     = PG_GETARG_FLOAT8(4);
    double maxy     = PG_GETARG_FLOAT8(5);
    double pointsPerMilliMeter = PG_GETARG_FLOAT8(6);
    char* format    = text_to_cstring(PG_GETARG_TEXT_P(7));
    MapCanvas * canvas = lw_canvas_create();
    MemAddress *addr = (MemAddress*)palloc(sizeof(MemAddress));

    lw_canvas_set_size(canvas, width, height);
    lw_canvas_set_points_per_millimeter(canvas,pointsPerMilliMeter);
    lw_canvas_set_extent(canvas, minx,miny,maxx,maxy);
    lw_canvas_set_format(canvas, format);

    addr->address = (unsigned long)canvas;
    PG_RETURN_POINTER(addr);
}



PG_FUNCTION_INFO_V1(lw_map_destroy);
Datum
lw_map_destroy(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    lw_canvas_destroy(canvas);
    pfree(addr);
    PG_RETURN_NULL();
}


PG_FUNCTION_INFO_V1(lw_map_get_width);
Datum
lw_map_get_width(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->width);
}


PG_FUNCTION_INFO_V1(lw_map_get_height);
Datum
lw_map_get_height(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->height);
}



PG_FUNCTION_INFO_V1(lw_map_get_minx);
Datum
lw_map_get_minx(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->minx);
}


PG_FUNCTION_INFO_V1(lw_map_get_miny);
Datum
lw_map_get_miny(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->miny);
}



PG_FUNCTION_INFO_V1(lw_map_get_maxx);
Datum
lw_map_get_maxx(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->maxx);
}



PG_FUNCTION_INFO_V1(lw_map_get_maxy);
Datum
lw_map_get_maxy(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->maxy);
}



PG_FUNCTION_INFO_V1(lw_map_get_scale);
Datum
lw_map_get_scale(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);

    PG_RETURN_FLOAT8(canvas->scale);
}



PG_FUNCTION_INFO_V1(lw_map_begin);
Datum
lw_map_begin(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);
    lw_canvas_begin(canvas);
    PG_RETURN_POINTER(addr);
}


PG_FUNCTION_INFO_V1(lw_map_end);
Datum
lw_map_end(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    MapCanvas *canvas = (MapCanvas*)(addr->address);
    lw_canvas_end(canvas);
    PG_RETURN_NULL();
}

