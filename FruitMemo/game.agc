

/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the actual game.
*/

function game_show()
	x as integer
	y as integer
	score as integer
	buttonTopStart as integer
	dim menueItems[2] as MENUE_ITEM
	buttonTopStart = 200
	
	menueItems[1] = menue_createButton("End no high score", buttonTopStart)
	menueItems[2] = menue_createButton("End with high score", buttonTopStart + 70)

	do
        if GetPointerPressed() = 1
            if menue_buttonHitTest(menueItems[1]) = 1
				score = 0
                exit
            endif
            if menue_buttonHitTest(menueItems[2]) = 1
				score = 100
                exit
            endif
        endif

        Sync()
	loop

	menue_destroyButton(menueItems[1])
	menue_destroyButton(menueItems[2])
	
endfunction score


