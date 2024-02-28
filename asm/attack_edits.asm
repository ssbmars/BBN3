

//Disable AntiNavi checks for these chips

.org 0x080FDDD4		//AlphArmOmega
	.dw 0x080FA51D

.org 0x080FDD3C		//AlphArmSigma
	.dw 0x080FA51D

.org 0x080FD90C		//Bass
	.dw 0x080FA51D

.org 0x080FD9A4		//Bass+
	.dw 0x080FA51D

.org 0x080FE310		//Serenade
	.dw 0x080FA51D

.org 0x080FD874		//DeltaRay
	.dw 0x080FA51D

.org 0x080FDA3C		//BassGS
	.dw 0x080FA51D

.org 0x080FE060		//PrixPower
	.dw 0x080FA51D


//the main breakpoint that branches to all of these is 08008E90


//Panic: fix crash on emulators not using BIOS
.org 0x080B4354
	nop


//Change the unpowered dark chip effect to 1/4 damage instead of poofing
.org 0x080474D6
	ldrh	r0,[r7,30h]
	lsr		r0,2h
	strh	r0,[r7,30h]
	nop
	nop


//make unpowered DarkAura last 5 seconds
.org 0x080B1288
	mov		r0,7Dh
	lsl		r0,1h
	strh	r0,[r7,30h]
	nop
	nop

/*
//make Darkhole ignore the object limit

	//branch to delete existing object (hole chip)
	.org 0x080FB8D0
		nop
		nop
	//DarkMan's version
	.org 0x080D200A
		nop
		nop
	//store address that allows it to be deleted (hole chip)
	.org 0x080FB8F2
		nop
	//Darkman's version
	.org 0x080D2034
		nop
*/

//allow darkhole to occupy panels alongside other entities
/*
	//make the branch for "can spawn on panel" unconditional
	.org 0x080E397E
		b		80E3992h

	//disable routine branch for marking panel as occupied
	.org 0x080E399A
		nop
		nop

*/


//Magnum crack panel if occupied (used by crackout too)
.org 0x0800B62E
	bne		0800B67Ch


//Holy Panel spawn right under player
.org 0x080EE64C
	ldrb	r0,[r5,12h]
	nop



//change Burner's animation 
.org 0x080B3438
	bl		BurnerLvlCheck


//don't write the lockout value for DeltaRay
.org 0x080D2620
	mov		r0,0h

//this controls the DeltaRay input window
//.org 0x080D22D8
//	cmp		r0,10h



// allow shockwave chips to spawn different panels by sublevel
	.org 0x0800B586
		nop
		nop
		bl	ShockwavePanel
		b	.+ 6*2
	
	// define separate behavior for each sublevel
	.org 0x080B1AF4
		.db 0x01,0x02,0x03,0x04
	
	// make panel change happen later
	.org 0x080D6B4E
		bl	LateShock
	// remove original branch to panel changing routine
	.org 0x080D6A2C
		nop
		nop



// -----------------------------------------------------------------
// -----------------------------------------------------------------
// ----------------- Changes to hitbox properties ------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------


.org HitboxTableHook
bl Hitboxtable


//the following new hitbox values are defined in free_space.asm

//new table value wind-smallpush 	(0x65)
//new table value windpull 			(0x66)
//poison hitbox w/o invis pierce	(0x67)
//grab revenge w/o guard break	 	(0x68)
//new standard wind hitbox			(0x69)


//plantman use new hitbox
.org 0x080C2643
	.db 0x6B

//flashman use new hitbox
.org 0x080B6A4F
	.db 0x6C


//modify northwind's hitbox so it pierces shields
.org (ExpandedHitboxTable + 128h) :: .db 0x54 ;a
.org (ExpandedHitboxTable + 12Ch) :: .db 0x54 ;b


//make windpush remove barr/aura
	//this modifies bytes at a pre-existing location in the table,
	//so the [.org] position is relative to where the table was written
.org (ExpandedHitboxTable + 250h) :: .db 0x40 ;a
.org (ExpandedHitboxTable + 254h) :: .db 0x40 ;b




//pull is not modified because it is used by other non-wind hitboxes.
//a new hitbox value was made for pull instead

//make fan use windpull pointer
.org FanPullHitboxPointer
	.db 0x66



//give tornado the standard wind hitbox
.org TornadoHitboxPointer
	mov r1,69h

//give airstorm's tornado the standard wind hitbox
.org AirStormTornadoHitboxPointer
	mov r1,69h



//make airshot use wind-smallpush pointer
.org AirShotHitboxPointer
	.db 0x65


//make Anubis and Pharaoh use the new hitbox that doesn't pierce invis
.org 0x080DFA53		//p1 val
	.db 0x67
.org 0x080DFA57		//p2 val
	.db	0x67


//make grabback & grabrevenge not break guard
.org GrabRevengeHitboxPointer
	.db 0x68	


//give AirSword a unique hitbox
.org 0x080D67E4
	bl		AirSwordHitboxChooser


//give Rush a hitbox that doesn't have sword property
.org 0x080BF03C
	mov		r1,22h




// ------------ Framedata Changes


// --- Charge Speeds

.org BusterChargeSpeeds
	.dh \
	(0xFFFF /140),(0xFFFF /110),(0xFFFF / 90),(0xFFFF / 70),(0xFFFF / 50),\		//null
	(0xFFFF /230),(0xFFFF /200),(0xFFFF /150),(0xFFFF /120),(0xFFFF / 95),\		//elec
	(0xFFFF /200),(0xFFFF /170),(0xFFFF /110),(0xFFFF / 90),(0xFFFF / 70),\		//fire
	(0xFFFF /170),(0xFFFF /130),(0xFFFF /100),(0xFFFF / 80),(0xFFFF / 60),\		//aqua
	(0xFFFF /220),(0xFFFF /180),(0xFFFF /120),(0xFFFF /100),(0xFFFF / 80) \		//wood


// 0xFFFF / <frame count> to get a value that finishes charging in <frame count> # of frames
// 0xFFFF in decimal is 65535‬

/*
backup of old values
	19Ch,234h,2ECh,386h,3D8h,\		//null
	0F0h,132h,164h,1AFh,223h,\		//elec
	118h,16Fh,1A8h,266h,330h,\		//fire
	160h,1ACh,234h,2DCh,37Fh,\		//aqua
	118h,15Fh,1A8h,236h,2C8h		//wood
*/



// ---- Real Time Chips ----

// ------ Heat Charge Shot
.org HeatChrgSL		:: .db 01 		;SL

// ------ Buster
//.org 0x080B10D0	:: .db 02 		;CL

// ------ Ice Wave
.org IceWaveEL		:: mov r0,30 	;EL
.org IceWaveCL		:: mov r0,01 	;CL

// ------ Spreader
.org SpreaderEL		:: mov r0,10 	;EL
.org SpreaderCL		:: mov r0,01 	;CL

// ------ Bomb Throw
.org BombThrowCL	:: mov r0,01 	;CL

// ------ Fishy
.org FishySL		:: .db 10 		;SL
.org FishyCL		:: mov r0,08 	;CL

// ------ Condor
.org CondorSL		:: .db 20 		;SL

// ------ Boomer
.org BoomerCL		:: mov r0,20 	;CL

// ------ Rock Arm
.org RockArmCL		:: mov r0,15 	;CL

// ------ Lava Cannon
.org LavaCannonSL
	bl	LavaCanLvlCheck
	.definelabel LavaCanSL,10
	.definelabel VolcanoSL,30

// ------ Black Bomb
.org BlackBombCL	:: mov r0,25 	;CL

// ------ Burner & Burning
.org BurnerSF1		//SF
	mov		r0,1h
.org BurnerSF2		//SF
	mov		r0,1h
.org BurnerSF3		//SF
	mov		r0,8h
.org BurnerCL		//CL
	mov		r0,1h


// ------ Shock Wave
.org ShockWaveCL	:: mov r0,03 	;CL

// ------ Air Storm
.org AirStormV1SL		:: .db 09 		;v1 pull duration
.org AirStormV2SL		:: .db 09 		;v2 pull duration
.org AirStormV3SL		:: .db 09 		;v3 pull duration
.org AirStormPullDelay 	:: mov r0,01	;time between wind gusts
.org AirStormPause		:: mov r0,12 	;pause time between gusts and tornadoes
.org AirStormAtkDelay 	:: mov r0,01 	;time between tornado spawns
.org AirStormCL			:: mov r0,08 	;CL

// ------ Ratton
.org RattonV1CL		:: .db 04 		;v1 CL
.org RattonV2CL		:: .db 04 		;v2 CL
.org RattonV3CL		:: .db 04 		;v3 CL

// ------ Arrow
.org ArrowCL		:: mov r0,01	;CL

// ------ Shake
.org ShakeCL		:: mov r0,01	;CL

// ------ Guts Punches
.org GutsPunchIW	:: mov r0,60 	;IW

// ------ Waves
.org WaveCL			:: mov r0,10 	;CL

// ------ Spice
//.org SpiceCL		:: mov r0,30 	;CL

// ------ Geyser
.org GeyserCL		:: mov r0,01 	;CL

// ------ Pawn
.org PawnEL			:: mov r0,60 	;EL on swing

// ------ Shake
.org ShakeMoveVal	:: mov r0,15 	;movement count

// ------ Team1
.org Team1AtkDelay	:: mov r0,06 	;attack delay

.org Team1KF1		:: .db 0x00 	;animation KeyFrame times
.org Team1KF2		:: .db 0x00
.org Team1KF3		:: .db 0x01
.org Team1KF4		:: .db 0x01
.org Team1KF5		:: .db 0x01
.org Team1KF6		:: .db 0x01


//-------------------- Flinch and Status changes


// ------ ElecSword 	//stun
.org ElecSwordFlinch	:: .db 0x00 	;FL
.org ElecSwordStun		:: .db 0x10 	;ST

// ------ Bomb Throw	//flinch
.org BombThrowFlinch	:: mov r3,0x01 	;FL

// ------ Needler 		//no flinch/flash
.org NeedlerFinch		:: mov r3,0x00 	;FL

// ------ Team 1 		//flinch, no flash
.org Team1Flinch		:: mov r3,0x01 	;FL

// ------ Shake 		//flinch, no flash
.org ShakeFlinch		:: mov r3,0x01 	;FL

// ------ Grab Banish	//bigpush+flash
.org GrabBanishFlinch	:: mov r7,0x07	;FL

// ------ AirSword		//bigpush
.org AirSwordFlinch		:: .db 0x06		;FL

// ------ Guts Punch	//bigpush, does not affect command code
.org GutsPunchFlinch	:: .db 0x06		;FL

// ------ Guts Impact	//bigpush, does not affect command code
.org GutsImpactFlinch	:: .db 0x06		;FL


// ---------- Chip Changes

// Pawn HP 50
.org PawnHP		:: .db 50

// Rook HP 250
.org RookHP		:: .dh 250

// Random Meteor HP 200
.org RandomMeteorHP	:: .db 200

// Hole Meteor HP 200
.org HoleMeteorHP	:: .db 200

// Shot Meteor HP 200
.org ShotMeteorHP	:: .db 200

// Needlers' HP 150
.org NeedlerV1HP	:: .db 150 	;v1
.org NeedlerV2HP	:: .db 150 	;v2
.org NeedlerV3HP	:: .db 150 	;v3

// Team1 HP 150
.org Team1HP		:: mov r0,150

// PoisonMask 50
.org PoisonMaskHP	:: mov r0,50


.if IS_PVP
// Nerf to Sensor framedata for V3

.org 0x080E787E		// wait time before attacking
	ldr		r0,=SensorLvlCheck1|1
	bx		r0
	.pool

.org 0x080E77E4		// obstacle duration
	bl		SensorLvlCheck2

.endif


// -------------- Damage Changes ---------

.if IS_PVP
	
	// Poltergeist
	.org PoltergeistAtk
		mov r6,70
	
	// Muramasa cap at 500
	.org MuramasAtk1
		lsl r1,r1,1h
	.org MuramasAtk2
		nop
	
.endif

// Hook GaiaSword's routine for consuming atk from other chips

.org GaiaBoostLogic
	bl		GetChipDataAddr

//check whether the chip is wood elem & atk type
//it will only be consumed if both conditions are true

	ldrb	r1,[r0,0Bh]		//load atk/support val
	ldrb	r0,[r0,6h]		//load elem
	cmp		r0,4h	
	beq		.+4h
	mov		r1,2h		//this line is skipped if chip elem = wood

	mov		r2,15h
	tst		r1,r2
	beq		GaiaDontErase

//exclude chip if its damage value is a placeholder to display "????"
	ldrh	r1,[r4,0Ch]
	mov		r2,27h
	lsl		r2,8h
	cmp		r1,r2
	bge		GaiaDontErase

//add damage value to gaia, then branch to clear chip from hand
	ldrh	r0,[r7,0Ch]
	add		r0,r1
	ldrh	r1,[r4,18h]
	add		r0,r1
	strh	r0,[r7,0Ch]

	b		GaiaEraseChip




.if IS_PVP
// Disable BeastMan command code
.org BeastManInputCheck
	mov		r0,0h
.endif



//-------- Chip Element Changes

// Magnum series Null
.org MagnumElem		:: mov r0,0x00

// Guardian Null
.org GuardianElem	:: mov r0,0x00

// Sensor series Null
.org SensorElem		:: mov r0,0x00



//====================================================================
//====================================================================


.if IS_PVP


//	BassGS

// stop the screen shake from bassgs, replace with visual glitch fix
.org 0x080EA4D6
	ldrb	r0,[r5]
	mov		r1,2h
	bic		r0,r1
	strb	r0,[r5]

// spawn hitbox routine, end loop early
.org 0x080EA5D2
	nop
.org 0x080EA578		// flipped version (pvp)
	nop

// skip some parts of the attack
.org 0x080EA490
	mov		r0,4h
	strh	r0,[r5,0Ah]
	pop		r15

// watergun animation
.org 0x08024AB8
	.dw 0x0830F158

// disable animation flip
.org 0x080EA400
	mov		r1,0h

// fix the anim position
.org 0x080EA3CC 
	bl		offsetGS
	nop
	nop

// shorten end of attack anim
.org 0x080EA0A2
	mov		r0,32h
.org 0x080EA4D2
	mov		r0,1Eh


// make bodyguard throw 9 kunais
.org 0x080F0DAA
	mov		r0,0Ah
// make bodyguard kunais combo into themselves
.org 0x080F0E1E
	mov		r0,1Ch



//make all versions of rope point to the lowest stun time
//this was tested and the plantman navichip doesn't use this code
.org RopeStunTime
	mov		r0,30h


// ------ Rope
.org RopeSL1	:: .db 0x04 	;pre attack 1
.org RopeSL2	:: .db 0x06 	;pre attack 2
.org RopeEL1	:: .db 0x04 	;endlag
.org RopeEL2	:: .db 0x04 	;recoil 1
.org RopeEL3	:: .db 0x04 	;recoil 2
.org RopeCL		:: mov r0,20 	;CL


// ------ Magnum
.org MagnumV1Spd	:: .db 16 	;v1 cursor speed
.org MagnumV2Spd	:: .db 16 	;v2 crsr spd
.org MagnumV3Spd	:: .db 08 	;v3 crsr spd
.org MagnumAnim		:: .db 16 	;crsr sprite keyframe cycle

// ------ MetalMan

.org MetalManIW		:: mov r0,60 	;IW




// -------------- Damage Changes ---------

// disable Punk's 2x damage from having the wristband
	//disable a weird thing it does with damage calculation
	.org 0x080CA41E
		nop

.org 0x080C9FA0
	mov		r6,0h	//use normal atk val (boostable)
	nop
//charge shot command (double hit)
.org 0x080CA27C
	mov		r6,50	//first hit, weak
	nop
	nop
	nop
.org 0x080CA2D4
	mov		r6,00	//second hit, use normal atk val (boostable)
	nop

//extra wheels from the highest tier command code
.org 0x080CA34A
	mov		r6,40
	nop
	nop
.org 0x080CA356
	mov		r6,40
	nop
	nop
// B + Left command
.org 0x080CA0D6
	mov		r6,70	//this atk is added to the normal atk value (boostable)
	nop


//185 LavaStage 25
.org LavaPanelAtk	:: add r1,25


// Balance HP reduction
.org BalanceHPMath
	bl	BalanceHPReduction	

// Shake: fix damage override exploit
.org ShakeDmgAddr
	ldrh	r6,[r5,2Ch]


// Friendly Viruses
//disable redistributing food
	.org FVRedist1 :: .dh 0x0000
	.org FVRedist2 :: .db 0x00
//disable feeding virus (always branch as if viruses are full)
	.org FVBranch 
		b	.+15*2
//value to increase FV atk by when feeding
	.org FVAtkPlusVal
		mov r3,0



;change value check for skipping FV version
.org LoadFVLogic
	cmp r2,1h
	bge .+6*2

//181 KillerEye
	.org KllrEye4Dmg :: .db 00 	;omega 0
	.org KllrEyeElem :: .db 00 	;elem actually be null
//speed values
	.org KllrEyeStartSpd	;first cycle delay
		mov r0,30
	.org KllrEyeCycleSpd	;cycle speed
		mov r0,30	
	.org KllrEyeCursorSpd	;laserdot timing
		mov r0,30

//182 Scuttle
	.org ScuttleBeamDmg :: .db 100
	.org ScuttleFireDmg :: .db 130
	.org ScuttleIceDmg 	:: .db 130 
	.org ScuttleElecDmg :: .db 100 
	.org ScuttleVineDmg :: .db 00	;vine
	.org ScuttleOmegaDmg :: .db 00	;omega
//speed values
	.org ScuttleCycleSpd	;cycle speed
		mov r0,12 
	.org ScuttleStartSpd	;stall speed at first
		mov r0,12 



// Custom Sword damage logic
.org CustSwordAtkLogic1
	b 		.+12*2

.org CustSwordAtkLogic2
	sub 	r1,0
	mov 	r0,75

.org CustSwordAtkLogic3
	add 	r0,56


//	the rest of the Friendly Viruses
//	(1 byte per value, so max 255 dmg)

.org Mettaur1Dmg :: .db 40	//vanilla	40
.org Mettaur2Dmg :: .db 80	//vanilla	80
.org Mettaur3Dmg :: .db 140	//vanilla	120
.org Mettaur4Dmg :: .db 220	//vanilla	150

.org Bunny1Dmg	:: .db 30	//vanilla	60
.org Bunny2Dmg	:: .db 40	//vanilla	90
.org Bunny3Dmg	:: .db 150	//vanilla	140
.org Bunny4Dmg	:: .db 170	//vanilla	160

.org Swordy1Dmg	:: .db 80	//vanilla	120
.org Swordy2Dmg	:: .db 150	//vanilla	120
.org Swordy3Dmg	:: .db 150	//vanilla	120
.org Swordy4Dmg	:: .db 200	//vanilla	120

.org Spikey1Dmg	:: .db 40	//vanilla	50
.org Spikey2Dmg	:: .db 60	//vanilla	80
.org Spikey3Dmg	:: .db 130	//vanilla	120
.org Spikey4Dmg	:: .db 180	//vanilla	170

.org Mushy1Dmg	:: .db 50	//vanilla	60
.org Mushy2Dmg	:: .db 60	//vanilla	80
.org Mushy3Dmg	:: .db 140	//vanilla	100
.org Mushy4Dmg	:: .db 180	//vanilla	120

.org JellyAquaDmg	:: .db 50	//vanilla	50
.org JellyFireDmg	:: .db 120	//vanilla	80
.org JellyWoodDmg	:: .db 120	//vanilla	80
.org JellyOmegaDmg	:: .db 150	//vanilla	150

.org Momogra1Dmg	:: .db 70	//vanilla	90
.org Momogra2Dmg	:: .db 100	//vanilla	120
.org Momogra3Dmg	:: .db 180	//vanilla	150
.org Momogra4Dmg	:: .db 240	//vanilla	200




//-------------------- Flinch changes

// ------ Pawn 		;flinch
//.org 0x080D66D3 :: .db 0x01 	;FL
//disabled because it affects longsword and probably isn't necessary anyways

// ------ Meteor
.org MeteorFlinch ;FL
	bl	MeteorLvlCheck
	nop
	nop


// ------ LavaStage
//.org LavaPanelFlinch :: mov r3,01 	;FL

// ------ Guts Machinegun
.org GutsMachGunFlinch		:: .db 0x00		;rapid hits
.org GutsMachGunFinalFlinch :: .db 0x00		;final hit
// vanilla values are used when breakbuster is active


.endif



