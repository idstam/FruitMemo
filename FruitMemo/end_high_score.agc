
/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the new high score screen of the application.
*/

function nhs_show()
	//losingPosition, totalLength //(These are globals)
	x as integer
	y as integer
	buttonTopStart as integer
	firstScoreText as integer
	secondScoreText as integer
	thirdScoreText as integer
	textSize as integer = 45
	textSpacing as integer = -5
	pos as integer
	menueItems as BUTTON_BUTTON[1]
	buttonTopStart = 250
	
	firstScoreText = CreateText(lang_getText(4))
	SetTextVisible(firstScoreText, 1)
	SetTextSize(firstScoreText, textSize)
	SetTextSpacing(firstScoreText, textSpacing)
	
	pos = 160 - (GetTextTotalWidth(firstScoreText) / 2)
	SetTextPosition(firstScoreText, pos, 40)
	
	secondScoreText = CreateText( str(totalLength) )
	SetTextVisible(secondScoreText, 1)
	SetTextSize(secondScoreText, textSize * 1.3)
	SetTextSpacing(secondScoreText, textSpacing)
	pos = 160 - (GetTextTotalWidth(secondScoreText) / 2)
	SetTextPosition(secondScoreText, pos, 100)
	
	
	thirdScoreText = CreateText(lang_getText(5))
	SetTextVisible(thirdScoreText, 1)
	SetTextSize(thirdScoreText, textSize)
	SetTextSpacing(thirdScoreText, textSpacing)
	pos = 160 - (GetTextTotalWidth(thirdScoreText) / 2)
	SetTextPosition(thirdScoreText, pos, 160)
	
	CreateAdvertEx(0, 1, 2, settings_testAd, 10, 0)
	SetAdvertVisible(1)
	
	menueItems[1] = button_createButton(lang_getText(1), buttonTopStart, buttonImageUp, buttonImageDown, 50)

	do
		if GetRawKeyState(27) = 1
			exit
		endif
		
        if GetPointerState() = 1
            if button_buttonHitTest(menueItems[1]) = 1
                exit
            endif
        endif

        Sync()
	loop

	do 
		if GetPointerState() = 0 and GetRawKeyState(27) = 0 then exit
		Sync()
	loop
	
	DeleteAdvert()
	button_destroyButton(menueItems[1])
	DeleteText(firstScoreText)
	DeleteText(secondScoreText)
	DeleteText(thirdScoreText)
	
endfunction


