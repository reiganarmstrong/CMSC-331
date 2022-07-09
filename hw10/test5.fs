VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( y ) ! 
BEGIN
_LV 0 CELLS + @ ( y ) 7 <= WHILE ( 1 ) 
1 _LV 1 CELLS + ( x ) ! 
BEGIN
_LV 1 CELLS + @ ( x ) 3 <= WHILE ( 0 ) 
." ( " ( 0 )

_LV 1 CELLS + @ ( x ) . 


." , " ( 1 )


_LV 0 CELLS + @ ( y ) . 


." )" ( 2 ) CR 


_LV 1 CELLS + @ ( x ) 1 + _LV 1 CELLS + ( x ) ! 
REPEAT ( 0 ) 


_LV 0 CELLS + @ ( y ) 1 + _LV 0 CELLS + ( y ) ! 
REPEAT ( 1 ) 


." The End." ( 3 ) CR 

;

_Main bye
