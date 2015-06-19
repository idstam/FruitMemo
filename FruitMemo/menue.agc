
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
Global pineappleImage
Global menueBackgroundSprite

TYPE BUTTON_BUTTON
    Sprite as Integer
    Label  as String
    Text   as Integer
    ImageUp as integer
    ImageDown as integer
ENDTYPE

//Initialize some stuff that will be needed throughout the application
function button_init()
	menueState = 0
	buttonImageUp = LoadImage("buttonUp.png")
	buttonImageDown = LoadImage("buttonDown.png")
	pineappleImage = LoadImage("pineapple.png")
	menueBackgroundSprite = CreateSprite(pineappleImage)
	SetSpriteSize(menueBackgroundSprite, screenWidth, screenHeight)
endfunction

//Use this function from anywhere to create a button with text
function button_createButton(label as string, y as float, imageUp as integer, imageDown as integer, textSize as integer)
	buttonLeft as integer
	textLeft as integer
	buttonLeft = 56
	
	ret as button_BUTTON
	ret.Label = label
	ret.Text = CreateText(label)
	ret.Sprite = CreateSprite(imageUp)
	ret.ImageUp = imageUp
	ret.ImageDown = imageDown
	
	AddSpriteAnimationFrame(ret.Sprite, ret.ImageUp)
	AddSpriteAnimationFrame(ret.Sprite, ret.ImageDown)
	SetSpriteFrame(ret.Sprite, 1)
	SetSpritePosition(ret.Sprite, buttonLeft, y)
	SetTextSize(ret.Text, textSize)
	SetTextSpacing(ret.Text, -5)
	textLeft = GetTextTotalWidth(ret.Text) / 2
	textLeft = 100 - textLeft
	
	midSpriteY as float
	midSpriteY = GetSpriteHeight(ret.Sprite) / 2
	midTextY as float
	midTextY = GetTextTotalHeight(ret.Text) / 2
	
	SetTextPosition(ret.Text, buttonLeft + textLeft, y + midSpriteY - midTextY)
	SetTextVisible(ret.Text, 1)
	
endfunction ret

//Use this function from anywhere to unload a previously used button
function button_destroyButton(button as button_BUTTON)
	SetSpriteVisible(button.Sprite, 0)
	SetTextVisible(button.Text, 0)
	DeleteText(button.Text)
	DeleteSprite(button.Sprite)	
endfunction

function button_destroyButtons(buttons as button_BUTTON[])
	i as integer
	for i = 1 to buttons.length
		button_destroyButton(buttons[i])
	next i
endfunction


function button_buttonHitTest(button as button_BUTTON)
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
		button_downButton(button)		
		do
			Sync()
			if GetPointerState() = 0 THEN exit
		loop
		button_pause(0.2)
		button_upButton(button)
	endif	
endfunction ret

function button_pause(p as float)
	i as integer
	t as float
	t = Timer()
	do
		Sync()
		if Timer() - t > p then exit
	loop
	
endfunction

function button_getPressedButton(buttons as button_BUTTON[])
	i as integer
	
	for i = 1 to 4
		if button_buttonHitTest(buttons[i]) = 1 
			exitfunction i
		endif
	next i
	
endfunction 0


function button_upAll(tiles as button_BUTTON[])
	i as integer
	for i = 1 to tiles.length
		button_upButton(tiles[i])
	next i
endfunction

function button_upButton(tile as button_BUTTON)
	SetSpriteImage(tile.Sprite, tile.ImageUp)
endfunction


function button_downAll(tiles as button_BUTTON[])
	i as integer
	for i = 1 to tiles.length
		button_downButton(tiles[i])
	next i
endfunction

function button_downButton(tile as button_BUTTON)
	SetSpriteImage(tile.Sprite, tile.ImageDown)
endfunction


function button_createCenterScreenText(txt as string, size as integer, y as float)
	
	x as integer
	m as integer
	t as integer
	m = GetVirtualWidth() / 2
	t = CreateText(txt)
	SetTextSpacing(t, -5)
	SetTextSize(t, size)
	x = m - (GetTextTotalWidth(t) / 2)
	SetTextPosition(t, x, y)
	
endfunction t

function button_deleteTexts(t as integer[])
	i as integer
	for i = 1 to t.length
		DeleteText(t[i])
	next i
endfunction

function button_sync()
endfunction
