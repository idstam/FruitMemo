/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the credit screen of the application.
*/

function credits_show()
	t as integer[4]
	textSize as integer
	menueItems as MENUE_ITEM[2]
	
	menueItems[1] = menue_createButton(lang_getText(1), 350)
	
	textSize = 21
	t[1] = menue_createCenterScreenText(lang_getText(6), textSize, 100)
	t[2] = menue_createCenterScreenText(lang_getText(7), textSize, 130)
	
	t[3] = menue_createCenterScreenText(lang_getText(8), textSize, 180)
	t[4] = menue_createCenterScreenText(lang_getText(9), textSize, 210)
	

	menueItems[2] = menue_createButton(lang_getText(10), 240)
	
	do
        if GetPointerPressed() = 1
            if menue_buttonHitTest(menueItems[1]) = 1
                exit
            endif
            if menue_buttonHitTest(menueItems[2]) = 1
                OpenBrowser("http://jsi.se")
            endif
        endif

        Sync()
	loop

	menue_destroyButton(menueItems[1])
	menue_destroyButton(menueItems[2])
	menue_deleteTexts(t)
	
endfunction


