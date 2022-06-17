#ifndef __CANVAS_H
#define __CANVAS_H

#include <stdlib.h>
#include <stdio.h>
#include <cairo.h>
#include <math.h>

#define CANVAS_PNG 1
#define CANVAS_JPG 2
#define CANVAS_PDF 3




typedef struct {
    cairo_surface_t *surface;
    cairo_t *cairo;
    double minx,miny,maxx,maxy;
    double centerx, centery;
    double width,height;                        // unit: millimeter
    double pointWidth, pointHeight;             // unit: pixel for image, point for pdf
    double pointsPerMilliMeter;
    double scale;
    int    format;                              // image or pdf
} MapCanvas;


MapCanvas* lw_canvas_create();
void lw_canvas_destroy(MapCanvas *canvas);

void lw_canvas_set_extent(MapCanvas *canvas, double minx, double miny, double maxx, double maxy);
void lw_canvas_set_points_per_millimeter(MapCanvas* canvas, double pointsPerMilliMeter);
void lw_canvas_set_size(MapCanvas *canvas, double width, double height);
void lw_canvas_set_format(MapCanvas *canvas, const char* format);

void lw_canvas_begin(MapCanvas *canvas);
void lw_canvas_end(MapCanvas *canvas);

void lw_canvas_recalculate_parameters(MapCanvas* canvas);

#endif

