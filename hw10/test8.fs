VARIABLE _LV 1000 CELLS ALLOT


: _Main
10 _LV 0 CELLS + ( i ) ! 
BEGIN
_LV 0 CELLS + @ ( i ) 1 >= WHILE ( 0 ) 
_LV 0 CELLS + @ ( i ) . CR 
_LV 0 CELLS + @ ( i ) 1 - _LV 0 CELLS + ( i ) ! REPEAT ( 0 ) 

." Happy New Year!" ( 0 ) CR 


." The End." ( 1 ) CR 

;

_Main bye
