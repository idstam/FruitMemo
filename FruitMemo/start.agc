/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the start screen of the application.
*/

function start_show()
	menueItems as MENUE_BUTTON[3]
	start_createMenue(menueItems)
	
	x as integer
	y as integer
	score as integer
	do
        if GetPointerPressed() = 1

            if menue_buttonHitTest(menueItems[1]) = 1

				start_destroyMenue(menueItems)
                score = game_show()
                if score = 0
					enh_show(score)
				else
					enh_show(score)
				endif
				start_createMenue(menueItems)
            endif
            
            if menue_buttonHitTest(menueItems[2]) = 1
				start_destroyMenue(menueItems)
                credits_show()
                start_createMenue(menueItems)
            endif
            
            if menue_buttonHitTest(menueItems[3]) = 1
				start_destroyMenue(menueItems)
                exit
            endif
        endif

        Sync()
	loop
	
	start_destroyMenue(menueItems)
endfunction

function start_createMenue(menueItems ref as MENUE_BUTTON[])
	buttonTopStart as integer
	
	buttonTopStart = 150
	
	menueItems[1] = menue_createButton(lang_getText(1), buttonTopStart, buttonImageUp, buttonImageDown) //Start
	menueItems[2] = menue_createButton(lang_getText(2), buttonTopStart + 70, buttonImageUp, buttonImageDown) //Credits
	menueItems[3] = menue_createButton(lang_getText(3), buttonTopStart + 140, buttonImageUp, buttonImageDown) //Exit
endfunction
	
function start_destroyMenue(menueItems as MENUE_BUTTON[])
	menue_destroyButton(menueItems[1])
	menue_destroyButton(menueItems[2])
	menue_destroyButton(menueItems[3])
endfunction
