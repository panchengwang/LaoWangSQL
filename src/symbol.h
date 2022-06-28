#ifndef __SYMBOL_H
#define __SYMBOL_H


typedef struct {
    int len;
    char data[0];
}MapSymbol;

typedef struct {
    double red,green,blue,alpha;
}SymbolColor;

typedef struct{
    double x, y;
}SymbolPoint;

typedef struct{
    int ndashes;
    double *dashes;
    double offset;
}SymbolDash;

typedef struct {

}SymbolSystemDrawMethod;


typedef struct {

}SymbolLine;





#endif
