/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the start screen of the application.
*/

function start_show()
	menueItems as BUTTON_BUTTON[4]
	start_createMenue(menueItems)
	
	x as integer
	y as integer
	score as integer
	do
        if GetPointerState() = 1

            if button_buttonHitTest(menueItems[1]) = 1

				start_destroyMenue(menueItems)
                game_show()
				enh_show() //losingPosition, totalLength are globals
				start_createMenue(menueItems)
            elseif button_buttonHitTest(menueItems[2]) = 1
				start_destroyMenue(menueItems)
                credits_show()
                start_createMenue(menueItems)
            elseif button_buttonHitTest(menueItems[3]) = 1
				start_destroyMenue(menueItems)
                how_show()
                start_createMenue(menueItems)
            elseif button_buttonHitTest(menueItems[4]) = 1
				//start_destroyMenue(menueItems)
                exit
            endif
        endif

        Sync()
	loop
	
	start_destroyMenue(menueItems)
endfunction

function start_createMenue(menueItems ref as BUTTON_BUTTON[])
	buttonTopStart as integer
	
	buttonTopStart = 150
	
	menueItems[1] = button_createButton(lang_getText(1), buttonTopStart, buttonImageUp, buttonImageDown, 50) //Start
	menueItems[2] = button_createButton(lang_getText(2), buttonTopStart + 70, buttonImageUp, buttonImageDown, 50) //Credits
	menueItems[3] = button_createButton(lang_getText(11), buttonTopStart + 140, buttonImageUp, buttonImageDown, 50) //Exit
	menueItems[4] = button_createButton(lang_getText(3), buttonTopStart + 210, buttonImageUp, buttonImageDown, 50) //Exit
endfunction
	
function start_destroyMenue(menueItems as BUTTON_BUTTON[])
	button_destroyButtons(menueItems)
endfunction
