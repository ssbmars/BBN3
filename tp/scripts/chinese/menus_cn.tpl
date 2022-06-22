@archive 7E7618
@size 170

script 0 mmbn3 {
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
	"Do what?\n"
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"Edit folder\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Use folder"
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
script 1 mmbn3 {
	checkFlag
		flag = 131
		jumpIfTrue = 6
		jumpIfFalse = continue
	positionText
		left = 11
		top = 2
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
	"Equipped\n"
	printFolderName
		buffer = 1
		entry = 0
	" !"
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 2 mmbn3 {
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
	Too many
	GigaChips!
	Change them!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 3 mmbn3 {
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
	Too many
	MegaChips!
	Change them!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 4 mmbn3 {
	positionText
		left = 11
		top = 2
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
	Gotta equip
	a chip folder!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 5 mmbn3 {
	positionText
		left = 11
		top = 2
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
	"Do what?\n"
	option
		left = 0
		right = 0
		up = 0
		down = 0
	space
		count = 2
	"Use folder"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue
		]
	waitHold
}
script 6 mmbn3 {
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
	Can't use the
	Extra Folder!
	It's locked!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 11 mmbn3s {
	"Pack"
	end
}
script 13 mmbn3 {
	positionText
		left = 11
		top = 2
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
	You don't have
	30 chips yet!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
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
	You can only
	use 4 of the
	same chip!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 15 mmbn3 {
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
	You can only
	use 
	"""
	printBuffer
		minLength = 1
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	 of the
	same GigaChip!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 16 mmbn3 {
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
	You can only
	use 
	"""
	printBuffer
		minLength = 1
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	 same
	MegaChips!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 17 mmbn3 {
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
	You can only
	use 
	"""
	printBuffer
		minLength = 1
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	 total
	GigaChips!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 18 mmbn3 {
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
	You can only
	use 
	"""
	printBuffer
		minLength = 1
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	 total
	MegaChips!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 19 mmbn3 {
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
	You don't have
	the capacity
	for that!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 20 mmbn3 {
	positionText
		left = 14
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
	You've got
	new mail!
	"""
	waitHold
}
script 21 mmbn3 {
	positionText
		left = 14
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
	Read which
	mail?
	"""
	waitHold
}
script 22 mmbn3 {
	positionText
		left = 11
		top = 2
	positionBox
		top = 6
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
	"No new mail⋯"
	waitHold
}
script 24 mmbn3 {
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
	OK to use
	"
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"\"?\n"
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
		default = 1
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 25 mmbn3 {
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
	Only non-
	elemental
	effects work!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 26 mmbn3 {
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
	Only a Wood
	effect will
	work!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 27 mmbn3 {
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
	Only an Aqua
	effect will
	work!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 28 mmbn3 {
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
	Only an Elec
	effect will
	work!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 29 mmbn3 {
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
	Only a Fire
	effect will
	burn it!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 30 mmbn3s {
	"   ??"
	end
}
script 31 mmbn3s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	end
}
script 34 mmbn3s {
	"StdrdChip"
	end
}
script 35 mmbn3s {
	"MegaChip"
	end
}
script 36 mmbn3s {
	"GigaChip"
	end
}
script 37 mmbn3s {
	"P.A.notes"
	end
}
script 40 mmbn3s {
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 41 mmbn3 {
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
	textSpeed
		delay = 0
	"""
	Cancel program
	and return?
	
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
script 42 mmbn3s {
	"RUN⋯"
	end
}
script 43 mmbn3s {
	"OK!"
	end
}
script 44 mmbn3 {
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
		mugshot = Lan
	color
		palette = 3
	textSpeed
		delay = 0
	"""
	RUN complete!
	How do you
	feel,MegaMan?
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 88
		jumpIfTrue = 46
		jumpIfFalse = 45
}
script 45 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	textSpeed
		delay = 0
	"""
	Great!
	Good job,Lan!
	"""
	keyWait
	clearMsg
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
	"""
	Quit the Navi
	Customizer?
	
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
script 46 mmbn3 {
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
	color
		palette = 3
	textSpeed
		delay = 0
	"""
	Hmmm⋯A little
	strange,but
	I'm OK!
	"""
	keyWait
	clearMsg
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
	"""
	Quit the Navi
	Customizer?
	
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
script 47 mmbn3s {
	"*"
	end
}
script 48 mmbn3 {
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
	"Current status"
	waitHold
}
script 49 mmbn3 {
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
	"Current status\n"
	option
		left = 0
		right = 0
		up = 0
		down = 0
	space
		count = 2
	"NaviCust"
	select
		default = 0
		disableB = true
		clear = false
		targets = [
			jump = continue,
			jump = continue
		]
	waitHold
}
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
	printItem
		buffer = 1
		item = 0
	" Style"
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
	"Returned to\n"
	printItem
		buffer = 0
		item = 128
	"!"
	keyWait
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
	"Equipped "
	printItem
		buffer = 1
		item = 0
	"!"
	keyWait
	waitHold
}
script 53 mmbn3s {
	"Attack LV"
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 54 mmbn3s {
	"Speed  LV"
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 55 mmbn3s {
	"Charge LV"
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 56 mmbn3s {
	"Pwr ElecLV"
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 57 mmbn3s {
	"Pwr HeatLV"
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 58 mmbn3s {
	"Pwr AquaLV"
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 59 mmbn3s {
	"Pwr WoodLV"
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 60 mmbn3s {
	"Pwr Invis"
	end
}
script 61 mmbn3s {
	"Pwr ChargeS"
	end
}
script 62 mmbn3s {
	"RegChip "
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	"[MB]"
	end
}
script 63 mmbn3s {
	"MegaChip "
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 64 mmbn3s {
	"GigaChip "
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 65 mmbn3 {
	positionText
		left = 10
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 200
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
	Save your
	game?
	
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
			jump = 66,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 66 mmbn3 {
	checkFlag
		flag = 4710
		jumpIfTrue = continue
		jumpIfFalse = 67
	positionText
		left = 10
		top = 1
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 200
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
			jump = 67,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 67 mmbn3 {
	save
		jumpIfSuccessful = 68
		jumpIfFailed = continue
		jumpUnused = 155
	positionText
		left = 10
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 200
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
script 68 mmbn3 {
	positionText
		left = 10
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 200
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
	OK! Your save
	is complete!
	"""
	keyWait
	waitHold
}
script 69 mmbn3s {
	"Play Time"
	end
}
script 70 mmbn3s {
	"Library"
	end
}
script 71 mmbn3s {
	"BtlChips"
	end
}
script 72 mmbn3s {
	"Credits"
	end
}
script 73 mmbn3s {
	"  "
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = true
		padLeft = true
	":"
	printBuffer
		buffer = 1
		minLength = 2
		padZeros = true
		padLeft = true
	end
}
script 74 mmbn3s {
	"S/M/G"
	end
}
script 75 mmbn3s {
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 76 mmbn3s {
	" "
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	end
}
script 77 mmbn3s {
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	"z"
	end
}
script 80 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	You don't have
	anything,Lan⋯
	"""
	waitHold
}
script 82 mmbn3 {
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
	color
		palette = 3
	"""
	OK to use
	"
	"""
	printItem
		buffer = 1
		item = 0
	"\"?\n"
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
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 83 mmbn3 {
	positionText
		left = 10
		top = 2
	positionBox
		top = 6
	positionMugshot
		left = 4
	positionArrow
		left = 192
		top = 92
	msgOpenInvisible
		unused = 12
	color
		palette = 3
	"""
	MegaMan's HP
	has recovered!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 84 mmbn3 {
	positionText
		left = 10
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
	color
		palette = 3
	"""
	MegaMan's HP
	has fully
	recovered!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 85 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	HP is
	maxed out!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 86 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"\""
	printItem
		buffer = 1
		item = 0
	"""
	"
	in use
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 87 mmbn3 {
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
	color
		palette = 3
	"""
	No viruses
	encountered
	here yet!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 88 mmbn3 {
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
	color
		palette = 3
	"""
	There isn't
	any locked
	mystery data!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 89 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	Let's not use
	that yet!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
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
			jump = 91,
			jump = continue,
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
	OK! Your save
	is complete!
	"""
	keyWait
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
	NetBattle on a
	different
	terrain!
	"""
	waitHold
}
script 100 mmbn3 {
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
	NetBattle on a
	field with
	traps!
	"""
	waitHold
}
script 101 mmbn3 {
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
	Winner of 2
	out of 3 is
	champion!
	"""
	waitHold
}
script 102 mmbn3 {
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
	Practice
	NetBattling
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
script 105 mmbn3s {
	"Chips held:\n"
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	end
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
	Want to wait
	a little more?
	
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
script 130 mmbn3 {
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
	"Analyzing!\n"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	wait
		frames = 60
	"・"
	waitHold
}
script 131 mmbn3 {
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
	Starting
	up chip 
	trade screen!
	"""
	waitHold
}
script 132 mmbn3 {
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
	Starting
	up program 
	trade screen!
	"""
	waitHold
}
script 133 mmbn3s {
	"Menu"
	end
}
script 134 mmbn3s {
	"None"
	end
}
script 136 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	Trade
	complete!
	"""
	keyWait
	waitHold
}
script 137 mmbn3 {
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
	color
		palette = 3
	"""
	Trade
	complete!
	But,why⋯?
	"""
	keyWait
	waitHold
}
script 138 mmbn3 {
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
	color
		palette = 3
	"""
	Communication
	error! Trade
	cancelled!
	"""
	keyWait
	waitHold
}
script 139 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	You can't both
	trade nothing!
	"""
	keyWait
	msgOpenInvisible
		unused = 21
	msgCloseQuick
	end
}
script 140 mmbn3 {
	positionText
		left = 11
		top = 2
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
	color
		palette = 3
	"""
	You can't both
	trade nothing!
	"""
	keyWait
	waitHold
}
script 141 mmbn3 {
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
	We got new
	data in our
	library!
	"""
	keyWait
	waitHold
}
script 142 mmbn3 {
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
	Looks like we
	didn't get
	anything new⋯
	"""
	keyWait
	waitHold
}
script 150 mmbn3 {
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
	You will need
	to reprogram!
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"OK "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"Cancel"
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
script 151 mmbn3 {
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
	You'll need to
	reprogram me
	for the style!
	"""
	keyWait
	waitHold
}
script 152 mmbn3 {
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
	color
		palette = 3
	"""
	Can't use this
	folder! Will
	use extra now!
	"""
	keyWait
	waitHold
}
script 155 mmbn3 {
	positionText
		left = 10
		top = 2
	positionBox
		top = 12
	positionMugshot
		left = 4
	positionArrow
		left = 200
		top = 140
	msgOpenInvisible
		unused = 12
	mugshotHide
	textSpeed
		delay = 0
	color
		palette = 3
	clearMsg
	"""
	A data error
	occurred!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
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
script 156 mmbn3 {
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
	mugshotHide
	textSpeed
		delay = 0
	color
		palette = 3
	clearMsg
	"""
	A data error
	occurred!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
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
			jump = 92,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 162 mmbn3s {
	"""
	Recovered
	50HP!
	"""
	end
}
script 163 mmbn3s {
	"""
	HP fully
	recovered!
	"""
	end
}
script 164 mmbn3s {
	"""
	Won't meet
	weak viruses
	for a while
	"""
	end
}
script 165 mmbn3s {
	"""
	Remove traps
	on mystery
	data
	"""
	end
}
script 166 mmbn3s {
	"""
	Easier to
	encounter
	last enemy
	"""
	end
}
script 167 mmbn3s {
	"""
	Unlock
	protected
	mystery data
	"""
	end
}