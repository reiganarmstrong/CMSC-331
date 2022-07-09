#ifndef STRLIST_H
#define STRLIST_H

#define STR_LABEL_PREFIX "cstr"

typedef struct struct_str_node {
   int number ;
   char *str ;
   struct struct_str_node *next ;
} str_node ;

typedef struct struct_strlist {
   str_node *head, *last ;
} strlist ;

void strlist_init(strlist *) ;
void strlist_append(strlist *, int, char *) ; 
void strlist_concat(strlist *, strlist *) ; 
void strlist_destroy(strlist *) ;

void strlist_output(FILE *, strlist *) ;
void strlist_dump_asm_str(FILE *, strlist *, const char *) ;

#endif
