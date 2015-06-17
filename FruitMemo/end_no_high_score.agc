
/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the end screen of the application.
*/

function enh_show(score as integer)
	x as integer
	y as integer
	buttonTopStart as integer
	firstScoreText as integer
	secondScoreText as integer
	thirdScoreText as integer
	pos as integer
	dim menueItems[1] as MENUE_BUTTON
	buttonTopStart = 250
	
	firstScoreText = CreateText(lang_getText(4))
	SetTextVisible(firstScoreText, 1)
	SetTextSize(firstScoreText, 25)
	pos = 160 - (GetTextTotalWidth(firstScoreText) / 2)
	SetTextPosition(firstScoreText, pos, 40)
	
	secondScoreText = CreateText( str(score) )
	SetTextVisible(secondScoreText, 1)
	SetTextSize(secondScoreText, 35)
	pos = 160 - (GetTextTotalWidth(secondScoreText) / 2)
	SetTextPosition(secondScoreText, pos, 100)
	
	
	thirdScoreText = CreateText(lang_getText(5))
	SetTextVisible(thirdScoreText, 1)
	SetTextSize(thirdScoreText, 25)
	pos = 160 - (GetTextTotalWidth(thirdScoreText) / 2)
	SetTextPosition(thirdScoreText, pos, 160)
	
	menueItems[1] = menue_createButton(lang_getText(1), buttonTopStart, buttonImageUp, buttonImageDown)

	do
        if GetPointerPressed() = 1
            if menue_buttonHitTest(menueItems[1]) = 1
                exit
            endif
        endif

        Sync()
	loop

	menue_destroyButton(menueItems[1])
	DeleteText(firstScoreText)
	DeleteText(secondScoreText)
	DeleteText(thirdScoreText)
	
endfunction


