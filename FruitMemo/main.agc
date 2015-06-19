
// Project: FruitMemo 
// Created: 2015-06-14
#option_explicit

// set window properties
Global screenWidth
Global screenHeight
screenWidth = 320
screenHeight = 480

SetWindowTitle( "FruitMemo" )
SetVirtualResolution ( screenWidth, screenHeight )
SetWindowSize(640, 960, 0)
SetClearColor(150, 210, 234)
//SetOrientationAllowed( 1, 1, 1, 1 )

#include "language.agc"
#include "menue.agc"
#include "start.agc"
#include "game.agc"
#include "credits.agc"
#include "how.agc"
#include "end_high_score.agc"
#include "end_no_high_score.agc"
#include "start.agc"


initializeComponents()

lang_select()
start_show()


function initializeComponents()
	menu_font as integer
	menu_font_high as integer
	button_init()

    menu_font = LoadImage("KristenITC_24_low.png")
    menu_font_high = LoadImage("KristenITC_24_high.png")

    SetTextDefaultFontImage(menu_font)
    SetTextDefaultExtendedFontImage(menu_font_high)


endfunction
