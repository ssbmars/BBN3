
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
	Esa es la única pista
	que necesitaras para
	encontrar.
	"""
	textspeed
		delay = 8
	"""
	 . .
	"""
	wait
		frames = 16
	clearMsg
	textspeed
		delay = 2
	"""
	al fantasma de
	la red
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
	"BBBBBN3"
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
	¡MUCHOS
	ERORRES!
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


@archive 759A10
@size 255

script 0 mmbn3 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"Lan, tienes que\nsalvar al mundo."
	keyWait
	clearMsg
	"Podemos ver cuál de\nnosotros es el mejor\ndespués de esto..."
	keyWait
	clearMsg
	"En la Isla Hades⋯"
	keyWait
	clearMsg

	checkFlag
		flag = 888
		jumpifTrue = continue
		jumpIfFalse = 1
	end
}
script 1 mmbn3 {
	mugshotHide
	msgOpen
	flagSet
		flag = 888
	"Aquí tienes un\nregalo de parte del\ngrupo de traducción."
	keyWait
	clearMsg
	"Visítalos en\nwww.facebook.com/Mega\nman.Exe.FanClub"
	keyWait
	clearMsg
	"¡Obtienes los chips\nexclusivos de la\notra version!"
	keyWait
	clearMsg
	"¡Y también obtienes\nun chip muy difícil\nde conseguir!"
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 282
		code = M
		amount = 1
    "¡Has obtenido el\nchip MistMan M!"
	keyWait
	clearMsg
    itemGiveChip
		chip = 283
		code = M
		amount = 1
    "¡Has obtenido el\nchip MistMan [V2] M!"
	keyWait
	clearMsg
    itemGiveChip
		chip = 284
		code = M
		amount = 1
    "¡Has obtenido el\nchip MistMan [V3] M!"
	keyWait
	clearMsg
    itemGiveChip
		chip = 285
		code = M
		amount = 1
    "¡Has obtenido el\nchip MistMan [V4] M!"
	keyWait
	clearMsg
    itemGiveChip
		chip = 302
		code = Z
		amount = 1
    "¡Has obtenido el\nchip DeltaRay Z!"
	playerFinish
	playerUnlock
	keyWait
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
	"¡Ya has roto todos\nlos récords!"
        keyWait
        clearMsg
        "¡Aquí tienes, un\nregalo de Serenade!"
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
	¡¡MegaMan obtuvo el
	chip de
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
	¡¡MegaMan obtuvo el
	chip de
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
	playerFinish
	playerReset
	clearMsg
	mugshotShow
		mugshot = HeelNavi
	msgOpen
	"¡Las batallas por\ntiempo siempre están\ndisponible!"
	keyWait
	end
}