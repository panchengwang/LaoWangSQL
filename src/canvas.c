#include "canvas.h"
#include <string.h>
#include <liblwgeom.h>
#include <postgres.h>
#include <fmgr.h>



MapCanvas* lw_canvas_create(){
    MapCanvas* canvas = (MapCanvas*)malloc(sizeof(MapCanvas));
    canvas->surface = NULL;
    canvas->cairo = NULL;
    return canvas;
}


void lw_canvas_destroy(MapCanvas *canvas){
    lw_canvas_end(canvas);
}



void lw_canvas_begin(MapCanvas *canvas){
    lw_canvas_recalculate_parameters(canvas);

    if (canvas->format == CANVAS_JPG || 
        canvas->format == CANVAS_PNG){
        canvas->surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, canvas->pointWidth, canvas->pointHeight);
        canvas->cairo = cairo_create(canvas->surface);
    }else if(canvas->format == CANVAS_PDF){

    }
}


void lw_canvas_end(MapCanvas *canvas){
    if(canvas->cairo != NULL){
        cairo_destroy(canvas->cairo);
        canvas->cairo = NULL;
    }
    
    if (canvas->surface != NULL){
        cairo_surface_destroy(canvas->surface);
        canvas->surface = NULL;
    }
}


void lw_canvas_set_extent(MapCanvas *canvas, double minx, double miny, double maxx, double maxy){
    canvas->minx = minx;
    canvas->miny = miny;
    canvas->maxx = maxx;
    canvas->maxy = maxy;
    canvas->centerx = (canvas->minx + canvas->maxx) * 0.5;
    canvas->centery = (canvas->miny + canvas->maxy) * 0.5;
}


void lw_canvas_set_points_per_millimeter(MapCanvas* canvas, double pointsPerMilliMeter){
    canvas->pointsPerMilliMeter = pointsPerMilliMeter;
}


void lw_canvas_set_size(MapCanvas *canvas, double width, double height){
    canvas->width = width;
    canvas->height = height;
}


void lw_canvas_set_format(MapCanvas *canvas, const char* format){
    if ( strcasecmp(format, "png") == 0 ){
        canvas->format = CANVAS_PNG;
    }else if(strcasecmp(format, "jpg") == 0) {
        canvas->format = CANVAS_JPG;
    }else if (strcasecmp(format, "pdf") == 0){
        canvas->format = CANVAS_PDF;
    }
}

void lw_canvas_recalculate_parameters(MapCanvas* canvas){
    double xscale, yscale;
    canvas->pointWidth = canvas->width * canvas->pointsPerMilliMeter;
    canvas->pointHeight = canvas->height * canvas->pointsPerMilliMeter;
    xscale = canvas->width / (canvas->maxx - canvas->minx);
    yscale = canvas->height / (canvas->maxy - canvas->miny);
    canvas->scale = xscale > yscale ? yscale : xscale;
    canvas->minx = canvas->centerx - canvas->pointWidth * 0.5 / canvas->scale;
    canvas->maxx = canvas->centerx + canvas->pointWidth * 0.5 / canvas->scale;
    canvas->miny = canvas->centery - canvas->pointHeight * 0.5 / canvas->scale;
    canvas->maxy = canvas->centery + canvas->pointHeight * 0.5 / canvas->scale;

    canvas->a = canvas->scale;
    canvas->b = 0.0;
    canvas->xoff = canvas->pointWidth * 0.5 - canvas->centerx * canvas->scale;
    canvas->d = 0.0;
    canvas->e = - canvas->scale;
    canvas->yoff = canvas->pointHeight * 0.5 + canvas->centery * canvas->scale;

}


void lw_canvas_save_to_file(MapCanvas* canvas, const char* filename){
    if(canvas->format == CANVAS_PNG){
        lw_canvas_save_to_file_png(canvas, filename);
    }else if(canvas->format == CANVAS_PDF){
        elog(NOTICE,"Can not save to pdf file.");
    }else if(canvas->format == CANVAS_JPG){
        elog(NOTICE,"Can not save to jpg file.");
    }else {
        elog(NOTICE,"Invalid file format.");
    }
}


void lw_canvas_save_to_file_png(MapCanvas* canvas, const char* filename){
    cairo_surface_write_to_png(canvas->surface,filename);
}