/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the actual game.
*/

Global losingPosition as integer
Global totalLength as integer

function game_show()
	score as integer
	tiles as button_BUTTON[4]
	tileIndex as integer
	trail as integer[0]
	trailPos as integer
	endGame as integer
	
	//Hide the pineapple since we don't want it och the game screen
	SetSpriteVisible(menueBackgroundSprite, 0)
	
	//Initialize the game tiles and their images
	game_init(tiles)
	
	
	endGame = -1
	do
		//Add a fruit to the trail
		trail.insert(Random(1, 4))
		
		//Show the current trail
		if game_playTrail(trail, tiles) = 0
				
			Sync()
			
			//Loop through the trail and wait for user input at every iteration
			for trailPos = 1 to trail.length
				//Wait for the user to press a tile
				tileIndex =  game_waitForUserInput(tiles)
				
				if tileIndex = -1
					endgame = -2
					exit
				endif
					
				//If the pressed tile is not the expected one, exit the game
				if tileIndex <> trail[trailPos]
					//I keep track of where the user lost it for future reference
					//Currently I will only show the length of the trail before the failing round
					endGame = trailPos -1
					exit
				endif
				button_pause(0.5)
				Sync()
			next trailPos
		else
			endgame = -2
        endif
        // a loosing move
        if endGame <> -1 then exit
        
        Sync()
	loop

	//Remove all resources needed for the game tiles and images
	game_destroy(tiles)
	
	//Show the pineapple again
	SetSpriteVisible(menueBackgroundSprite, 1)
	
	losingPosition = endGame
	totalLength = trail.length - 1 //since we got here by failing, the longest successful trail was the last one
	
endfunction trail.length - 1

function game_waitForUserInput(tiles as button_BUTTON[])
	tileIndex as integer
	do
		if GetRawKeyState(27) = 1 then exitfunction -1
		
		if GetPointerState() = 1
			tileIndex = button_getPressedButton(tiles)
			exitfunction tileIndex
		endif
		Sync()
	loop
endfunction 0


function game_playTrail(trail as integer[], tiles as button_BUTTON[])
	ret as integer = 0
	i as integer
	for i = 1 to trail.length
		SetSpriteImage(tiles[trail[i]].Sprite, tiles[trail[i]].ImageDown)
		button_pause(0.6)
		SetSpriteImage(tiles[trail[i]].Sprite, tiles[trail[i]].ImageUp)
		button_pause(0.4)
		
		if GetRawKeyState(27) = 1 
			 exitfunction -1
		endif
		
		Sync()
	next i
	
	game_blinkAll(0.5, tiles)
	//game_blinkAll(0.5, tiles)
	//game_blinkAll(0.5, tiles)
	
endfunction 0

function game_blinkAll(pause as float, tiles as button_BUTTON[])
	button_downAll(tiles)
	button_pause(pause)
	button_upAll(tiles)
	button_pause(pause)
endfunction

function game_init(tiles ref as button_BUTTON[])
	//Reset score from previous round
	losingPosition = 0
	totalLength = 0

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
	tile as button_BUTTON
	tile.Sprite = CreateSprite(imageUp)
	tile.ImageUp = imageUp
	tile.ImageDown = imageDown
	
	SetSpriteSize(tile.Sprite, 160, -1)

endfunction tile
function game_destroy(tiles as button_BUTTON[])
	i as integer
	
	for i = 1 to tiles.length
		DeleteSprite(tiles[i].Sprite)
		if GetImageExists(tiles[i].ImageUp) = 1 then DeleteImage(tiles[i].ImageUp)
		if GetImageExists(tiles[i].ImageDown) = 1 then DeleteImage(tiles[i].ImageDown)
	next i
	button_destroyButtons(tiles)
endfunction
