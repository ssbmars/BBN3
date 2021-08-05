

//		Comm Menu

@archive 7E7618
@size 170


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
	¡Alcanzamos el
	límite para
	este chip!
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
	"Estado actual\n"
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
	"Estado actual\n"
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
	"Estado actual\n"
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

// fix spacing

script 54 mmbn3s {
	"Speed  LV"
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}


