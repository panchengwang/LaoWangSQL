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
    if(canvas->cairo != NULL){
        cairo_destroy(canvas->cairo);
        canvas->cairo = NULL;
    }
    
    if (canvas->surface != NULL){
        cairo_surface_destroy(canvas->surface);
        canvas->surface = NULL;
    }
    free(canvas);
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
    cairo_surface_flush(canvas->surface);
    // cairo_surface_finish(canvas->surface);
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
    xscale = canvas->pointWidth / (canvas->maxx - canvas->minx);
    yscale = canvas->pointHeight / (canvas->maxy - canvas->miny);
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

    // elog(NOTICE, "a: %lf, b: %lf, xoff: %lf,d: %lf, e: %lf, yoff: %f", 
    //     canvas->a, 
    //     canvas->b,
    //     canvas->xoff,
    //     canvas->d,
    //     canvas->e,
    //     canvas->yoff);
}


void lw_canvas_save_to_file(MapCanvas* canvas, const char* filename){
    
    if(canvas->format == CANVAS_PNG){
        lw_canvas_save_to_file_png(canvas, filename);elog(NOTICE,"%s",filename);
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




void lw_canvas_add_geometry(MapCanvas* canvas, LWGEOM* geom){
    int type;
    int i=0;

    
    type = geom->type;
    switch (type)
    {
    case POINTTYPE:
        lw_canvas_add_point(canvas,(LWPOINT*)geom);
        break;
    case LINETYPE:
        lw_canvas_add_linestring(canvas,(LWLINE*)geom);
        break;
    case POLYGONTYPE:
        lw_canvas_add_polygon(canvas, (LWPOLY*)geom);
        break;
    default:
        {
            if( lwgeom_is_collection(geom) )
			{
				LWCOLLECTION *c = (LWCOLLECTION*)geom;
				for( i = 0; i < c->ngeoms; i++ )
				{
					lw_canvas_add_geometry(canvas,c->geoms[i]);
				}
			}
			else
			{
				elog(NOTICE,"Invalid geometry!");
			}
        }
        break;
    }
}


void lw_canvas_fill_polygon(MapCanvas* canvas, LWPOLY* geom){
    int nrings = geom->nrings;
    int i=0,j=0,k=0;
    int count = 0; 
    double *x, *y;
    for(i=0; i<nrings; i++){
        POINTARRAY *ring = geom->rings[i];
        count += ring->npoints;
    }
    x = (double*)malloc(sizeof(double) * count);
    y = (double*)malloc(sizeof(double) * count);

    POINT2D pt;
    for(i=0; i<nrings; i++){
        POINTARRAY *ring = geom->rings[i];
        for(j=0; j<ring->npoints; j++){
            pt = getPoint2d(ring,j);
            x[k] = pt.x;
            y[k] = pt.y;
            k ++;
        }
    }

    cairo_set_source_rgba(canvas->cairo, 0.0,1.0,0.0,0.5);
    cairo_move_to(canvas->cairo, x[0],y[0]);
    for (k=1; k<count; k++){
        cairo_line_to(canvas->cairo, x[k],y[k]);
    }
    cairo_fill(canvas->cairo);
    free(x);
    free(y);
}



void lw_canvas_draw_polygon_border(MapCanvas* canvas, LWPOLY* geom){
    int i,j;
    POINT2D pt;
    cairo_set_source_rgba(canvas->cairo, 0.0,0.0,0.0,0.5);
    cairo_set_line_width(canvas->cairo, 1.0);
    for(i=0; i<geom->nrings; i++){
        POINTARRAY *ring = geom->rings[i];
        pt = getPoint2d(ring,0);
        cairo_move_to(canvas->cairo, pt.x, pt.y);

        for(j=1; j<ring->npoints; j++){
            pt = getPoint2d(ring,j);
            cairo_line_to(canvas->cairo, pt.x, pt.y);
        }
        cairo_close_path(canvas->cairo);
        cairo_stroke(canvas->cairo);
    }
}




void lw_canvas_add_polygon(MapCanvas* canvas, LWPOLY* geom){
    lw_canvas_fill_polygon(canvas, geom);
    lw_canvas_draw_polygon_border(canvas, geom);
}




void lw_canvas_add_linestring(MapCanvas* canvas, LWLINE* geom){
    int npoints = geom->points->npoints;
    int i=0;

    cairo_set_source_rgba(canvas->cairo, 0.0,0.0,0.0,1);
    cairo_set_line_width(canvas->cairo,1.0);
    POINT2D pt = getPoint2d(geom->points,i);
    cairo_move_to(canvas->cairo,pt.x,pt.y);
    for(i=1; i<npoints; i++){
        pt = getPoint2d(geom->points, i);
        cairo_line_to(canvas->cairo, pt.x, pt.y);
    }
    cairo_stroke(canvas->cairo);

}

void lw_canvas_add_point(MapCanvas* canvas, LWPOINT* geom){
    cairo_set_source_rgba(canvas->cairo, 1.0, 0.5, 0.5,0.6);
    cairo_set_line_width(canvas->cairo,1.0);
    POINT2D pt = getPoint2d(geom->point,0);
    cairo_arc(canvas->cairo,pt.x, pt.y,5,0,2*M_PI);
    cairo_fill(canvas->cairo);
    cairo_set_source_rgba(canvas->cairo, 0., 0., 0.,1.0);
    cairo_arc(canvas->cairo,pt.x, pt.y,5,0,2*M_PI);
    cairo_stroke(canvas->cairo);
}


void lw_canvas_affine(MapCanvas* canvas, LWGEOM* lwgeom){
	AFFINE affine;

	affine.afac = canvas->a;
	affine.bfac = canvas->b;
	affine.dfac = canvas->d;
	affine.efac = canvas->e;
	affine.xoff = canvas->xoff;
	affine.yoff = canvas->yoff;

	lwgeom_affine(lwgeom, &affine);

	/* COMPUTE_BBOX TAINTING */
	if (lwgeom->bbox)
	{
		lwgeom_refresh_bbox(lwgeom);
	}
}


