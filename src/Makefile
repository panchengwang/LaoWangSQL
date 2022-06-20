# contrib/laowangsql/Makefile

MODULE_big = laowangsql
OBJS = 	map.o \
		canvas.o \
		memadd.o

EXTENSION = laowangsql
DATA = laowangsql--1.0.sql

EXTRA_CLEAN = postgis/libs/*.a postgis/libs/libpostgis.so

HEADERS =

REGRESS =

POSTGIS_PATH = ../../../postgis
PG_CPPFLAGS = \
	-DPIC \
	-I$(POSTGIS_PATH) \
	-I$(POSTGIS_PATH)/libpgcommon \
	-I$(POSTGIS_PATH)/liblwgeom \
	-I../../src/backend \
	-I$(shell pg_config --includedir) \
	$(shell pkg-config cairo --cflags)

ifeq ($(shell uname),Darwin)
	SHLIB_LINK_F = \
		-L$(shell pg_config --libdir) \
		-lgeos_c \
		-lproj \
		-ljson-c \
		$(shell pkg-config cairo --libs) \
		./tools/libs/libpostgis.a
endif
ifeq ($(shell uname),Linux)
		SHLIB_LINK_F = \
		-L$(shell pg_config --libdir) \
		$(shell pkg-config cairo --libs) \
		-lgeos_c \
		-lproj \
		-ljson-c \
		-lpostgis 
endif

SHLIB_LINK := $(SHLIB_LINK_F) $(SHLIB_LINK)



ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/laowangsql
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif



distprep:

maintainer-clean:


test:
	echo $(SHLIB_LINK_F)
