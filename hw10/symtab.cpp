// File: symtab.cpp 
//
// Simple use of hash_map container class
// Note hash_map is not in C++ standard (yet???)
// Following use of constant strings might be problematic.
//

#include <iostream>
#include <unordered_map>
#include "symtab.h"

using namespace std ;

// Here, "static" means file scope. 
// Only functions in this file can see STable.
//
using SymTabType = unordered_map<string, st_entry> ;
static SymTabType STable ;

// 
extern "C" void st_init() {
   /* do nothing */
}

extern "C" void st_insert(char *name, st_entry record) {
   string name2(name) ;
   STable[name2] = record ; 
}


extern "C" st_entry *st_find(char *name) {
   SymTabType::iterator it ;
   string name2(name) ;

   it = STable.find(name2) ;

   if (it == STable.end()) return NULL ;
   
   return &(it->second) ;
}


extern "C" void st_dump() {
   SymTabType::iterator it ;
   pair<string,st_entry> p ;

   cerr << "******************************************\n" ;
   cerr << "\nDumping symbol table:...\n" ;

   for(it = STable.begin() ; it != STable.end() ; it++) {
      p = *it ;
      cerr << "variable " << p.first << " ("
           << p.second.type << ", "
           << p.second.var_no << ")\n" ;
   }

   cerr << "******************************************\n" ;
   
}

/*

int main() {
   st_entry foo = {1, 1789}, bar ;

   STable["George Washington"] = foo ;
   foo.type = 2 ; foo.var_no = 1797 ;
   STable["John Adams"] = foo ;
   foo.type = 3 ; foo.var_no = 2001 ;
   STable["Thomas Jefferson"] = foo ;

   bar = STable["John Adams"] ;
   cout << "{" << bar.type << "," << bar.var_no << "}" << endl ;

   SymTabType::iterator it ;
   pair<string,st_entry> p ;

   for(it = STable.begin() ; it != STable.end() ; it++) {
      p = *it ;
      cout << p.first << " is President #" << p.second.type 
           << " and took office in " << p.second.var_no << "\n" ;
   }
   
   st_dump() ;

   return 0;
}

*/
