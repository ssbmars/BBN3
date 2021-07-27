


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

//win message
script 113 mmbn3 {
	end
}
//lose message
script 115 mmbn3 {
	end
}

//accept battle
script 117 mmbn3 {
	jump
		target = 109
}


//escape message
@archive 745488
@size 255

script 0 mmbn3 {
	end
}


// fast escape message

@archive 708ACC
@size 51

script 3 mmbn3 {
	checkFlag
		flag = 4714
		jumpIfTrue = 50
		jumpIfFalse = continue
	end
}




//=============================================================================



//change text for Time Trial navi fights

@archive 7B2864
@size 29

script 17 mmbn3 {

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
	msgOpen
	textSpeed
		delay = 0
	"Come back any time."
	keyWait
	end
}


script 1 mmbn3 {
	mugshotShow
		mugshot = FlashMan
	msgOpen
	"""
	A copy of FlashMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 2 mmbn3 {
	mugshotShow
		mugshot = BeastMan
	msgOpen
	"""
	A copy of BeastMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 3 mmbn3 {
	mugshotShow
		mugshot = BubbleMan
	msgOpen
	"""
	A copy of BubbleMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 4 mmbn3 {
	mugshotShow
		mugshot = DesertMan
	msgOpen
	"""
	A copy of DesertMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 5 mmbn3 {
	mugshotShow
		mugshot = PlantMan
	msgOpen
	"""
	A copy of PlantMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 6 mmbn3 {
	mugshotShow
		mugshot = FlameMan
	msgOpen
	"""
	A copy of FlamMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 7 mmbn3 {
	mugshotShow
		mugshot = DrillMan
	msgOpen
	"""
	A copy of DrillMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 8 mmbn3 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"""
	A copy of GutsMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 9 mmbn3 {
	mugshotShow
		mugshot = Tamako
	msgOpen
	"""
	A copy of MetalMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 10 mmbn3 {
	mugshotShow
		mugshot = Tora
	msgOpen
	"""
	A copy of KingMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 11 mmbn3 {
	checkFlag
		flag = 4702
		jumpIfTrue = 28
		jumpIfFalse = continue
	mugshotShow
		mugshot = MistMan
	msgOpen
	"""
	A copy of MistMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 12 mmbn3 {
	mugshotShow
		mugshot = DarkMan
	msgOpen
	"""
	A copy of DarkMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 13 mmbn3 {
	mugshotShow
		mugshot = JapanMan
	msgOpen
	"""
	A copy of JapanMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}

//	the protoman fight is replaced with bass
script 14 mmbn3 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"""
	A copy of Bass
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}

script 28 mmbn3 {
	mugshotShow
		mugshot = BowlMan
	msgOpen
	"""
	A copy of BowlMan
	is available for a
	timed battle!
	"""
	keyWait
	clearMsg
	jump
		target = 17
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


