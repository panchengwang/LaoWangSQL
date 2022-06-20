#ifndef __MEMADD_H
#define __MEMADD_H
#include <postgres.h>
#include <fmgr.h>

typedef struct{
    unsigned long address;
}MemAddress;


Datum lw_memadd_in(PG_FUNCTION_ARGS);
Datum lw_memadd_out(PG_FUNCTION_ARGS);

#endif
