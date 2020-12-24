

//		Comm Menu

@archive 7E7618
@size 170



script 105 mmbn3s {
	"   preview 4.1"

	end
}


//=============================================================================

//Dialog when you try to add more than the allowed amount of copies of a chip to your folder

script 14 mmbn3 {
	positionText
		left = 11
		top = 1
	positionBox
		top = 6
	positionMugshot
		left = 4
	positionArrow
		left = 192
		top = 92
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	We've reached
	the limit for
	this chip!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}




//=============================================================================

//The menu options for entering the navicust or changing styles

script 50 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"Current status\n"
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"NaviCust\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Style Change"
	select
		default = 0
		disableB = true
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}


script 51 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"Current status\n"
	space
		count = 2
	"NaviCust\n"
	space
		count = 2
	"Style Change"
	wait
		frames = 0
	waitHold
}


script 52 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"Current status\n"
	space
		count = 2
	"NaviCust\n"
	space
		count = 2
	"Style Change"
	wait
		frames = 0
	waitHold
}




//=============================================================================


//nothing in this section is used currently. 
//It's planned to eventually be a more streamlined version of the comm menu. 


 /* 

script 90 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Let's save
	first!
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"No "
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
		clear = false
		targets = [
			jump = 93,
			jump = 93,
			jump = continue
		]
	waitHold
}
script 91 mmbn3 {
	checkFlag
		flag = 4710
		jumpIfTrue = continue
		jumpIfFalse = 92
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	clearMsg
	"""
	OK to erase
	old save data?
	
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
		clear = false
		targets = [
			jump = 92,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 92 mmbn3 {
	save
		jumpIfSuccessful = 93
		jumpIfFailed = continue
		jumpUnused = 156
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	clearMsg
	"""
	The save
	failed⋯
	"""
	keyWait
	clearMsg
	"Try again?\n"
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
		clear = false
		targets = [
			jump = 67,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 93 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	clearMsg
	"""
	NetBattle with
	a friend!
	"""
	wait
		frames = 0
	waitHold
}
script 94 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	NetBattle with
	a friend!
	"""
	waitHold





}
script 95 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Trade data
	library info!
	"""
	waitHold
}


script 96 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Trade Battle
	Chips!
	"""
	waitHold
}


script 97 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Trade
	programs!
	"""
	waitHold
}


script 98 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	NetBattle on a
	normal field!
	"""
	waitHold
}


script 99 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	NetBattle on
	interesting terrain!
	"""
	waitHold
}


script 100 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	NetBattle on
	dangerous terrain!
	"""
	waitHold
}


script 101 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Play a best
	of 3 set!
	"""
	waitHold
}


script 102 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	NetBattle
	with a friend!
	"""
	waitHold
}


script 103 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Battle with a
	friend! Loser
	loses a chip!
	"""
	waitHold
}


script 104 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Tournament!
	Can you win 69
	times in a row?
	"""
	waitHold
}


script 106 mmbn3s {
	"   Record\n   "
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	"/W"
	printBuffer
		buffer = 1
		minLength = 3
		padZeros = false
		padLeft = true
	"\n"
	end
}

script 107 mmbn3s {
	"NetBattle"
	end
}
script 108 mmbn3s {
	"See Library"
	end
}
script 109 mmbn3s {
	"Trade chips"
	end
}
script 110 mmbn3s {
	"Trade prgrm"
	end
}
script 111 mmbn3s {
	"Lightweight"
	end
}
script 112 mmbn3s {
	"Midweight"
	end
}
script 113 mmbn3s {
	"Heavyweight"
	end
}
script 114 mmbn3s {
	"Tri-Battle"
	end
}
script 115 mmbn3s {
	"Practice"
	end
}
script 116 mmbn3s {
	"Real"
	end
}
script 117 mmbn3s {
	"Tournament"
	end
}
script 118 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Communication
	error! Please
	try again
	"""
	keyWait
	waitHold
}
script 119 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Communication
	error! Battle
	cancelled
	"""
	keyWait
	waitHold
}
script 120 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	No chip to
	give up
	if you lose!
	"""
	keyWait
	waitHold
}
script 121 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Your friend
	isn't ready!
	Please wait!
	"""
	waitHold
}
script 122 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Choose the
	same mode as
	your friend!
	"""
	keyWait
	waitHold
}
script 123 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	No connection!
	Refresh?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 125 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Great job,
	Lan! We won!
	"""
	keyWait
	waitHold
}
script 126 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	Too bad,Lan!
	We lost!
	"""
	keyWait
	waitHold
}
script 127 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	That was
	close! A tie!
	"""
	keyWait
	waitHold
}
script 128 mmbn3 {
	positionText
		left = 8
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"That makes "
	printBuffer
		minLength = 1
		padZeros = false
		padLeft = false
		buffer = 1
	"\nwins! Again?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 129 mmbn3 {
	positionText
		left = 8
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 218
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	color
		palette = 3
	"""
	OK! Let's
	NetBattle!
	"""
	waitHold
}


 */ 

