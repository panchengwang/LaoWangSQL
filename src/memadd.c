#include <memadd.h>
#include <postgres.h>
#include <fmgr.h>
#include <stdlib.h>


// PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(lw_memadd_in);
Datum lw_memadd_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);
    MemAddress *addr;
    char *p; 
    addr = (MemAddress*)palloc(sizeof(MemAddress));
    addr->address = strtoul(str,&p,16);
    PG_RETURN_POINTER(addr);
}



PG_FUNCTION_INFO_V1(lw_memadd_out);
Datum lw_memadd_out(PG_FUNCTION_ARGS)
{
    MemAddress   *addr = (MemAddress *) PG_GETARG_POINTER(0);
    char       *result;
    unsigned long *p = (unsigned long*) (addr->address);
    result = psprintf("%p", p);
    PG_RETURN_CSTRING(result);
}

