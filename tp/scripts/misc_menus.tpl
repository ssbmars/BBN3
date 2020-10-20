@archive 78EA78
@size 27


script 19 mmbn3 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	Are you in the right
	headspace to receive
	information that
	"""
	keyWait
	clearMsg
	"""
	could possibly hurt
	you?
	"""
	keyWait
	clearMsg

	mugshotShow
		mugshot = Sunayama
	"""
	. . .
	"""
	keyWait
	clearMsg
	"""
	Yes.
	"""
	keyWait
	end
}


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
//=============================================================================

//Faster netbattle prompt when talking to Tamako

@archive 745488
@size 255

script 95 mmbn3 {
	mugshotShow
		mugshot = Tamako
	jump
		target = 100
}
script 100 mmbn3 {
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	msgOpen
	"""
	NetBattle with
	Tamako?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Yes "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"No\n"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 101,
			jump = 102,
			jump = continue
		]
	end
}

script 102 mmbn3 {
	mugshotShow
		mugshot = Tamako
	msgOpen
	"""
	!unav 
	"""
	keyWait
	end
}




//=============================================================================
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
//=============================================================================



//change text for Time Trial navi fights

@archive 7B2864
@size 29

script 17 mmbn3 {
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	textSpeed
		delay = 0
	"Take the challenge?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Yes "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"No"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 18,
			jump = 23,
			jump = continue
		]
}


script 20 mmbn3 {
	folderEquip
		folder = 1
	folderSetRegular
		chip = 255
	flagClear
		flag = 131
	flagClear
		flag = 2528
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	"""
	gg
	"""
	keyWait
	end
}


script 22 mmbn3 {
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	textSpeed
		delay = 0
	"""
	Play again?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Yes "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"No"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = continue,
			jump = 23,
			jump = continue
		]
	flagSet
		flag = 2530
	end
}
script 23 mmbn3 {
	flagClear
		flag = 2528
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	textSpeed
		delay = 0
	"Come back any time."
	keyWait
	end
}



//=============================================================================
//=============================================================================

//do a custom message when pressing L

@archive 714794
@size 255


script 248 mmbn3 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	Let's netbattle to
	our heart's content!
	"""
	keyWait
	end
}



@archive 721A68
@size 255


script 222 mmbn3 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	I wish corn on
	the cob was real.
	"""
	keyWait
	end
}




//=============================================================================
//=============================================================================



// Fix "AquaBug" style being written as "Aqua bug"

@archive 711CAC
@size 168


script 166 mmbn3s {
	"AquaBug"
	end
}



