
/*
	Menue state
	0 - Application started
	1 - Game started
	2 - Game ended new high score
	3 - Game ended no high score
	4 - Show credits
*/
global menueState as integer



function menue_showMenue()
	select menueState
	case 0 //- Application started
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
