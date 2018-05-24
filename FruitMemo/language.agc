/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage all the text in the application.
*/

Global lang_sprite_en
Global lang_sprite_sv
Global lang_img_en
Global lang_img_sv
Global lang_code

function lang_select()
	lang_code = settings_lang
    if lang_code = 0
        lang_code = lang_show()

        settings_lang = lang_code
        settings_saveSettings()
    endif
    set_texts()
endfunction

function lang_show()
	buttons as BUTTON_BUTTON[2]
	buttons[1] = button_createButton("Svenska", 150, buttonImageUp, buttonImageDown, 50)
	buttons[2] = button_createButton("English", 250, buttonImageUp, buttonImageDown, 50)
	ret as integer
	do
		if GetRawKeyState(27) = 1
			end
		endif
		
        if GetPointerState() = 1
			ret = button_getPressedButton(buttons)
			if ret <> 0
				exitfunction ret
			endif
        endif

        Sync()
	loop

	button_destroyButtons(buttons)


endfunction ret


function lang_getText(idx)
foo as string
res as string 
res = texts[idx]
endfunction res

function set_texts()
DIM texts[20] as String
foo as string
    select lang_code
        case 1:
        texts[0] = "Svenska"
        texts[1] = "Start"
        texts[2] = "Info"
        texts[3] = "Avsluta"
        texts[4] = "Du  fick  ihop"
        texts[5] = "frukter  totalt."
        texts[6] = "Spelet  gjordes  av"
        texts[7] = "Johan  Idstam"
        texts[8] = "Om  du  vill"
        texts[9] = "kontakta  mig"
        texts[10] = "klicka  här"
        texts[11] = "Hur?"
        foo = "Kom  ihåg  spåret|av  frukter  som|det  visas  för  dig.| |Tryck  på  dem  i|samma  ordning.| |Hur  många  kommer|du  ihåg?"
        texts[12] = lang_insertLinebreaks(foo, "|")

        endcase
        case 2:
        texts[0] = "English"
        texts[1] = "Start"
        texts[2] = "Credits"
        texts[3] = "Exit"
        texts[4] = "You  got  at  most"
        texts[5] = "fruits  right."
        texts[6] = "This  game  was  made"
        texts[7] = "by  Johan  Idstam"
        texts[8] = "If  you  want  to"
        texts[9] = "contact  me"
        texts[10] = "press  here"
        texts[11] = "How?"
        foo = "Remember  the  trail|of  fruits  as  they  are|shown  to  you.| |Then  touch  them|in  the  same  order.| |How  many  can  you|remember?"
        texts[12] = lang_insertLinebreaks(foo, "|")
        endcase
    endselect
endfunction

function lang_insertLinebreaks(text$, delim$)
	lines as integer
	l as integer
    lines = CountStringTokens(text$, delim$)
    s as string = "" //str(lines)
    for l = 1 to lines
       s = s + GetStringToken(text$, delim$, l) + chr(13) + chr(10)
    next l
endfunction s

