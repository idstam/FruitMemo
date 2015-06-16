
/*
	Menue state
	0 - Application started
	1 - Game started
	2 - Game ended new high score
	3 - Game ended no high score
	4 - Show credits
*/
global menueState as integer
Global buttonImage
Global blendPineappleImage
Global menueBackgroundSprite

TYPE MENUE_ITEM
    Sprite as Integer
    Label  as String
    Text   as Integer
ENDTYPE

//Initialize some stuff that will be needed throughout the application
function menue_init()
	menueState = 0
	buttonImage = LoadImage("button.png")
	blendPineappleImage = LoadImage("pale_pineapple.png")
	menueBackgroundSprite = CreateSprite(blendPineappleImage)
	SetSpriteSize(menueBackgroundSprite, screenWidth, screenHeight)
endfunction

//Use this function from anywhere to create a button with text
function menue_createButton(label as string, y as float)
	buttonLeft as integer
	textLeft as integer
	buttonLeft = 56
	
	ret as MENUE_ITEM
	ret.Label = label
	ret.Text = CreateText(label)
	ret.Sprite = CreateSprite(buttonImage)
	SetSpritePosition(ret.Sprite, buttonLeft, y)
	SetTextSize(ret.Text, 25)
	textLeft = GetTextTotalWidth(ret.Text) / 2
	textLeft = 100 - textLeft
	SetTextPosition(ret.Text, buttonLeft + textLeft, y + 20)
	SetTextVisible(ret.Text, 1)
	
endfunction ret

//Use this function from anywhere to unload a previously used button
function menue_destroyButton(button as MENUE_ITEM)
	SetSpriteVisible(button.Sprite, 0)
	SetTextVisible(button.Text, 0)
	DeleteText(button.Text)
	DeleteSprite(button.Sprite)
endfunction


function menue_buttonHitTest(button as MENUE_ITEM)
	ret as integer
	x as integer
	y as integer

	//Check if the button is touched
	ret = 0
	if GetPointerPressed() = 1
		x = ScreenToWorldX(GetPointerX())
		y = ScreenToWorldY(GetPointerY())
		if GetSpriteHitTest(button.Sprite, x, y) = 1 then ret = 1
		if GetTextHitTest(button.Text, x, y) = 1 then ret = 1
	endif
	
endfunction ret
//This is a dispacher function that helps in showing the right screen
//I'm nt really sure I will keep this since it makes this file application specific.
//I'd rather keep on using this without modofication i future applications.
function menue_showMenue()
	select menueState
	case 0 //- Application started
		start_show()
	endcase
	
	case 1 //- Game started
	endcase
	
	case 2 //- Game ended new high score
	endcase
	
	case 3 //- Game ended no high score
	endcase
	
	case 4 //- Show credits
	endcase
		
	endselect
endfunction

function menue_createCenterScreenText(txt as string, size as integer, y as float)
	
	x as integer
	m as integer
	t as integer
	m = GetVirtualWidth() / 2
	t = CreateText(txt)
	SetTextSize(t, size)
	x = m - (GetTextTotalWidth(t) / 2)
	SetTextPosition(t, x, y)
	
endfunction t

function menue_deleteTexts(t as integer[])
	i as integer
	for i = 1 to t.length
		DeleteText(t[i])
	next i
endfunction
