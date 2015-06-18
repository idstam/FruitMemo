
/*
	Menue state
	0 - Application started
	1 - Game started
	2 - Game ended new high score
	3 - Game ended no high score
	4 - Show credits
*/
global menueState as integer
Global buttonImageUp
Global buttonImageDown
Global blendPineappleImage
Global menueBackgroundSprite

TYPE MENUE_BUTTON
    Sprite as Integer
    Label  as String
    Text   as Integer
    ImageUp as integer
    ImageDown as integer
ENDTYPE

//Initialize some stuff that will be needed throughout the application
function menue_init()
	menueState = 0
	buttonImageUp = LoadImage("buttonUp.png")
	buttonImageDown = LoadImage("buttonDown.png")
	blendPineappleImage = LoadImage("pale_pineapple.png")
	menueBackgroundSprite = CreateSprite(blendPineappleImage)
	SetSpriteSize(menueBackgroundSprite, screenWidth, screenHeight)
endfunction

//Use this function from anywhere to create a button with text
function menue_createButton(label as string, y as float, imageUp as integer, imageDown as integer)
	buttonLeft as integer
	textLeft as integer
	buttonLeft = 56
	
	ret as MENUE_BUTTON
	ret.Label = label
	ret.Text = CreateText(label)
	ret.Sprite = CreateSprite(imageUp)
	ret.ImageUp = imageUp
	ret.ImageDown = imageDown
	
	AddSpriteAnimationFrame(ret.Sprite, ret.ImageUp)
	AddSpriteAnimationFrame(ret.Sprite, ret.ImageDown)
	SetSpriteFrame(ret.Sprite, 1)
	SetSpritePosition(ret.Sprite, buttonLeft, y)
	SetTextSize(ret.Text, 25)
	textLeft = GetTextTotalWidth(ret.Text) / 2
	textLeft = 100 - textLeft
	SetTextPosition(ret.Text, buttonLeft + textLeft, y + 20)
	SetTextVisible(ret.Text, 1)
	
endfunction ret

//Use this function from anywhere to unload a previously used button
function menue_destroyButton(button as MENUE_BUTTON)
	SetSpriteVisible(button.Sprite, 0)
	SetTextVisible(button.Text, 0)
	DeleteText(button.Text)
	DeleteSprite(button.Sprite)
endfunction


function menue_buttonHitTest(button as MENUE_BUTTON)
	ret as integer
	x as integer
	y as integer

	//Check if the button is touched
	ret = 0
	
	x = ScreenToWorldX(GetPointerX())
	y = ScreenToWorldY(GetPointerY())
	if GetSpriteHitTest(button.Sprite, x, y) = 1 then ret = 1
	if GetTextHitTest(button.Text, x, y) = 1 then ret = 1
	if ret = 1 
		menue_downButton(button)
	endif
	Sync()
	
	do
		Sync()
		if GetPointerState() = 0 THEN exit
	loop
	
	menue_upButton(button)
endfunction ret

function menue_getPressedButton(buttons as MENUE_BUTTON[])
	i as integer
	noButton as MENUE_BUTTON
	
	for i = 1 to 4
		if menue_buttonHitTest(buttons[i]) = 1 
			exitfunction buttons[i]
		endif
	next i
	
endfunction noButton


function menue_upAll(tiles as MENUE_BUTTON[])
	i as integer
	for i = 1 to tiles.length
		menue_upButton(tiles[i])
	next i
endfunction

function menue_upButton(tile as MENUE_BUTTON)
	SetSpriteImage(tile.Sprite, tile.ImageUp)
endfunction


function menue_downAll(tiles as MENUE_BUTTON[])
	i as integer
	for i = 1 to tiles.length
		menue_downButton(tiles[i])
	next i
endfunction

function menue_downButton(tile as MENUE_BUTTON)
	SetSpriteImage(tile.Sprite, tile.ImageDown)
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
