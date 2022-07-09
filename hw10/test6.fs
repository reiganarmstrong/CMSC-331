VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( i ) ! 
BEGIN
_LV 0 CELLS + @ ( i ) 7 <= WHILE ( 0 ) 
_LV 0 CELLS + @ ( i ) . CR 
_LV 0 CELLS + @ ( i ) 1 + _LV 0 CELLS + ( i ) ! REPEAT ( 0 ) 

." The End." ( 0 ) CR 

;

_Main bye
