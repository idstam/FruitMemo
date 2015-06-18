/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the actual game.
*/

function game_show()
	score as integer
	tiles as MENUE_BUTTON[4]
	trail as integer[0]

	//Hide the pineapple since we don't want it och the game screen
	SetSpriteVisible(menueBackgroundSprite, 0)
	
	//Initialize the game tiles and their images
	game_init(tiles)
	
	//These four are for testing
	trail.insert(1)
	trail.insert(1)
	trail.insert(1)
	trail.insert(1)
	
	
	do
		game_playTrail(trail, tiles)
        Sync()
        //If the user fails to remember the trail userInput will return 0
        if game_userInput(tiles) = 0 then exit
        Sync()
	loop

	//Remove all resources needed for the game tiles and images
	game_destroy(tiles)
	
	//Show the pineapple again
	SetSpriteVisible(menueBackgroundSprite, 1)
endfunction trail.length - 1

function game_userInput(tiles as MENUE_BUTTON[])
	pressedTile as MENUE_BUTTON
	do
		if GetPointerState() = 1
			pressedTile = menue_getPressedButton(tiles)
			if pressedTile.Sprite <> 0
				
			endif
		endif
		Sync()
	loop
endfunction 0


function game_playTrail(trail as integer[], tiles as MENUE_BUTTON[])
	i as integer
	for i = 1 to trail.length
		SetSpriteImage(tiles[trail[i]].Sprite, tiles[trail[i]].ImageDown)
		game_pause(0.7)
		SetSpriteImage(tiles[trail[i]].Sprite, tiles[trail[i]].ImageUp)
		game_pause(0.4)
	next i
	
	game_blinkAll(0.5, tiles)
	game_blinkAll(0.5, tiles)
	game_blinkAll(0.5, tiles)
	
endfunction

function game_blinkAll(pause as float, tiles as MENUE_BUTTON[])
	menue_downAll(tiles)
	game_pause(pause)
	menue_upAll(tiles)
	game_pause(pause)
endfunction


function game_pause(p as float)
	i as integer
	t as float
	t = Timer()
	do
		Sync()
		if Timer() - t > p then exit
	loop
	
endfunction

function game_init(tiles ref as MENUE_BUTTON[])
	images as integer[8]

	images[1] = LoadImage("apple_grey.png")
	images[2] = LoadImage("banana_grey.png")
	images[3] = LoadImage("orange_grey.png")
	images[4] = LoadImage("strawberry_grey.png")

	images[5] = LoadImage("apple.png")
	images[6] = LoadImage("banana.png")
	images[7] = LoadImage("orange.png")
	images[8] = LoadImage("strawberry.png")

	
	tiles[1] = game_createTile(images[1], images[5])
	SetSpritePosition(tiles[1].Sprite, 0, 0)
	
	tiles[2] = game_createTile(images[2], images[6])
	SetSpritePosition(tiles[2].Sprite, 160, 0)
	
	tiles[3] = game_createTile(images[3], images[7])
	SetSpritePosition(tiles[3].Sprite, 0, 160)
	
	tiles[4] = game_createTile(images[4], images[8])
	SetSpritePosition(tiles[4].Sprite, 160, 160)
	
endfunction tiles

function game_createTile(imageUp as integer, imageDown as integer)
	tile as MENUE_BUTTON
	tile.Sprite = CreateSprite(imageUp)
	tile.ImageUp = imageUp
	tile.ImageDown = imageDown
	
	SetSpriteSize(tile.Sprite, 160, -1)

endfunction tile
function game_destroy(tiles as MENUE_BUTTON[])
	i as integer
	
	for i = 1 to tiles.length
		DeleteSprite(tiles[i].Sprite)
		if GetImageExists(tiles[i].ImageUp) = 1 then DeleteImage(tiles[i].ImageUp)
		if GetImageExists(tiles[i].ImageDown) = 1 then DeleteImage(tiles[i].ImageDown)
	next i
	
endfunction
