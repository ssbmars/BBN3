


//chip names

@archive 7043EC
@size 256


script 133 mmbn3s {
	"MetaGel"
	end
}

script 162 mmbn3s {
	"Mole"
	end
}



//=============================================================================
//=============================================================================

//most chip descriptions

@archive 7052F4
@size 256


//Snake
script 131 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Snake
	de hoyos
	Atq:40
	"""
	keyWait
	msgCloseQuick
	end
}


//GrabBack
script 136 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Recupera
	paneles!
	Atq:20
	"""
	keyWait
	msgCloseQuick
	end
}
//GrabRevenge
script 137 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Recupera
	paneles!
	Atq:40
	"""
	keyWait
	msgCloseQuick
	end
}


//BubbleManV1
script 242 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Dispara 6
	aquashots
	seguidos
	"""
	keyWait
	msgCloseQuick
	end
}
//BubbleManV2
script 243 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Dispara 7
	aquashots
	seguidos
	"""
	keyWait
	msgCloseQuick
	end
}


//Meteors
script 212 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Lluvia de
	meteoros!
	Atq:50
	"""
	keyWait
	msgCloseQuick
	end
}


//=============================================================================

//A few more chip descriptions

@archive 707660
@size 256



//DarkMan v1 & v2
script 36 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Ataca en
	3 columns
	Atq:30
	"""
	keyWait
	msgCloseQuick
	end
}
script 37 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Ataca en
	3 columns
	Atq:30
	"""
	keyWait
	msgCloseQuick
	end
}

//AlphArmSigma
script 49 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Ataca en
	cada fila
	Atq:40
	"""
	keyWait
	msgCloseQuick
	end
}





//=============================================================================
//=============================================================================



//Program Advance notes

@archive 7EA2C8
@size 160


//Spreader - remove last 2 notes
script 66 mmbn3s {
	end
}
script 67 mmbn3s {
	end
}


//Barrier500 - "Barrier *"
script 125 mmbn3s {
	"""
	Barrier *
	Barr100 E
	Barr200 E
	"""
	end
}
script 126 mmbn3s {
	"""
	Barrier *
	Barr100 R
	Barr200 R
	"""
	end
}


//GutsShoot - remove last 2 notes
script 137 mmbn3s {
	end
}
script 138 mmbn3s {
	end
}


//BigHeart - remove last note, "HolyPanl *"
script 130 mmbn3s {
	"""
	HolyPanl*
	Recov300R
	Roll    R
	"""
	end
}
script 131 mmbn3s {
	"""
	HolyPanl*
	Recov300R
	RollV2  R
	"""
	end
}
script 132 mmbn3s {
	end
}

