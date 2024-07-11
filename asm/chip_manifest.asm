/*


code1	set a single chip code: <code value>,<which code to change, 0-5>

code	set all 6 chip codes, must provide 6 values

elem	the chip's element 

fam		the chip family

sublv	the family sublevel

lim		rarity value, sets folder chip limit, limit is <value>+1

mb		the chip's megabyte

type	attack/support value, support chips do not display a damage value

atk		attack value, as displayed on the chip. Can use decimal numbers instead of hex

pos		library position, can set it to 0 to make a chip disappear from the library

clss	S/M/G chip value, can be set by entering "S", "M", or "G"


---------------------------------------
for these, provide the label name for the address of the image/palette you imported

Icon	small icon that the chip uses
Image	the chip art 
Color	the palette for the chip art
---------------------------------------
*/








set	Cannon

	lim		3





set	Hicannon

	lim		3

	atk		100




set	Mcannon
	code1	codeSTAR,5
	
	lim		2

	atk		180




set	Airshot1

	lim		3






set	Airshot2

	lim		3






set	Airshot3

	lim		3






set	Lavacan1
	code1	0FFh,4h
	lim		3

	atk		110




set	Lavacan2

	lim		3

	atk		140




set	Lavacan3

	lim		2
	mb		4
	atk		170




set	ShotGun
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	VGun
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	SideGun
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Spreader
	code	codeM,codeN,codeO,codeSTAR,codeNONE,codeNONE
	lim		3






set	Bubbler
	code	0h,2h,3h,4h,0Fh,0FFh
	lim		3

	atk		100





set	BubV
	code	3h,4h,5h,12h,0FFh,0FFh
	lim		3

	atk		100






set	BublSide
	code	1h,4h,5h,6h,11h,0FFh
	lim		3

	atk		100




set	Heatshot
	code1	0FFh,5h
	lim		3

	atk		80




set	HeatV
	code1	0FFh,4h
	code1	0FFh,5h
	lim		3

	atk		80




set	HeatSide
	code1	0FFh,5h
	lim		3

	atk		80




set	MiniBomb
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	SnglBomb
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		150




set	DublBomb
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		100




set	TrplBomb

	lim		2

	atk		80




set	CannBall
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2

	atk		250




set	IceBall
	code1	0FFh,5h
	lim		2
	atk		200





set	LavaBall
	code1	0FFh,5h
	lim		2
	atk		180





set	BlkBomb1

	lim		3
//	mb		7





set	BlkBomb2
	code1	codeR,3
	lim		2
//	mb		9
	atk		160




set	BlkBomb3

	lim		1
	mb		6
	atk		200




set	Sword

	lim		3






set	WideSwrd

	lim		3






set	LongSwrd

	lim		3






set	FireSwrd

	lim		2
	atk		140





set	AquaSwrd

	lim		2
	atk		180





set	ElecSwrd
	code1	14h,4h
	lim		2
	atk		140





set	BambSwrd

	lim		2
	atk		150





set	CustSwrd
	code1	0FFh,3h
	lim		2






set	VarSwrd
//	code 	11h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1
	mb		9
	atk		100



set	StepSwrd

	lim		2
	atk		200





set	StepCros
	code1	codeK,4
	lim		2
//	mb		9
	atk		150




set	Panic
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	pos 0




set	AirSwrd
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		140




set	Slasher

	lim		1






set	ShockWav	// CrackWav

	lim		2
	atk		90
	abcd	42h



set	SonicWav	// BreakWav


	lim		1
	atk		100
	abcd	32h


set	DynaWave	// SwampWav
	code1	0FFh,4h
	lim		1
	atk		140
	abcd	11Eh




set	GutPunch

	lim		3

	atk		140




set	GutStrgt

	lim		2

	atk		160




set	GutImpct

	lim		1

	atk		200
.if IS_PVP
.else
	mb		3	//keeps the PA possible in pve
.endif



set	AirStrm1

	lim		2

	atk		60




set	AirStrm2

	lim		1

	atk		80




set	AirStrm3
	code1	14h,4h
	lim		1
	atk		100





set	DashAtk
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Burner

	lim		3

	atk		250




set	Totem1
	code1	0FFh,4h
	lim		2

	atk		140




set	Totem2

	lim		2

	atk		160




set	Totem3

	lim		1






set	Ratton1

	lim		3

	atk		110




set	Ratton2

	lim		3

	atk		130




set	Ratton3

	lim		2

	atk		150




set	Wave

	lim		3
	mb		4
	atk		100




set	RedWave

	lim		3
	mb		4
	atk		100




set	MudWave
	code1	14h,3h
	lim		2
	mb		4





set	Hammer
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2

	atk		220




set	Tornado

	lim		2






set	Zapring1
	code1	0xFF,5
	code1	codeK,3

	lim		3
	atk		30




set	Zapring2

	lim		2

	atk		40




set	Zapring3

	lim		1

	atk		50




set	YoYo1
	code1	0FFh,5h
	lim		3
//	mb		9





set	YoYo2

	lim		2
//	mb		9





set	YoYo3

	lim		1
//	mb		9

.if IS_PVP
.else
	mb		3	//makes sure the PA is possible in pve
.endif





set	Spice1
	code1	0FFh,5h
	lim		3






set	Spice2

	lim		2






set	Spice3

	lim		1






set	Lance
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Scuttlst
	code	3h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1
	mb		6
	abcd	103h




set	Momogra
	code	06h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Rope1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		100




set	Rope2

	lim		3
//	mb		6
	atk		130




set	Rope3
	code1	0FFh,4h
	lim		2
	mb		5
	atk		160




set	Magnum1
	code	0h,1h,2h,0Ch,12h,0FFh
	lim		1
	elem 	null
	atk		100




set	Magnum2

	lim		1
//	mb		6
	elem 	null
	atk		100




set	Magnum3

	lim		1
//	mb		9
	elem 	null





set	Boomer1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		90




set	Boomer2
	code1	5h,4h
	code1	0FFh,5h
	lim		2

	atk		130




set	Boomer3
	code1	0FFh,4h
	lim		1

	atk		150




set	RndmMetr
	code1	14h,3h
	lim		2

	atk		50




set	HoleMetr

	lim		2

	atk		75




set	ShotMetr

	lim		2






set	IceWave1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		140




set	IceWave2
	code1	0FFh,5h
	lim		3

	atk		160




set	IveWave3
	code1	14h,4h
	lim		2

	atk		180




set	Plasma1

	lim		2

	atk		100




set	Plasma2

	lim		2
	atk		75





set	Plasma3

	lim		2

	atk		50




set	Arrow1
	code	codeSTAR,0xFF,0xFF,0xFF,0xFF,0xFF
	lim		3

	atk		140




set	Arrow2

	lim		3
//	mb		7
	atk		160




set	Arrow3

	lim		2
//	mb		9
	atk		180




set	TimeBomb

	lim		2
	atk		190





set	Mine
	code1	0FFh,5h
	lim		1

	atk		200




set	Sensor1
//	code1	0FFh,4h
	lim		2
//	mb		8
	atk		160
	elem	null



set	Sensor2
//	code1	0FFh,3h
	lim		2
	mb		4
	atk		160
	elem	null




set	Sensor3
	code1	0FFh,4h
	lim		1
	mb		9
	atk		100
	elem	null



set	CrsShld1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	atk		210




set	CrsShld2

	lim		3

	atk		230




set	CrsShld3

	lim		2






set	Geyser

	lim		2






set	PoisMask
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2






set	PoisFace
	code1	14h,3h
	code1	0FFh,5h
	lim		1






set	Shake1

	lim		3

	atk		110




set	Shake2

	lim		2

	atk		40




set	Shake3

	lim		2

	atk		90




set	BigWave		// SandWave 

	lim		1
	mb		9
	abcd	104h




set	Volcano

	lim		1
	mb		9
	atk		150




set	Condor

	lim		2
	atk		210





set	Burning

	lim		2

	atk		180




set	FireRatn

	lim		2






set	Guard
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	PanlOut1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	PanlOut3
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Recov10
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Recov30
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	pos		0




set	Recov50
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	pos		0




set	Recov80
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Recov120
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

	pos		0




set	Recov150
	code	0Dh,0Fh,11h,13h,0FFh,0FFh
	lim		2






set	Recov200
	code1	0FFh,3h
	lim		1
	mb		8





set	Recov300
	code1	0FFh,2h
	code1	0FFh,3h
	lim		1
	mb		9





set	PanlGrab
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	AreaGrab
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2






set	Snake

	lim		2
	type	2h
	atk		40




set	Team1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2

	atk		60
	clss	4h



set	MetaGel1
	code	6h,0Bh,0Eh,0Fh,0FFh,0FFh
	lim		1
	atk		60
	clss	4h
.if IS_PVP
.else
	mb		3	//make the PA possible in PVE
.endif


set	MetaGel2
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black
	clss	4h



set	MetaGel3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black
	clss	4h



set	GrabBack

//	sublv	0Eh		//this gives it bigpush
	lim		2
	type	2h
	atk		20




set	GrabRvng
	lim		1
	type	2h
	atk		40





set	Geddon1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Geddon2

	lim		1






set	Geddon3

	lim		1
	mb		9





set	RockCube
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3

//	pos		141




set	Prism
//	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0





set	Wind
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Fan
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	RockArm1
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3
	atk		150





set	RockArm2
	code1	0FFh,4h
	code1	0FFh,5h
	lim		3
	atk		200





set	RockArm3

	lim		2
	atk		250





set	NoBeam1

	lim		2
//	mb		9





set	NoBeam2

	lim		1
	mb		6





set	NoBeam3
	code1	0FFh,2h
	lim		1
	mb		9





set	Pawn

	lim		2

	atk		90




set	Knight
	code1	0FFh,4h
	lim		2
//	mb		8





set	Rook
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Needler1

	lim		3

	atk		50




set	Needler2
	code1	0FFh,4h
	lim		3
//	mb		6
	atk		40




set	Needler3

	lim		2
	mb		9
	atk		30




set	SloGauge
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	FstGauge
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Repair
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Invis
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		2






set	Hole
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3
	mb		6
	abcd	47h




set	Mole1
	code	6h,0Ch,0FFh,0FFh,0FFh,0FFh
	lim		1
//	fam		0
//	pos		0
//	color	black




set	Mole2
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black




set	Mole3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
//	mb 		60

//	clss 	M
	pos		0


set	Shadow
	code	9h,0Dh,0FFh,0FFh,0FFh,0FFh
	lim		1
	mb		7





set	Mettaur
	code	0Ch,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Bunny
	code	1h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	AirShoes
	code	0h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	mb		6





set	Team2
	code	0Dh,0Eh,10h,14h,18,19h
	lim		0
	clss	4h





set	Fanfare
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Discord
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Timpani
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Barrier
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Barr100
	code	2h,4h,0Bh,11h,12h,0FFh
	lim		1






set	Barr200

	lim		0






set	Aura
	code	5h,8h,14h,0FFh,0FFh,0FFh
	lim		0
	atk		1600




set	NrthWind
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	HolyPanl
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	LavaStge
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	IceStage
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	GrassStg
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	SandStge
	code1	codeP,5h
	lim		1






set	MetlStge
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Snctuary
	code	19h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	mb		6
	pos 	202
	clss 	M



set	Swordy
	code	12h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Spikey
	code	4h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Mushy
	code	0Ch,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	Jelly
	code	9h,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1






set	KillrEye
	code	0Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	elem	0
	lim		1
	mb		6





set	AntiNavi
	code1	0FFh,3h
	lim		1
	mb		7





set	AntiDmg

	lim		2






set	AntiSwrd

	lim		2
	mb		9





set	AntiRecv

	lim		3
	mb		9





set	CopyDmg
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		3






set	Atkp10

	lim		2






set	Firep30

	lim		0






set	Aquap30

	lim		0






set	Elecp30

	lim		0






set	Woodp30

	lim		0






set	Navip20
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black




set	LifeAura

	lim		0
	mb		9
	atk		1600





set	Muramasa

	lim		0
	mb		9





set	Guardian

	lim		0
	mb		9
	clss	S
	pos		123



set	Anubis

	lim		0
	mb		9





set	Atkp30
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black




set	Navip40

	lim		0
	mb		7





set	HeroSwrd
	code	01h,0Bh,0Dh,0Fh,0FFh,0FFh
	lim		1
	atk		200
	pos		200
	clss 	Spa4



set	ZeusHamr

	lim		0
	mb		9
	atk		280




set	GodStone

	lim		0
	mb		9





set	OldWood

	lim		0
	mb		9





set	FullCust

	lim		0
	clss	S
	pos		202




set	Meteors

	lim		0
	mb		9
	type	2h
	atk		50




set	Poltrgst
	code	1Ah,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		1
	pos 	201
	clss 	S



set	Jealousy
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	fam		0
	pos		0
	color	black




set	StandOut
	code1	0FFh,0
	lim		0






set	WatrLine
	code1	0FFh,0
	lim		0






set	Ligtning
	code1	0FFh,0
	lim		0

	atk		110




set	GaiaSwrd
	code1	0FFh,0
	lim		0







set	Roll

	lim		0
	atk		40

	icon	ico_roll



set	RollV2

	lim		0
	atk		60

	icon	ico_roll



set	Gutsman

	lim		0

	atk		90

	icon	ico_gutsman


set	GutsmanV2

	lim		0

	atk		140

	icon	ico_gutsman


set	Protoman

	lim		0
	mb		9
	atk		140

	icon	ico_protoman


set	ProtomnV2

	lim		0
	mb		9
	atk		200

	icon	ico_protoman


set	Beastman

	lim		0

	atk		60

	icon	ico_beastman


set	BeastmnV2

	lim		0
	mb		7
	atk		80

	icon	ico_beastman


set	BubblMan

	lim		0
//	type	42h

	icon	ico_bubbleman



set	BubblMnV2

	lim		0
	mb		8

	icon	ico_bubbleman



set	DesrtMan

	lim		0

	atk		130

	icon	ico_desertman


set	DesrtMnV2

	lim		0
	mb		6
	atk		180

	icon	ico_desertman


set	FlamMan

	lim		0

	atk		100

	icon	ico_flameman


set	FlamManV2

	lim		0
	mb		6
	atk		150

	icon	ico_flameman


set	DrillMan

	lim		0
	mb		9
	atk		60

	icon	ico_drillman


set	DrillMnV2

	lim		0
	mb		9
	atk		90

	icon	ico_drillman


set	MetalMan

	lim		0

	atk		160

	icon	ico_metalman


set	MetalMnV2

	lim		0
	mb		7
	atk		200

	icon	ico_metalman


set	Punk
	code	codeP,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	mb		6
	atk		180

	icon	ico_punk



set	Salamndr
	code1	0FFh,0
	lim		0






set	Fountain
	code1	0FFh,0
	lim		0






set	Bolt
	code1	0FFh,0
	lim		0
	mb		6
	atk		160




set	GaiaBlad
	code1	0FFh,0
	lim		0
	mb		6





set	KingMan

	lim		0


	icon	ico_kingman



set	KingManV2

	lim		0


	icon	ico_kingman



set	MistMan


	lim		0
	mb		9

	icon	ico_mistman


set	MistManV2

	atk		130
	lim		0
	mb		9

	icon	ico_mistman


set	BowlMan

	lim		0
	mb		9

	icon	ico_bowlman



set	BowlManV2

	lim		0
	mb		9
	atk		140

	icon	ico_bowlman



set	DarkMan

	lim		0
	mb		9
	type	42h
	atk		30

	icon	ico_darkman


set	DarkManV2

	lim		0
	mb		9
	type	42h
	atk		30

	icon	ico_darkman


set	JapanMan

	lim		0
	mb		9

	icon	ico_yamatoman



set	JapanMnV2

	lim		0
	mb		9
	atk		50
	icon	ico_yamatoman




set	DeltaRay

	lim		0
	mb		9
	atk		200




set	FoldrBak

	lim		0
	mb		9





set	DarkAura

	lim		0
	mb		9
	atk		1600




set	AlphArmO
	code1	11h,0h
	lim		0
	mb		9
	atk		450




set	Bassp
	code1	0Ah,0h
	lim		0
	mb		9
	atk		500





set	BassGS
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	lim		0
	mb		9

	atk		100
	pos		305


//These are the original opposite-version chips

set	130h	//	NavRcycl
	lim		0
	pos		298
	icon	icon_NavRcycl
	img		img_NavRcycl
	color	pal_NavRcycl


set	131h	//	AlphArmS
	code1	codeQ,0
	lim		0
	mb		9
	type	60h
	atk		40
	pos		302
	icon	icon_AlphArmS
	img		img_AlphArmS
	color	pal_AlphArmS


set	132h	//	Bass
	code1	codeW,0
	lim		0
	mb		9
	type	44h
	atk		80
	pos		299
	icon	icon_Bass
	img		img_Bass
	color	pal_Bass


set	133h	//	Serenade
	lim		0
	mb		9
	atk		80
	pos		300
	icon	icon_Serenade
	img		img_Serenade
	color	pal_Serenade

set	134h	//	Balance
	lim		0
	pos		301
	icon	icon_Balance
	img		img_Balance
	color	pal_Balance

//end of opposite-version gigas






set	KingManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black




set	MistManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black




set	BowlManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black




set	FlamManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	color	black





set	DarkManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	color	black





set	DrillMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	color	black





set	JapanMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	color	black





set	MetalMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	color	black




set	BeastMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black



set	GutsManV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black



set	BubblMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black



set	ProtoMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black



set	DesrtMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	mb		9
	clss	G
	color	black



set	FlashMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	lim		0
	color	black
//	mb		9
//	atk		120
//	pos		303
	icon	ico_flashman
//	img		img_sensorman
//	color	pal_sensorman



set	PlantMnV5
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	lim		0
	color	black
//	lim		0
//	mb		9
//	atk		40
//	pos		304
	icon	ico_plantman





set	ZCanon1








set	ZCanon2
	atk		70







set	ZCanon3
	atk		90







set	ZPunch








set	ZStrght








set	ZImpact








set	ZVaribl


	pos		0





set	ZYoyo1








set	ZYoyo2








set	ZYoyo3



	pos		0




set	ZStep1
	atk		200







set	ZStep2








set	TimeBomp



	atk		600




set	HBurst








set	BubSprd








set	HeatSprd








set	LifeSwrd








set	ElemSwrd


	atk		160





set	EvilCut








set	DblHero


	type	42h
	atk		60
	pos		0



set	HyperRat








set	EverCurse








set	GelRain


	pos		0





set	PoisPhar








set	BodyGrd



	atk		100




set	Barr500








set	BigHeart



	atk		30




set	GtsShoot








set	DeuxHero


	type	42h
	atk		60
	pos		0



set	MomQuake








set	PrixPowr

	sublv 	30h
	atk		69
	pos		0




set	MstrStyl


	atk		75







set	RollV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_roll
	color	black



set	MistManV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_mistman
	color	black



set	MistManV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_mistman
	color	black



set	BowlManV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_bowlman
	color	black



set	BowlManV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_bowlman
	color	black




set	DarkManV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0

	fam		0
	icon	ico_darkman
	color	black



set	DarkManV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_darkman
	color	black




set	JapanMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_yamatoman
	color	black




set	JapanMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_yamatoman
	color	black




set	GutsmanV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_gutsman
	color	black




set	GutsmanV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_gutsman
	color	black




set	ProtomnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_protoman
	color	black




set	ProtomnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_protoman
	color	black




set	BeastmnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_beastman
	color	black




set	BeastmnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_beastman
	color	black




set	BubblMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_bubbleman
	color	black




set	BubblMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_bubbleman
	color	black




set	DesrtMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_desertman
	color	black




set	DesrtMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_desertman
	color	black




set	FlamManV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_flameman
	color	black




set	FlamManV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_flameman
	color	black




set	DrillMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_drillman
	color	black




set	DrillMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_drillman
	color	black




set	MetalMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_metalman
	color	black




set	MetalMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_metalman
	color	black




set	KingManV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_kingman
	color	black




set	KingManV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_kingman
	color	black




set	Flashman
	lim		0
	mb		9
	atk		50
	icon	ico_flashman




set	FlashmnV2
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_flashman
	color	black




set	FlashmnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_flashman
	color	black




set	FlashmnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_flashman
	color	black




set	PlantMan
	lim		0
	mb		9
	atk		20
	icon	ico_plantman





set	PlantMnV2
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_plantman
	color	black
	



set	PlantMnV3
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_plantman
	color	black




set	PlantMnV4
	code	0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	pos		0
	fam		0
	icon	ico_plantman
	color	black





//THIS PART DOES NOT APPLY TO PRODUCTION CODE

//make sure the chips that trigger library anticheat don't get added 
.if ALL_STAR_CODES

set	BassGS
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	Punk
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	130h
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	131h
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	132h
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	133h
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

set	134h
SetChipOffset 0x0
.db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

.else
.endif


















