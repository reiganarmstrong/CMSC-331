VARIABLE _LV 1000 CELLS ALLOT


: _Main
12 _LV 0 CELLS + ( n ) ! 
1 _LV 1 CELLS + ( i ) ! 
BEGIN
_LV 1 CELLS + @ ( i ) _LV 0 CELLS + @ ( n ) <= WHILE ( 0 ) 
." * " ( 0 )
_LV 1 CELLS + @ ( i ) 1 + _LV 1 CELLS + ( i ) ! REPEAT ( 0 ) 


." " ( 1 ) CR 


1 _LV 2 CELLS + ( j ) ! 
BEGIN
_LV 2 CELLS + @ ( j ) _LV 0 CELLS + @ ( n ) 2 - <= WHILE ( 3 ) 
." * " ( 2 )

1 _LV 1 CELLS + ( i ) ! 
BEGIN
_LV 1 CELLS + @ ( i ) _LV 2 CELLS + @ ( j ) 1 - <= WHILE ( 1 ) 
." . " ( 3 )
_LV 1 CELLS + @ ( i ) 1 + _LV 1 CELLS + ( i ) ! REPEAT ( 1 ) 


." * " ( 4 )


_LV 2 CELLS + @ ( j ) 1 + _LV 1 CELLS + ( i ) ! 
BEGIN
_LV 1 CELLS + @ ( i ) _LV 0 CELLS + @ ( n ) 2 - <= WHILE ( 2 ) 
." . " ( 5 )
_LV 1 CELLS + @ ( i ) 1 + _LV 1 CELLS + ( i ) ! REPEAT ( 2 ) 


." * " ( 6 ) CR 

_LV 2 CELLS + @ ( j ) 1 + _LV 2 CELLS + ( j ) ! REPEAT ( 3 ) 


1 _LV 1 CELLS + ( i ) ! 
BEGIN
_LV 1 CELLS + @ ( i ) _LV 0 CELLS + @ ( n ) <= WHILE ( 4 ) 
." * " ( 7 )
_LV 1 CELLS + @ ( i ) 1 + _LV 1 CELLS + ( i ) ! REPEAT ( 4 ) 


." " ( 8 ) CR 


." The End." ( 9 ) CR 

;

_Main bye
