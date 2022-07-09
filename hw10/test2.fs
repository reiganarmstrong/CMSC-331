VARIABLE _LV 1000 CELLS ALLOT


: _Main
4 _LV 0 CELLS + ( x ) ! 
." x is " ( 0 )


_LV 0 CELLS + @ ( x ) . CR 


_LV 0 CELLS + @ ( x ) 5 <= IF ( 0 ) 
." Yes, x is less than or equal to 5" ( 1 ) CR 
ELSE ( 0 ) ." No, x is not less than or equal to 5" ( 2 ) CR 

ENDIF ( 0 )


9 _LV 0 CELLS + ( x ) ! 

." x is " ( 3 )


_LV 0 CELLS + @ ( x ) . CR 


_LV 0 CELLS + @ ( x ) 5 <= IF ( 1 ) 
." Yes, x is less than or equal to 5" ( 4 ) CR 
ELSE ( 1 ) ." No, x is not less than or equal to 5" ( 5 ) CR 

ENDIF ( 1 )


." The End." ( 6 ) CR 

;

_Main bye
