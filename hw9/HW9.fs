: dots ( n -- n periods )
BEGIN

dup 0 > WHILE

    dup 0 = IF
        ." ."
    ELSE
        ." . "
    ENDIF
    1 -

REPEAT
drop
;



: asterisks 
BEGIN

dup 0 > WHILE

    dup 0 = IF
        ." *"
    ELSE
        ." * "
    ENDIF
    1 -

REPEAT
drop
;

VARIABLE dotsBefore
VARIABLE dotsAfter
VARIABLE n
: dbox 
dup asterisks CR
dup 3 - dotsAfter !
dup n !
BEGIN
dup 2 > WHILE
    ." * "
    dotsBefore @
    dots
    ." * " 
    dotsAfter @
    dots
    ." * "
    CR
    dotsBefore @
    1 + dotsBefore ! 
    dotsAfter @
    1 - dotsAfter !

    1 -
REPEAT
CR
drop
n @
asterisks
;
