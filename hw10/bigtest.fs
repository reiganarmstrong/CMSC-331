VARIABLE _LV 1000 CELLS ALLOT


: _Main
1 _LV 0 CELLS + ( a ) ! 
1 _LV 1 CELLS + ( b ) ! 

1 _LV 3 CELLS + ( d ) ! 

." These sets of the 7 numbers in the set 1-7 multiply to give a value greater than 400" ( 0 ) CR 


BEGIN
_LV 0 CELLS + @ ( a ) 7 <= WHILE ( 13 ) 
_LV 0 CELLS + @ ( a ) _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 0 ) 
."  [" ( 1 )

_LV 0 CELLS + @ ( a ) . 


." ] " ( 2 ) CR 


ENDIF ( 0 )


1 _LV 1 CELLS + ( b ) ! 

BEGIN
_LV 1 CELLS + @ ( b ) 7 <= WHILE ( 12 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 1 ) 
."  [" ( 3 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 4 )


_LV 1 CELLS + @ ( b ) . 


." ] " ( 5 ) CR 


ENDIF ( 1 )


1 _LV 2 CELLS + ( c ) ! 
BEGIN
_LV 2 CELLS + @ ( c ) 7 <= WHILE ( 11 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 2 CELLS + @ ( c ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 2 ) 
."  [" ( 6 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 7 )


_LV 1 CELLS + @ ( b ) . 


." , " ( 8 )


_LV 2 CELLS + @ ( c ) . 


." ] " ( 9 ) CR 


ENDIF ( 2 )


1 _LV 3 CELLS + ( d ) ! 

BEGIN
_LV 3 CELLS + @ ( d ) 7 <= WHILE ( 10 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 2 CELLS + @ ( c ) * _LV 3 CELLS + @ ( d ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 3 ) 
."  [" ( 10 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 11 )


_LV 1 CELLS + @ ( b ) . 


." , " ( 12 )


_LV 2 CELLS + @ ( c ) . 


." , " ( 13 )


_LV 3 CELLS + @ ( d ) . 


." ] " ( 14 ) CR 


ENDIF ( 3 )


1 _LV 4 CELLS + ( e ) ! 
BEGIN
_LV 4 CELLS + @ ( e ) 7 <= WHILE ( 9 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 2 CELLS + @ ( c ) * _LV 3 CELLS + @ ( d ) * _LV 4 CELLS + @ ( e ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 4 ) 
."  [" ( 15 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 16 )


_LV 1 CELLS + @ ( b ) . 


." , " ( 17 )


_LV 2 CELLS + @ ( c ) . 


." , " ( 18 )


_LV 3 CELLS + @ ( d ) . 


." , " ( 19 )


_LV 4 CELLS + @ ( e ) . 


." ] " ( 20 ) CR 


ENDIF ( 4 )


1 _LV 5 CELLS + ( f ) ! 
BEGIN
_LV 5 CELLS + @ ( f ) 7 <= WHILE ( 8 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 2 CELLS + @ ( c ) * _LV 3 CELLS + @ ( d ) * _LV 4 CELLS + @ ( e ) * _LV 5 CELLS + @ ( f ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 5 ) 
."  [" ( 21 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 22 )


_LV 1 CELLS + @ ( b ) . 


." , " ( 23 )


_LV 2 CELLS + @ ( c ) . 


." , " ( 24 )


_LV 3 CELLS + @ ( d ) . 


." , " ( 25 )


_LV 4 CELLS + @ ( e ) . 


." , " ( 26 )


_LV 5 CELLS + @ ( f ) . 


." ] " ( 27 ) CR 


ENDIF ( 5 )


1 _LV 6 CELLS + ( g ) ! 
BEGIN
_LV 6 CELLS + @ ( g ) 7 <= WHILE ( 7 ) 
_LV 0 CELLS + @ ( a ) _LV 1 CELLS + @ ( b ) * _LV 2 CELLS + @ ( c ) * _LV 3 CELLS + @ ( d ) * _LV 4 CELLS + @ ( e ) * _LV 5 CELLS + @ ( f ) * _LV 6 CELLS + @ ( g ) * _LV 7 CELLS + ( prod ) ! 
_LV 7 CELLS + @ ( prod ) 400 > IF ( 6 ) 
."  [" ( 28 )

_LV 0 CELLS + @ ( a ) . 


." , " ( 29 )


_LV 1 CELLS + @ ( b ) . 


." , " ( 30 )


_LV 2 CELLS + @ ( c ) . 


." , " ( 31 )


_LV 3 CELLS + @ ( d ) . 


." , " ( 32 )


_LV 4 CELLS + @ ( e ) . 


." , " ( 33 )


_LV 5 CELLS + @ ( f ) . 


." , " ( 34 )


_LV 6 CELLS + @ ( g ) . 


." ] " ( 35 ) CR 


ENDIF ( 6 )

_LV 6 CELLS + @ ( g ) 1 + _LV 6 CELLS + ( g ) ! REPEAT ( 7 ) 

_LV 5 CELLS + @ ( f ) 1 + _LV 5 CELLS + ( f ) ! REPEAT ( 8 ) 

_LV 4 CELLS + @ ( e ) 1 + _LV 4 CELLS + ( e ) ! REPEAT ( 9 ) 


_LV 3 CELLS + @ ( d ) 1 + _LV 3 CELLS + ( d ) ! 
REPEAT ( 10 ) 

_LV 2 CELLS + @ ( c ) 1 + _LV 2 CELLS + ( c ) ! REPEAT ( 11 ) 


_LV 1 CELLS + @ ( b ) 1 + _LV 1 CELLS + ( b ) ! 
REPEAT ( 12 ) 


_LV 0 CELLS + @ ( a ) 1 + _LV 0 CELLS + ( a ) ! 
REPEAT ( 13 ) 


." " ( 36 ) CR 


." The End." ( 37 ) CR 

;

_Main bye
