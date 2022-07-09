#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "strlist2.h"



/*************************************************************
Print message and abort.
*/
static void crash_and_burn(char * mesg) {

   fprintf (stderr, "Error: %s\n", mesg) ;
   abort() ;
}


/*************************************************************
Initialize a linked list of strings with dummy header.
*/
void strlist_init(strlist *lptr) {
   str_node *tptr ;

   // make dummy header
   //
   if (! (tptr = malloc(sizeof(str_node)))) 
      crash_and_burn("malloc() out of memory!!") ;

   tptr->number = -1 ;
   tptr->str = NULL ;
   tptr->next = NULL ;
   
   lptr->head = tptr ;
   lptr->last = tptr ;
}


/*************************************************************
Add str_node at the end.
*/
void strlist_append(strlist *lptr, int number, char *str) {
   str_node *tptr ;

   // make new node with number & str
   //
   if (! (tptr = malloc(sizeof(str_node)))) 
      crash_and_burn("malloc() out of memory!!") ;
   tptr->number = number ;
   tptr->str = strdup(str) ;
   tptr->next = NULL ;
   
   assert(lptr->last != NULL) ;

   //
   lptr->last->next = tptr ;
   lptr->last = tptr ;
}


/*************************************************************
Append strlist2 at end of strlist1, destroying strlist2.
*/
void strlist_concat(strlist *lptr1, strlist *lptr2) {

   // Note lists have dummy headers
   assert (lptr1 != NULL) ;
   assert (lptr1->head != NULL && lptr1->last != NULL) ;
   assert (lptr2 != NULL) ;
   assert (lptr2->head != NULL && lptr2->last != NULL) ;

   lptr1->last->next = lptr2->head->next ;
   lptr1->last = lptr2->last ;

   // clean up and deallocate lptr2 dummy header
   //
   lptr2->last = NULL ;
   lptr2->head->next = NULL ;
   free(lptr2->head) ;
   lptr2->head = NULL ;
}


/*************************************************************
Deallocate list
*/
void strlist_destroy(strlist *lptr) {
   str_node *ptr1, *fptr;

   ptr1 = lptr->head ;
   lptr->head = NULL ;
   lptr->last = NULL ;
 
   while(ptr1 != NULL) {
       fptr = ptr1 ;
       ptr1 = ptr1->next ;
       
       free(fptr->str) ;   /* OK to free NULL pointer */
       free(fptr) ;
   }

}


/*************************************************************
Print out entire list
*/
void strlist_output(FILE *of, strlist *lptr) {
   str_node *ptr ;

   assert(lptr->head != NULL) ;
   ptr = lptr->head->next ;

   while(ptr != NULL) {
      fprintf(of, "%s", ptr->str) ;
      ptr = ptr->next ;
   }

   fprintf(of, "\n") ;
}


/*************************************************************
Print out assembly language string constants
*/
void strlist_dump_asm_str(FILE *of, strlist *lptr, const char *prefix) {
   str_node *ptr ;

   fprintf(of, "\n; Assembly language string constants\n") ;
   
   assert(lptr->head != NULL) ;
   ptr = lptr->head->next ;

   while(ptr != NULL) {
      fprintf(of, "%s%d:\t", prefix, ptr->number) ;
	  fprintf(of, "db\t\"%s\", 0\n", ptr->str) ;
	  ptr = ptr->next ;
   }

   fprintf(of, "\n") ;
}
