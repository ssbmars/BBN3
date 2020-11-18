


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


