
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
		frames = 16
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

//"equipped xtrafolder" text
@archive 7EAEB0
@size 27

script 10 mmbn3s {
	"BBBBBBBBBBBBB"
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




//=============================================================================


//	Fix typos in story dialog

@archive 787160
@size 19

script 10 mmbn3 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	Extraordinary! No
	wonder they're
	all saying you'll
	"""
	keyWait
	clearMsg
	"""
	win tomorrow's Grand
	Prix! Thank you for
	saving us!
	"""
	keyWait
	clearMsg
	"""
	Would you mind if we
	interviewed you?
	"""
	keyWait
	clearMsg
	jump
		target = 11
}


//=============================================================================

//give the player deltaray before battling alpha

@archive 759A10
@size 255

script 0 mmbn3 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	Lan⋯You have to save
	the world⋯
	"""
	keyWait
	clearMsg
	
	checkFlag
		flag = 888
		jumpifTrue = continue
		jumpIfFalse = 1
	"""
	We can see which of
	us is the best after
	this is all over⋯
	"""
	keyWait
	clearMsg
	"At Hades Isle⋯"
	keyWait
	clearMsg
	end
}

script 1 mmbn3 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	flagSet
		flag = 888
	"."
	waitSkip
		frames = 15
	"."
	waitSkip
		frames = 15
	"."
	waitSkip
		frames = 15
	"Here⋯"
	waitSkip
		frames = 15
	keyWait
	clearMsg
	"""
	Use this⋯
	"""
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 302
		code = Z
		amount = 1
	"""
	Lan got a chip for
	"
	"""
	printChip
		buffer = 0
		chip = 302
	" "
	printCode
		buffer = 0
		code = Z
	"\"!!"
	wait
		frames = 35
	keyWait
	clearMsg
	playerFinish
	playerUnlock
	playerReset
	mugshotShow
		mugshot = Chaud
	"""
	We can see which of
	us is the best after
	this is all over⋯
	"""
	keyWait
	clearMsg
	"At Hades Isle⋯"
	keyWait
	clearMsg
	end
}


//=============================================================================

//	time trial reward
//	grant both version gigas
@archive 7B2864
@size 29

script 27 mmbn3 {
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	"""
	You now hold every
	record! Here! A
	gift from Serenade!
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 309
		code = A
		amount = 1
	mugshotHide
	"""
	MegaMan got a chip
	for
	"
	"""
	printChip
		buffer = 0
		chip = 309
	" "
	printCode
		buffer = 0
		code = A
	"\"!!"
	keyWait
	clearMsg
	itemGiveChip
		chip = 307
		code = A
		amount = 1
	"""
	MegaMan got a chip
	for
	"
	"""
	printChip
		buffer = 0
		chip = 307
	" "
	printCode
		buffer = 0
		code = S
	"\"!!"
	keyWait
	clearMsg
	playerFinish
	playerReset
	clearMsg
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	"""
	Timed battles are
	available any time!
	"""
	keyWait
	end
}
