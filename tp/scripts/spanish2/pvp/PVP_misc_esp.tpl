

//=============================================================================



//change text for Time Trial navi fights

@archive 7B2864
@size 29

script 17 mmbn3 {

	msgOpen
	textSpeed
		delay = 0
	"¿Aceptas el reto?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Sí "
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
	¿Pelear de nuevo?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Sí "
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
	"Vuelve cuando\nquieras."
	keyWait
	end
}


script 1 mmbn3 {
	mugshotShow
		mugshot = FlashMan
	msgOpen
"¡Una copia de\nFlashMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 2 mmbn3 {
	mugshotShow
		mugshot = BeastMan
	msgOpen
	"¡Una copia de\nBeastMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 3 mmbn3 {
	mugshotShow
		mugshot = BubbleMan
	msgOpen
	"¡Una copia de\nBubbleMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 4 mmbn3 {
	mugshotShow
		mugshot = DesertMan
	msgOpen
	"¡Una copia de\nDesertMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 5 mmbn3 {
	mugshotShow
		mugshot = PlantMan
	msgOpen
	"¡Una copia de\nPlantMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 6 mmbn3 {
	mugshotShow
		mugshot = FlameMan
	msgOpen
	"¡Una copia de\nFlamMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 7 mmbn3 {
	mugshotShow
		mugshot = DrillMan
	msgOpen
	"¡Una copia de\nDrillMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 8 mmbn3 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"¡Una copia de\nGutsMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 9 mmbn3 {
	mugshotShow
		mugshot = Tamako
	msgOpen
	"¡Una copia de\nMetalMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 10 mmbn3 {
	mugshotShow
		mugshot = Tora
	msgOpen
	"¡Una copia de\nKingMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
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
	"¡Una copia de\nMistMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 12 mmbn3 {
	mugshotShow
		mugshot = DarkMan
	msgOpen
	"¡Una copia de\nDarkMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 13 mmbn3 {
	mugshotShow
		mugshot = JapanMan
	msgOpen
	"¡Una copia de\nJapanMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
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
	"¡Una copia de\nBass está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}

script 28 mmbn3 {
	mugshotShow
		mugshot = BowlMan
	msgOpen
	"¡Una copia de\nBowlMan está\ndisponible en una"
        keyWait
        clearMsg
        "batalla de tiempo!"
	keyWait
	clearMsg
	jump
		target = 17
}

