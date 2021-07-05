


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
	Snake frm
	holes!
	Atk:40
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
	Reclaim
	panels!
	Atk:20
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
	Reclaim
	panels!
	Atk:40
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
	Fires 6
	harpoons
	in row!
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
	Fires 7
	harpoons
	in row!
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
	Rain down
	meteors!
	Atk:50
	"""
	keyWait
	msgCloseQuick
	end
}



//Roll
script 219 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Attack an
	enemy &
	heal you
	"""
	keyWait
	msgCloseQuick
	end
}

//RollV2
script 220 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Attack an
	enemy &
	heal you
	"""
	keyWait
	msgCloseQuick
	end
}


//FlashmanV5
script 236 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Flash atk
	paralyzes
	enemies!
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
	Dark bats
	in colmn!
	Atk:30
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
	Dark bats
	in colmn!
	Atk:30
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
	Electric
	attack!
	Atk:50
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

