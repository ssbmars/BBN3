

//	=== SECTION ORDER ===

//	unique NCP edits

//	system changes to NaviCust

//	edited NCP shapes (also HP+ value & text changes)

//	ModTools changes






//	UNIQUE NCP EDITS


//FastGauge ncp, less extreme gauge values

//fast
.org 0x08006D38
	mov		r1,38h
//slow
.org 0x08006D3E
	mov		r1,14h

.org 0x08006D2C
	bl		CompareGauge
	nop		




//	Hook ATK+ routine to also affect WeaponLvl
.org 0x0803CBDE
	bl		AtkPlusPart

//	do the same for BusterMax
.org 0x0803CC40
	bl		BusterMaxAtk



//	Hubbatch
.org HubBatchArmor
	.db 0x02 	;grant LiteArmor instead of SuperArmor
.org HubReplacedSpace1
	nop :: nop :: nop :: nop :: nop :: nop :: nop	;no mega+

//apply HP reduction without it being a bug
	bl		HubBatchHPRoutine

.org HubReplacedSpace2
	nop :: nop :: nop :: nop 	;no floatshoes

//Hub's custom+ routine
.org HubCustom
	bl		cust1

// New HP reduction
.org HubHPHook
bl HubHP

//Disable HubBatch's bug effect
.org HubBatchBugCheck
	nop





//	Reg+1 NCPs

//add hardcoded value to mb (+1)
.org 0x0803CBAE
	add r1,r0,1h

//set MB limit to 8MB
.org 0x0803CBB2
	cmp		r7,8h		//max of 8MB total MB

.org 0x0803CBB6
	nop
	mov		r1,3h		//max of +3MB





//antidamage (framedata applies to chip too)
.org 0x080b2152 :: .db 0x1A 	;active time
.org 0x080B216C :: .db 0x28 	;cooldown on miss
.org 0x080B22FE :: .db 0x10 	;throw endlag
.org 0x080B2352 :: .db 0x06 	;cooldown on hit
.org 0x080B5295 :: .db 0xE0 	;disable antispam
.org 0x08340958 :: .db 0x7D 	;plushie despawn time
//animation frames
.org 0x0823895C :: .db 0x00 	;standing in air, remove
.org 0x08238970 :: .db 0x01 	;arms folded
.org 0x08238984 :: .db 0x00 	;hand out pre blur, remove
.org 0x08238998 :: .db 0x02 	;hand smear
.org 0x082389AC :: .db 0x00 	;hand out 1, remove
.org 0x082389C0 :: .db 0x00 	;hand out 2, remove

//startup animation when hit
.org 0x080B21C0
	mov		r0,0Bh		//assign movement animation
//wait time before disappearing
.org 0x080B21CE
	mov		r0,3h
//wait time before reappearing
.org 0x080B2210
	mov		r0,1h

//Make AntiDmg (chip) wait to fire until idle
.org AntiDmgQueueHook
	bl		AntiDmgQueue
	beq		.+6Ch
	bl		AntiDmgExtraSpace


.org AntiDmgChipBarrierCheckHook
	bl		AntiDmgBarrierCheck
	nop

.org AntiDmgNCPBarrierCheckHook
	bl		AntiDmgBarrierCheck
	nop





//reflect / shield
//.org 0x080B140E :: .db 0x1A	;active defense
.org 0x080B1582 :: .db 0x01	;action state after endlag 1
//.org 0x080B1564 :: .db 0x12	;endlag 2 value

.org 0x080B1564		//set cooldown based on whether you successfully blocked something
	bl		ShieldMissCheck


//block
.org 0x080B1248
	bl	BlockStartup

.org 0x080B1262
	bl	BlockCooldown
	nop :: nop







//-------- Navi Customizer Changes


//Toggle NCP compression

.org 0x0803B830
	bl		CompressionToggle

.org 0x0803B834
	b		803B84Ch


//	Single-press NCP compression

.org 0x080380AE
	ldrh	r0,[r7,2h]
	.skip 6
	nop

.org 0x0803B80C :: nop
.org 0x0803B81C :: nop
.org 0x0803B82C :: nop




//	Disable Compression


// SuperArmor
.org 0x0803A960 :: .db 0xFF

// BreakBuster
.org 0x0803A968 :: .db 0xFF

// BreakCharge
.org 0x0803A970 :: .db 0xFF

// SetGreen
.org 0x0803A978 :: .db 0xFF

// SetIce
.org 0x0803A980 :: .db 0xFF

// SetLava
.org 0x0803A988 :: .db 0xFF

// SetSand
.org 0x0803A990 :: .db 0xFF

// SetMetal
.org 0x0803A998 :: .db 0xFF

// SetHoly
.org 0x0803A9A0 :: .db 0xFF

// Custom 2
.org 0x0803A9B0 :: .db 0xFF

// MegaFolder 2
.org 0x0803A9C0 :: .db 0xFF

// Block
.org 0x0803A9C8 :: .db 0xFF

// Shield
.org 0x0803A9D0 :: .db 0xFF

// Reflect
.org 0x0803A9D8 :: .db 0xFF

// ShadowShoes
.org 0x0803A9E0 :: .db 0xFF

// FloatShoes
.org 0x0803A9E8 :: .db 0xFF

// AntiDamage
.org 0x0803A9F0 :: .db 0xFF

// Press
.org 0x0803A9F8 :: .db 0xFF

// EnergyChange
.org 0x0803AA00 :: .db 0xFF

// Alpha
.org 0x0803AA08 :: .db 0xFF

// SneakRun
.org 0x0803AA10 :: .db 0xFF

// OilBody
.org 0x0803AA18 :: .db 0xFF

// Fish
.org 0x0803AA20 :: .db 0xFF

// Battery
.org 0x0803AA28 :: .db 0xFF

// Jungle
.org 0x0803AA30 :: .db 0xFF

// Collect
.org 0x0803AA38 :: .db 0xFF

// AirShoes
//.org 0x0803AA40 :: .db 0xFF

// UnderShirt
.org 0x0803AA48 :: .db 0xFF

// FastGauge
.org 0x0803AA50 :: .db 0xFF

// Rush
.org 0x0803AA58 :: .db 0xFF

// Beat
.org 0x0803AA60 :: .db 0xFF

// Tango
.org 0x0803AA68 :: .db 0xFF

// BugStop
.org 0x0803AAB8 :: .db 0xFF

// Humor
.org 0x0803AAC0 :: .db 0xFF

// BlackMind
.org 0x0803AAC8 :: .db 0xFF

// GigaFolder
.org 0x0803AAD8 :: .db 0xFF

// HubBatch
.org 0x0803AAE0 :: .db 0xFF

// DarkLicense
//.org 0x0803AAE8 :: .db 0xFF

// RUN! button
.org 0x0803AAF0 :: .db 0xFF










//	Alternate Shape NCPs


// Hubbatch 
.org 0x0803A8F3 :: .db 0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,0,1,0,0,0,0,1,0,0,0


//	Custom 1
.org 0x0803A1EB :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0


//	Megafolder 1
.org 0x0803A24F :: .db 0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0


//	AirShoes
.org 0x0803A50B :: .db 0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0

//	BusterMax
.org 0x0803A88F :: .db 0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0


//	DarkLicense
.org 0x0803A925 :: .db 0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0




//	These NCPs are given only one shape


//	SuperArmor
.org 0x0803A0F1 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0


//	BreakBuster
.org 0x0803A123 :: .db 0,0,0,0,0,1,1,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0


//	BreakCharge/SetElemPanel
.org 0x0803A155 :: .db 0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0


//	SetLava
.org 0x0803A187 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0


//	SetHoly
.org 0x0803A1B9 :: .db 0,0,1,0,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0


//	Custom 2
.org 0x0803A21D :: .db 0,0,0,0,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0


//	MegaFolder 2
.org 0x0803A281 :: .db 0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0


//	Block
.org 0x0803A2B3 :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	Shield
.org 0x0803A2E5 :: .db 0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0


//	Reflect
.org 0x0803A317 :: .db 0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0


//	ShadowShoes
.org 0x0803A349 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	FloatShoes
.org 0x0803A37B :: .db 0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0


//	AntiDmg
.org 0x0803A3AD :: .db 0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0


//	Beat
.org 0x0803A5D3 :: .db 0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0


//	Undershirt
.org 0x0803A53D :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	FastGauge
.org 0x0803A56F :: .db 0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0


//	Rush
.org 0x0803A5A1 :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	Tango
.org 0x0803A605 :: .db 0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0


//	BugStop
.org 0x0803A7F9 :: .db 0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0


//	GigaFolder 
.org 0x0803A8C1 :: .db 0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0




//	Plus Shape NCPs


//	Reg+
.org 0x0803A731 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0

//	ATK+ parts
.org 0x0803A763 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	WeaponLevel
.org 0x0803A637 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0





//	HP + parts

;HP 100 -> 50
.org 0x0803CB58 :: add r0,0Ah
.org 0x0803A669 :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


;HP 200 -> 100
.org 0x0803CB6C :: add r0,14h
.org 0x0803A69B :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0


;HP 300 -> 200
.org 0x0803CB80 :: add r0,28h
.org 0x0803A6CD :: .db 0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0


;HP 500 -> 400
.org 0x0803CB94 :: add r0,50h
.org 0x0803A6FF :: .db 0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0



//	Non-combat NCPs


//	Humor
.org 0x0803A82B :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	BlackMind
.org 0x0803A85D :: .db 0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	Collect
.org 0x0803A4D9 :: .db 0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0


//	Alpha
.org 0x0803A443 :: .db 0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0


//	SneakRun
.org 0x0803A475 :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0


//	OilBody/Fish/Battery/Jungle
.org 0x0803A4A7 :: .db 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0





//==================
//======================
//======	 =====					MODTOOLS
//======================
//==================



.if IS_PVP

//make ERROR codes accept blank entry
.org 0x0803AC90
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717
.dd 0x1717171717171717 :: .dd 0x1717171717171717



//overhaul EX codes

.org 0x0803B98F	:: .db 0xFF		//this allows it to accept empty spaces


EXoffset	EQU		0x0803AD78


//disabled EX codes
//must be done before setting custom EX codes

.org 0x0803AD78
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D
.dd 0x1D1D1D1D1D1D1D1D :: .dd 0x1D1D1D1D1D1D1D1D


//NEW EX CODES


//HP+300 EX
//"HP1"
.org EXoffset+(8 * 4) :: .db 0x1C,0x06,0x10,0x17,0x17,0x17,0x17,0x17

//HP+600 EX
//"HP2"
.org EXoffset+(8 * 10) :: .db 0x1C,0x06,0x05,0x17,0x17,0x17,0x17,0x17

//SuperArmor EX
//"SA"
.org EXoffset+(8 * 13) :: .db 0x03,0x07,0x17,0x17,0x17,0x17,0x17,0x17

//BreakBuster EX
//"BB"
.org EXoffset+(8 * 14) :: .db 0x0E,0x0E,0x17,0x17,0x17,0x17,0x17,0x17

//BreakCharge EX
//"BC"
.org EXoffset+(8 * 15) :: .db 0x0E,0x15,0x17,0x17,0x17,0x17,0x17,0x17

//FloatShoes EX
//"FS"
.org EXoffset+(8 * 17) :: .db 0x1B,0x03,0x17,0x17,0x17,0x17,0x17,0x17

//AirShoes EX
//"AS"
.org EXoffset+(8 * 18) :: .db 0x07,0x03,0x17,0x17,0x17,0x17,0x17,0x17

//UnderShirt EX
//"US"
.org EXoffset+(8 * 19) :: .db 0x19,0x03,0x17,0x17,0x17,0x17,0x17,0x17

//Shield EX
//"S"
.org EXoffset+(8 * 21) :: .db 0x03,0x17,0x17,0x17,0x17,0x17,0x17,0x17

//Reflect EX
//"R"
.org EXoffset+(8 * 22) :: .db 0x00,0x17,0x17,0x17,0x17,0x17,0x17,0x17

//AntiDmg EX
//"AD"
.org EXoffset+(8 * 23) :: .db 0x07,0x12,0x17,0x17,0x17,0x17,0x17,0x17

//MegaFolder1 EX
//"M1"
.org EXoffset+(8 * 24) :: .db 0x11,0x10,0x17,0x17,0x17,0x17,0x17,0x17

//MegaFolder3 EX
//"M2"
.org EXoffset+(8 * 32) :: .db 0x11,0x05,0x17,0x17,0x17,0x17,0x17,0x17



.else
.endif

















