/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage all the text in the application.
*/

Global lang_sprite_en
Global lang_sprite_sv
Global lang_img_en
Global lang_img_sv
Global lang

function lang_select()
	lang = 2
	
    if lang = 0
        init_lang_menu()
        lang_loop()
        delete_lang_menu()
        //save_settings()
    endif
    set_texts()
endfunction

function lang_loop()
	x as integer
	y as integer
	
    while lang = 0
        if GetPointerPressed() = 1
             x = ScreenToWorldX(GetPointerX())
            y = ScreenToWorldY(GetPointerY())
            if GetSpriteHitTest(lang_sprite_sv, x, y) = 1 then lang = 1
            if GetSpriteHitTest(lang_sprite_en, x, y) = 1 then lang = 2
        endif

        sync()
    endwhile
endfunction

function init_lang_menu()
    lang_img_en = LoadImage("btn_lang_en.png")
    lang_img_sv = LoadImage("btn_lang_sv.png")
    lang_sprite_en = CreateSprite( lang_img_en )
    lang_sprite_sv = CreateSprite( lang_img_sv )
    SetSpritePosition(lang_sprite_en, 60, 100)
    SetSpritePosition(lang_sprite_sv, 60, 160)
endfunction

function delete_lang_menu()
    DeleteSprite(lang_sprite_en)
    DeleteSprite(lang_sprite_sv)
    DeleteImage(lang_sprite_en)
    DeleteImage(lang_sprite_sv)
endfunction

function lang_getText(idx)
res as string 
res = texts[idx]
endfunction res

function set_texts()
DIM texts[11] as String
foo as string
    select lang
        case 1:
        texts[0] = "Svenska"
        texts[1] = "Start"
        texts[2] = "Info"
        texts[3] = "Avsluta"
        texts[4] = "Du fick ihop"
        texts[5] = "frukter."
        texts[6] = "Spelet gjordes av"
        texts[7] = "johan@jsi.se"
        texts[8] = "Om du vill"
        texts[9] = "kontakta mig"
        texts[10] = "klicka här"
        
        endcase
        case 2:
        texts[0] = "English"
        texts[1] = "Start"
        texts[2] = "Credits"
        texts[3] = "Exit"
        texts[4] = "You got"
        texts[5] = "fruits right."
        texts[6] = "This game is made by"
        texts[7] = "johan@jsi.se"
        texts[8] = "If you want to"
        texts[9] = "contact me"
        texts[10] = "press here"
        endcase
    endselect
endfunction

function insert_linebreaks(text$, delim$)
	lines as integer
	l as integer
    lines = CountStringTokens(text$, delim$)
    s as string = "" //str(lines)
    for l = 1 to lines
       s = s + GetStringToken(text$, delim$, l) + chr(13) + chr(10)
    next l
endfunction s

