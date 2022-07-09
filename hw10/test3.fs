VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( y ) ! 
BEGIN
_LV 0 CELLS + @ ( y ) 7 <= WHILE ( 0 ) 
_LV 0 CELLS + @ ( y ) . CR 

_LV 0 CELLS + @ ( y ) 1 + _LV 0 CELLS + ( y ) ! 
REPEAT ( 0 ) 


." The End." ( 0 ) CR 

;

_Main bye
