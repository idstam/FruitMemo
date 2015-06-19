/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the game instruction screen.
*/

function how_show()
	t as integer[1]
	textSize as integer
	menueItems as BUTTON_BUTTON[1]
	
	menueItems[1] = button_createButton(lang_getText(1), 380, buttonImageUp, buttonImageDown, 50)
	
	textSize = 35
	t[1] = button_createCenterScreenText(lang_getText(12), textSize, 30)
	

	
	do
        if GetPointerState() = 1
            if button_buttonHitTest(menueItems[1]) = 1
                exit
            endif
        endif

        Sync()
	loop

	button_destroyButtons(menueItems)
	button_deleteTexts(t)
	
endfunction


