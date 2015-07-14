/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the credit screen of the application.
*/

function credits_show()
	t as integer[4]
	textSize as integer
	menueItems as BUTTON_BUTTON[2]
	
	menueItems[1] = button_createButton(lang_getText(1), 350, buttonImageUp, buttonImageDown, 50)
	
	textSize = 33
	t[1] = button_createCenterScreenText(lang_getText(6), textSize, 100)
	t[2] = button_createCenterScreenText(lang_getText(7), textSize, 130)
	
	t[3] = button_createCenterScreenText(lang_getText(8), textSize, 180)
	t[4] = button_createCenterScreenText(lang_getText(9), textSize, 210)
	

	menueItems[2] = button_createButton(lang_getText(10), 240, buttonImageUp, buttonImageDown, 40)
	
	do
		if GetRawKeyState(27) = 1 then exitfunction
		
        if GetPointerState() = 1
            if button_buttonHitTest(menueItems[1]) = 1
                exit
            elseif button_buttonHitTest(menueItems[2]) = 1
                OpenBrowser("http://jsi.se")
                exit
            endif
        endif

        Sync()
	loop

	button_destroyButtons(menueItems)
	button_deleteTexts(t)
	
endfunction


