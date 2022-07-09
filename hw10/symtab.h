#ifndef SYMTAB_H
#define SYMTAB_H

#define BOOL_FALSE 0
#define BOOL_TRUE -1

typedef enum st_type {int_type, bool_type, float_type} st_type ;

typedef struct {
   st_type type ;
   int var_no ;
} st_entry ;

#ifdef __cplusplus
extern "C" {
#endif

void st_init() ;
void st_insert(char *, st_entry) ;
st_entry *st_find(char *) ;
void st_dump() ;


#ifdef __cplusplus
}
#endif

#endif
