



//NCP descriptions

@archive 7EB19C
@size 53



//OilBody
script 24 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Gather
	Heat
	energy!
	"""
	waitHold
	end
}
//Fish
script 25 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Gather
	Aqua
	energy!
	"""
	waitHold
	end
}
//Battery
script 26 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Gather
	Elec
	energy!
	"""
	waitHold
	end
}
//Jungle
script 27 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Gather
	Wood
	energy!
	"""
	waitHold
	end
}



//SuperArmor

script 1 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Won't be
	flinched!
	"""
	waitHold
	end
}


//BreakCharge

script 3 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	ChargeShot
	pierces
	guards!
	"""
	waitHold
	end
}


//Block

script 14 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Halve dmg
	w/ Guard
	Button!
	"""
	waitHold
	end
}


//Shield

script 15 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Defend
	w/ Guard
	Button!
	"""
	waitHold
	end
}


//Reflect

script 16 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Return dmg
	w/ Guard
	Button!
	"""
	waitHold
	end
}


//AntiDmg

script 19 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Hurl star
	w/ Guard
	Button!
	"""
	waitHold
	end
}


//WeaponLevel+1

script 35 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	ChargeShot
	atk lv +1.
	Max = 3
	"""
	waitHold
	end
}

//DarkLicense

script 50 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Freely use
	DarkChips!
	"""
	waitHold
	end
}

//HP+50

script 36 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Max HP
	+50!
	"""
	waitHold
	end
}

//HP+100

script 37 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Max HP
	+100!
	"""
	waitHold
	end
}

//HP+200

script 38 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Max HP
	+200!
	"""
	waitHold
	end
}

//HP+400

script 39 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	Max HP
	+400!
	"""
	waitHold
	end
}


//Reg+1

script 40 mmbn3 {
	msgOpenQuick
	textSpeed
		delay = 0
	positionText
		left = 10
		top = 1
	"""
	+1MB for
	chip
	capacity!
	"""
	waitHold
	end
}


//=============================================================================
//=============================================================================


//	NCP NAMES

@archive 7EAFA0
@size 52



//HP+ names

script 36 mmbn3s {
	"HP+50"
	end
}
script 37 mmbn3s {
	"HP+100"
	end
}
script 38 mmbn3s {
	"HP+200"
	end
}
script 39 mmbn3s {
	"HP+400"
	end
}


//Reg+1
script 40 mmbn3s {
	"Reg+1"
	end
}



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


// Fix "AquaBug" style being written as "Aqua bug"

@archive 711CAC
@size 168


script 166 mmbn3s {
	"AquaBug"
	end
}





//	MEME


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



//chip names

@archive 7043EC
@size 256



script 41 mmbn3s {
	"Alt F4"
	end
}

script 161 mmbn3s {
	"DarkHole"
	end
}



//=============================================================================
//=============================================================================

//most chip descriptions

@archive 7052F4
@size 256

script 41 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Shining
	emulator
	crasher!
	"""
	keyWait
	msgCloseQuick
	end
}

script 47 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Punch
	pushes
	back
	"""
	keyWait
	msgCloseQuick
	end
}

script 49 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Punch
	pushes
	back
	"""
	keyWait
	msgCloseQuick
	end
}

//AirStorm1
script 50 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Pull in
	& atk w/
	tornadoes
	"""
	keyWait
	msgCloseQuick
	end
}
//AirStorm2
script 51 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Pull in
	& atk w/
	tornadoes
	"""
	keyWait
	msgCloseQuick
	end
}
//AirStorm3
script 52 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Pull in
	& atk w/
	tornadoes
	"""
	keyWait
	msgCloseQuick
	end
}

//Totem series
script 55 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Totem
	attacks &
	recvs HP!
	"""
	keyWait
	msgCloseQuick
	end
}
script 56 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Totem
	attacks &
	recvs HP!
	"""
	keyWait
	msgCloseQuick
	end
}
script 57 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Totem
	attacks &
	recvs HP!
	"""
	keyWait
	msgCloseQuick
	end
}


//Wave

script 61 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Aqua wave
	permeates
	all rows!
	"""
	keyWait
	msgCloseQuick
	end
}

//RedWave

script 62 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Lava wave
	permeates
	all rows!
	"""
	keyWait
	msgCloseQuick
	end
}

//MudWave

script 63 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Mud wave
	permeates
	all rows!
	"""
	keyWait
	msgCloseQuick
	end
}


//Plasma 1
script 93 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Sluggish
	electric
	attack
	"""
	keyWait
	msgCloseQuick
	end
}

//Plasma 2
script 94 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Moderate
	electric
	attack
	"""
	keyWait
	msgCloseQuick
	end
}

//Plasma 3
script 95 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Speedy
	electric
	attack
	"""
	keyWait
	msgCloseQuick
	end
}



script 107 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Throw in
	hole for
	geyser!
	"""
	keyWait
	msgCloseQuick
	end
}



//Shake 1
script 110 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Sluggish
	shaking
	3sq ahead
	"""
	keyWait
	msgCloseQuick
	end
}

//Shake 2
script 111 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Rhythmic
	wobbling
	3sq ahead
	"""
	keyWait
	msgCloseQuick
	end
}
//Shake 3
script 112 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Speedy
	shaking
	3sq ahead
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
	"""
	keyWait
	msgCloseQuick
	end
}


//DarkHole
script 161 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Unleash
	power of
	[DC1][DC2][DC3]chips!
	"""
	keyWait
	msgCloseQuick
	end
}


//Northwind
script 177 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Removes
	barriers
	& auras!
	"""
	keyWait
	msgCloseQuick
	end
}


//HolyPanel
script 178 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Creates a
	holy pnl
	below!
	"""
	keyWait
	msgCloseQuick
	end
}


//LifeAura
script 201 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Repels
	attacks
	under 200
	"""
	keyWait
	msgCloseQuick
	end
}


//Poltergeist
script 213 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	70 dmg
	per objct
	thrown!
	"""
	keyWait
	msgCloseQuick
	end
}


//StandOut
script 215 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemHeat]:Send a
	heatwave
	into hole
	"""
	keyWait
	msgCloseQuick
	end
}

//WaterLine
script 216 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemAqua]:Draw up
	water frm
	holes!
	"""
	keyWait
	msgCloseQuick
	end
}

//Lightning
script 217 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemElec]:Damage
	objects
	& area!
	"""
	keyWait
	msgCloseQuick
	end
}

//GaiaSword
script 218 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemWood]:Consume
	pwr from
	[ElemWood] chips!
	"""
	keyWait
	msgCloseQuick
	end
}



//=============================================================================
//=============================================================================

//A few more chip descriptions

@archive 707660
@size 256



//Salamander
script 17 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemHeat]:Send a
	heatwave
	into hole
	"""
	keyWait
	msgCloseQuick
	end
}

//Fountain
script 18 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemAqua]:Draw up
	water frm
	holes!
	"""
	keyWait
	msgCloseQuick
	end
}

//Bolt
script 19 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemElec]:Damage
	objects
	& area!
	"""
	keyWait
	msgCloseQuick
	end
}

//GaiaBlade
script 20 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[ElemWood]:Consume
	pwr from
	[ElemWood] chips!
	"""
	keyWait
	msgCloseQuick
	end
}



//Balance
script 52 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Both HP
	reduced
	by 1/3!
	"""
	keyWait
	msgCloseQuick
	end
}


//Bass+
script 55 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[DC1][DC2][DC3]Target
	& smash
	enemy!
	"""
	keyWait
	msgCloseQuick
	end
}


//DarkAura
script 53 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	[DC1][DC2][DC3]Repels
	attacks
	under 300
	"""
	keyWait
	msgCloseQuick
	end
}


//FolderBack
script 47 mmbn3 {
	textSpeed
		delay = 0
	msgOpenQuick
	"""
	Restores
	7 Stndrd
	chips!
	"""
	keyWait
	msgCloseQuick
	end
}





//=============================================================================
//=============================================================================



//		Comm Menu

@archive 7E7618
@size 170


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


//Faster text when finishing the navi customizer


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

