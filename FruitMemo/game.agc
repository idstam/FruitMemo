/*
	Johan Idstam 2015-06-15
	Apache License 2.0
	
	This is the code to manage the actual game.
*/

function game_show()
	score as integer
	tiles as integer[4]
	images as integer[8]
	trail as integer[0]
	
	//These four are for testing
	trail.insert(1)
	trail.insert(1)
	trail.insert(1)
	trail.insert(1)
	
	game_init(tiles, images)
	
	
	
	do
		game_playTrail(trail, tiles, images)
        Sync()
        if game_userInput() = 0 then exit
        Sync()
	loop

	game_destroy(tiles, images)
	
endfunction trail.length - 1

function game_userInput()
	do
		if GetPointerPressed() = 1
			
		endif
		Sync()
	loop
endfunction 0

function game_playTrail(trail as integer[], tiles as integer[], images as integer[])
	i as integer
	for i = 1 to trail.length
		SetSpriteImage(tiles[trail[i]], images[trail[i] + 4])
		game_pause(0.7)
		SetSpriteImage(tiles[trail[i]], images[trail[i]])
		game_pause(0.4)
	next i
	
	game_blinkAll(0.5, tiles, images)
	game_blinkAll(0.5, tiles, images)
	game_blinkAll(0.5, tiles, images)
	
endfunction

function game_blinkAll(pause as float, tiles as integer[], images as integer[])
	game_greyAll(tiles, images)
	game_pause(pause)
	game_colorAll(tiles, images)
	game_pause(pause)
endfunction

function game_greyAll(tiles as integer[], images as integer[])
	i as integer
	for i = 1 to tiles.length
	SetSpriteImage(tiles[i], images[i + 4])
	next i
endfunction

function game_colorAll(tiles as integer[], images as integer[])
	i as integer
	for i = 1 to tiles.length
	SetSpriteImage(tiles[i], images[i])
	next i
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

function game_init(tiles ref as integer[], images ref as integer[])
	
	images[1] = LoadImage("apple.png")
	images[2] = LoadImage("banana.png")
	images[3] = LoadImage("orange.png")
	images[4] = LoadImage("strawberry.png")

	images[5] = LoadImage("apple_grey.png")
	images[6] = LoadImage("banana_grey.png")
	images[7] = LoadImage("orange_grey.png")
	images[8] = LoadImage("strawberry_grey.png")
	
	tiles[1] = CreateSprite(images[1])
	SetSpriteSize(tiles[1], 160, -1)
	SetSpritePosition(tiles[1], 0, 0)
	
	tiles[2] = CreateSprite(images[2])
	SetSpriteSize(tiles[2], 160, -1)
	SetSpritePosition(tiles[2], 160, 0)
	
	tiles[3] = CreateSprite(images[3])
	SetSpriteSize(tiles[3], 160, -1)
	SetSpritePosition(tiles[3], 0, 160)
	
	tiles[4] = CreateSprite(images[4])
	SetSpriteSize(tiles[4], 160, -1)
	SetSpritePosition(tiles[4], 160, 160)
	
endfunction tiles

function game_destroy(tiles as integer[], images as integer[])
	i as integer
	
	for i = 1 to tiles.length
		DeleteSprite(tiles[i])
	next i
	
	for i = 1 to images.length
		DeleteImage(images[i])
	next i

endfunction
