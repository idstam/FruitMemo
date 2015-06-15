/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the start screen of the application.
*/

function start_show()
	start_createMenue()
	
	x as integer
	y as integer
	score as integer
	do
        if GetPointerPressed() = 1

            if menue_buttonHitTest(menueItems[1]) = 1
				start_destroyMenue()
                score = game_show()
                if score = 0
					enh_show()
				else
					enh_show()
				endif
				start_createMenue()
            endif
            
            if menue_buttonHitTest(menueItems[2]) = 1
				start_destroyMenue()
                credits_show()
                start_createMenue()
            endif
            
            if menue_buttonHitTest(menueItems[3]) = 1
                exit
            endif
        endif

        Sync()
	loop
	
	start_destroyMenue()
endfunction

function start_createMenue()
	buttonTopStart as integer
	dim menueItems[3] as MENUE_ITEM
	buttonTopStart = 150
	
	menueItems[1] = menue_createButton(lang_getText(1), buttonTopStart) //Start
	menueItems[2] = menue_createButton(lang_getText(2), buttonTopStart + 70) //Credits
	menueItems[3] = menue_createButton(lang_getText(3), buttonTopStart + 140) //Exit
endfunction
	
function start_destroyMenue()
	menue_destroyButton(menueItems[1])
	menue_destroyButton(menueItems[2])
	menue_destroyButton(menueItems[3])
endfunction
