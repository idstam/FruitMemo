
// Project: FruitMemo 
// Created: 2015-06-14


// set window properties
SetWindowTitle( "FruitMemo" )
SetWindowSize( 1024, 768, 0 )

// set display properties
SetVirtualResolution( 1024, 768 )
SetOrientationAllowed( 1, 1, 1, 1 )

#include "menue.agc"
#include
initializeComponents()

do
    menue_showMenue()

    Sync()
loop



function initializeComponents()
	menueState = 0
endfunction
