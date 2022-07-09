VARIABLE _LV 1000 CELLS ALLOT


: _Main
." Printng odd numbers up to 20:" ( 0 ) CR 

1 _LV 0 CELLS + ( y ) ! 

BEGIN
_LV 0 CELLS + @ ( y ) 20 <= WHILE ( 1 ) 
2 _LV 0 CELLS + @ ( y ) 2 / * _LV 0 CELLS + @ ( y ) <> IF ( 0 ) 
_LV 0 CELLS + @ ( y ) . CR 

ENDIF ( 0 )

_LV 0 CELLS + @ ( y ) 1 + _LV 0 CELLS + ( y ) ! 
REPEAT ( 1 ) 


." The End." ( 1 ) CR 

;

_Main bye
