VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( x ) ! 
_LV 0 CELLS + @ ( x ) 5 <= IF ( 0 ) 
." Yes, x is less than or equal to 5" ( 0 ) CR 

ENDIF ( 0 )


." The End." ( 1 ) CR 

;

_Main bye
