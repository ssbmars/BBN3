
//NetGhost's easter egg

@archive 7771CC
@size 255

script 2 mmbn3 {
	mugshotShow
		mugshot = CloakedNavi
	msgOpen
	textspeed
		delay = 10
	textDisableSkip
	"""
	. . .
	"""
	wait
		frames = 8
	clearMsg
	"""
	F... L... A... S...
	"""
	wait
		frames = 8
	clearMsg
	textspeed
		delay = 2
	"""
	That's the only clue
	you will need to find
	.
	"""
	textspeed
		delay = 8
	"""
	 . .
	"""
	wait
		frames = 8
	clearMsg
	textspeed
		delay = 2
	"""
	a Ghost in the 
	network
	"""
	textspeed
		delay = 10
	". . ."
	textEnableSkip
	keywait
	end
}



//=============================================================================


//	EXTRAFOLDER NAMES

//replace XtraFldr

//"equipped <folder> text"
@archive 7EAEB0
@size 27

script 10 mmbn3s {
	"BBBBBBBBBBBBBBBBBBB"
	end
}
//folder name as it appears on the tab
script 26 mmbn3s {
	"BBBBBN3"
	end
}

//=============================================================================


@archive 7EB974
@size 29

//ERROR message when you can't fix it

script 0 mmbn3s {
	"""
	TOO MANY
	ERRORS!
	"""
	end
}



//=============================================================================



// Fix "AquaBug" style being written as "Aqua bug"

@archive 711CAC
@size 168


script 166 mmbn3s {
	"AquaBug"
	end
}



