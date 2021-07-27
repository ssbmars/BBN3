

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







// -----------------------------------------------------------------
// -----------------------------------------------------------------
// ----------------- Changes to hitbox properties ------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------


.org HitboxTableHook
bl Hitboxtable


//the following new hitbox values are defined in free_space.asm

//new table value wind-smallpush 	(65)
//new table value windpull 			(66)
//poison hitbox w/o invis pierce	(67)
//grab revenge w/o guard break	 	(68)
//new standard wind hitbox			(69)





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
.org HeatChrgSL		:: .db 0x01 	;SL

// ------ Buster
//.org 0x080B10D0	:: .db 0x02 	;CL

// ------ Ice Wave
.org IceWaveEL		:: .db 0x1E 	;EL
.org IceWaveCL		:: .db 0x01 	;CL

// ------ Spreader
.org SpreaderEL		:: .db 0x0A 	;EL
.org SpreaderCL		:: .db 0x01 	;CL

// ------ Bomb Throw
.org BombThrowCL	:: .db 0x01 	;CL

// ------ Fishy
.org FishySL		:: .db 0x0A 	;SL
.org FishyCL		:: .db 0x08 	;CL

// ------ Condor
.org CondorSL		:: .db 0x16 	;SL

// ------ Boomer
.org BoomerCL		:: .db 0x14 	;CL

// ------ Rock Arm
.org RockArmCL		:: .db 0x0F 	;CL

// ------ Lava Cannon
.org LavaCannonSL	:: .db 0x0C 	;SL

// ------ Black Bomb
.org BlackBombCL	:: .db 0x19 	;CL

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
.org ShockWaveCL	:: .db 0x03 	;CL

// ------ Air Storm
.org AirStormV1SL		:: .db 0x09 	;v1 pull duration
.org AirStormV2SL		:: .db 0x09 	;v2 pull duration
.org AirStormV3SL		:: .db 0x09 	;v3 pull duration
.org AirStormPullDelay 	:: .db 0x01		;time between wind pulls
.org AirStormPause		:: .db 0x0C 	;pause duration between gusts and tornadoes
.org AirStormAtkDelay 	:: .db 0x01 	;time between tornado spawns
.org AirStormCL			:: .db 0x08 	;CL

// ------ Ratton
.org RattonV1CL		:: .db 0x04 	;v1 CL
.org RattonV2CL		:: .db 0x04 	;v2 CL
.org RattonV3CL		:: .db 0x04 	;v3 CL

// ------ Arrow
.org ArrowCL		:: .db 0x01 	;CL

// ------ Shake
.org ShakeCL		:: .db 0x01 	;CL

// ------ Guts Punches
.org GutsPunchIW	:: .db 0x3C 	;IW

// ------ Waves
.org WaveCL			:: .db 0x0A 	;CL

// ------ Spice
.org SpiceCL		:: .db 0x1E 	;CL

// ------ Geyser
.org GeyserCL		:: .db 0x01 	;CL

// ------ Pawn
.org PawnEL			:: .db 0x3C 	;EL on swing

// ------ Shake
.org ShakeMoveVal	:: .db 0x0F 	;movement count

// ------ Team1
.org Team1AtkDelay	:: .db 0x06 	;attack delay

.org Team1KF1		:: .db 0x00 	;keyframe timers
.org Team1KF2		:: .db 0x00
.org Team1KF3		:: .db 0x01
.org Team1KF4		:: .db 0x01
.org Team1KF5		:: .db 0x01
.org Team1KF6		:: .db 0x01


//-------------------- Flinch and Status changes


// ------ ElecSword 	;stun
.org ElecSwordFlinch :: .db 0x00 	;FL
.org ElecSwordStun	:: .db 0x10 	;ST

// ------ Needler 	;no flinch
.org NeedlerFinch	:: .db 0x00 	;FL

// ------ Team 1 	;flinch
.org Team1Flinch	:: .db 0x01 	;FL

// ------ Shake 	;flinch
.org ShakeFlinch	:: .db 0x01 	;FL

// ------ Grab Banish
.org GrabBanishFlinch :: .db 0x07 ;bigpush+flash

// ------ AirSword
.org 0x080D6703 :: .db 0x06 ;bigpush

// ------ Guts Punch
//.org 0x080B295B
//	.db	0x67		//bigpush on hitbox table

.org 0x080B2964
	.db 0x06		//use flinch value for bigpush


// ------ Guts Impact
//.org 0x080B2963
//	.db	0x67		//bigpush, applies for normal hit but not command code

.org 0x080B296C
	.db 0x06		//use flinch value for bigpush


// ---------- Chip Changes

// Rook HP 300
.org RookHP		:: .dh 0x0c12

// Random Meteor HP 210
.org RandomMeteorHP	:: .db 0xD2

// Hole Meteor HP 210
.org HoleMeteorHP	:: .db 0xD2

// Shot Meteor HP 210
.org ShotMeteorHP	:: .db 0xD2

// Needlers' HP 150
.org NeedlerV1HP	:: .db 0x96 	;v1
.org NeedlerV2HP	:: .db 0x96 	;v2
.org NeedlerV3HP	:: .db 0x96 	;v3

// Team1 HP 150
.org Team1HP		:: .db 0x96

// PoisonMask 40
.org PoisonMaskHP	:: .db 0x28


// Prism 400 HP
.org 0x080DFC38
	mov		r0,64h
	lsl		r0,2h

// prevent prism from resetting its HP to max every frame
.org 0x080DFCAA
	nop
	nop

//prism doesn't spread damage from the attack that destroys it


.if IS_PVP
//Nerf to Sensor series framedata

.org 0x080E787E		//sensor wait time after being spawned
	mov		r0,3Ch

.org 0x080E7818		//sensor series object duration
	.dh		0x1A4

.else
.endif


// -------------- Damage Changes ---------

// Poltergeist
.org PoltergeistAtk
	.db 0x46	//70 dmg

// Muramasa cap at 500
.org MuramasAtk1
	lsl r1,r1,1h
.org MuramasAtk2
	nop


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

//actually change the hitbox element for magnums
.org MagnumElem		:: .db 0x00

// Guardian Null
.org GuardianElem	:: .db 0x00

// Sensor series Null
.org 0x080E77D4
	mov		r0,0h



//====================================================================
//====================================================================


.if IS_PVP


//make all versions of rope point to the lowest stun time
//this was tested and the plantman navichip doesn't use this code
.org RopeStunTime
	mov		r0,30h


// ------ Rope
//.org 0x08238B28 :: .db 0x 	;startup 1
//.org 0x08238B3C :: .db 0x 	;startup 2
.org RopeSL1		:: .db 0x04 	;pre attack 1
.org RopeSL2		:: .db 0x06 	;pre attack 2
//.org 0x08238B78 :: .db 0x 	;???
.org RopeEL1		:: .db 0x04 	;endlag
.org RopeEL2		:: .db 0x04 	;recoil 1
.org RopeEL3		:: .db 0x04 	;recoil 2
.org RopeCL			:: .db 0x14 	;CL


// ------ Magnum
.org MagnumV1Spd	:: .db 0x18 	;v1 cursor speed
.org MagnumV2Spd	:: .db 0x18 	;v2 crsr spd
.org MagnumV3Spd	:: .db 0x08 	;v3 crsr spd
.org MagnumVisuals	:: .db 0x19 	;crsr sprite keyframe cycle

// ------ MetalMan

.org MetalManIW		:: .db 0x3c 	;IW




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
	mov		r6,1Eh	//first hit, weak
	nop
	nop
	nop
.org 0x080CA2D4
	mov		r6,0h	//second hit, use normal atk val (boostable)
	nop

//extra wheels from the highest tier command code
.org 0x080CA34A
	mov		r6,28h
	nop
	nop
.org 0x080CA356
	mov		r6,28h
	nop
	nop
// B + Left command
.org 0x080CA0D6
	mov		r6,32h	//this damage is added to the normal atk value (boostable)
	nop



//185 LavaStage 25
.org LavaPanelAtk	:: .db 0x19


// Balance HP reduction
.org BalanceHPMath
	bl	BalanceHPReduction	

//Shake: fix damage override exploit
.org 0x080E7B34
	ldrh	r6,[r5,2Ch]



// Friendly Viruses
;disable redistributing food
	.org FVRedist1 :: .dh 0x0000
	.org FVRedist2 :: .db 0x00
;disable feeding virus
	.org FVFeeding :: .db 0x00 ;max virus food
;branch if max not reached, change to unconditional branch
	.org FVBranch :: .dh 0xE00D 
;value to increase FV atk by when feeding
	.org FVAtkPlusVal :: .db 0x00 



;change value check for skipping FV version
.org LoadFVLogic
cmp r2,1h
bge 80CBD96h

//181 KillerEye
	.org KllrEyeOmega :: .db 0x00 	;omega 0
	.org KllrEyeElem :: .db 0x00 	;elem actually be null
//speed values
	.org KllrEyeStartSpd :: .db 0x1E	;first cycle delay
	.org KllrEyeCycleSpd :: .db 0x1E	;cycle speed
	.org KllrEyeCursorSpd :: .db 0x1E ;laserdot timing

//182 Scuttle
	.org ScuttleBeamAtk :: .db 0x82 ;beam 130
	.org ScuttleFireAtk :: .db 0x64 ;fire 100
	.org ScuttleIceAtk 	:: .db 0x82 ;ice 130
	.org ScuttleElecAtk :: .db 0x5A ;elec 90
	.org ScuttleVineAtk :: .db 0x00 ;vine 0
	.org ScuttleOmegaAtk :: .db 0x00 ;omega 0
//speed values
	.org ScuttleCycleSpd :: .db 0x0C ;cycle speed
	.org ScuttleStartSpd :: .db 0x0C ;stall speed at first



// Custom Sword damage logic
.org CustSwordAtkLogic1
	b 		8010632h

.org CustSwordAtkLogic2
	sub 	r1,0h
	mov 	r0,4Bh

.org CustSwordAtkLogic3
	add 	r0,38h



//-------------------- Flinch changes

// ------ Pawn 		;flinch
//.org 0x080D66D3 :: .db 0x01 	;FL
//disabled because it affects longsword and probably isn't necessary anyways

// ------ Meteor
.org MeteorFlinch :: .db 0x01 	;FL

// ------ LavaStage
.org LavaPanelFlinch :: .db 0x01 	;FL

// ------ Guts Machinegun
//.org GutsMachGunFlinch :: .db 0x00		;final hit



.else
.endif

// ------ Bomb Throw
.org BombThrowFlinch :: .db 0x01 	;FL




