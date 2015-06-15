/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the credit screen of the application.
*/

function credits_show()
	x as integer
	y as integer
	buttonTopStart as integer
	dim menueItems[1] as MENUE_ITEM
	buttonTopStart = 250
	
	menueItems[1] = menue_createButton(lang_getText(1), buttonTopStart)

	do
        if GetPointerPressed() = 1
            if menue_buttonHitTest(menueItems[1]) = 1
                exit
            endif
        endif

        Sync()
	loop

	menue_destroyButton(menueItems[1])
	
endfunction


