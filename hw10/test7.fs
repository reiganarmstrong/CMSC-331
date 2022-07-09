VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( i ) ! 
BEGIN
_LV 0 CELLS + @ ( i ) 7 <= WHILE ( 1 ) 
1 _LV 1 CELLS + ( j ) ! 
BEGIN
_LV 1 CELLS + @ ( j ) 3 <= WHILE ( 0 ) 
." i = " ( 0 )

_LV 0 CELLS + @ ( i ) . 


." , j = " ( 1 )


_LV 1 CELLS + @ ( j ) . CR 

_LV 1 CELLS + @ ( j ) 1 + _LV 1 CELLS + ( j ) ! REPEAT ( 0 ) 
_LV 0 CELLS + @ ( i ) 1 + _LV 0 CELLS + ( i ) ! REPEAT ( 1 ) 

." The End." ( 2 ) CR 

;

_Main bye
