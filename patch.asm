

.gba


ALL_STAR_CODES	EQU	0




.if IS_ENG
	.open "rom\bn3blue.gba","rom\output.gba",0x8000000
	.loadtable "tp\plugins\bn3-utf8.tbl"
	.include "asm\bn3b_sym.asm"
	.include "asm\bn3plus\boffsetsblueus.asm"	//prof9's bn3plus EQU definitions file 
.else
	.open "rom\exe3black.gba","rom\output.gba",0x8000000
	.loadtable "tp\plugins\exe3-utf8.tbl"
	.include "asm\exe3b_sym.asm"
.endif

	.sym off

.if	AM_DEBUGGING
	.include "asm\debugging.asm"
	.else
.endif

.if IS_PVP
	.include "asm\pvp_qol.asm"
	.else
.endif


//These files are always included

//These 2 will define symbols that other files are dependent on, so they must be ran first
.include "asm\expanded_space.asm"


.include "asm\library_EQU.asm"
.include "asm\chip_manifest.asm"
.include "asm\attack_edits.asm"
.include "asm\NCP_edits.asm"



	.sym on


//this symbol is only defined in the build script that generates the .bps files
.ifdef IS_BN3PLUS
	.include "asm\bn3plus\bbn3plus.asm"
.endif




//===============	Aesthetic/visual/sprite changes



/*
//use white version menu palette
.org 0x087C9950
	.import "rom/bn3white.gba", 0x7C9D64, 0x40

.org 0x087CB214
	.import "rom/bn3white.gba", 0x7CB628, 0x40
*/



// Boot into a black screen (this is one of the earliest opcodes ran by the game)
.org 0x080000C0
	.arm
	ldr		r0,=DarkBoot1
	bx		r0
	.pool
	DarkBoot1Return:
	.thumb


// maintain the black screen 
.org 0x0800043E
	mov r1,40h
.org 0x0802B36C
	mov r1,40h
	// logo fade in
.org 0x08005351
	.db 0xFF
	.db 0xFF
	// first few frames before anything is drawn
.org 0x08000104
	.arm
	ldr		r0,=DarkBoot2
	bx		r0
	.pool
	nop
	DarkBoot2Return:
	.thumb



//new font injections

.if IS_PVP

.org 0x087DE080
	.import "art/EXkeys.bin"

.org 0x087DE950
	.import "art/EXnumbers.bin"

.org 0x0867B558
	.import "art/EXdialognums.bin"
.else
.endif

.org 0x0867BB20
	.import "art/chip_desc_icons.bin"


//repoint to read new sprite source
.org 0x0800601C
	.dw BattleTextWithTrapSprites
	.skip 4 	//these bytes are for destination address, this goes unmodified
	.dh	0x230	//value for amount of words (4 bytes) to copy	//og is 0x1B0


// --------

//prevent overwriting temporary trap details
.org 0x0800FF36
	nop


// -------- Library chip organization
.if IS_PVP


// always treat the library list as if it has the max amount of each chip type
	//mega
	.org 0x080368E6
		cmp		r0,r0
	.org 0x08030512
		cmp		r0,r0
	//giga
	.org 0x080369C2
		cmp		r0,r0
	.org 0x0803059A
		cmp		r0,r0
	//PA
	.org 0x08030622
		cmp		r0,r0
	.org 0x08036A9E
		cmp		r0,r0

// Mega chips
	// show and count only valid Megachips in the library
	.org 0x080017BC
		bl	LibraryMegaValid
	// copy the value of the other megachip counting routine to limit the amount of slots
	.org 0x08036686
		bl	LibraryGetMegaCount
	//disable what may be a check to skip punk
	.org 0x080017B0
		nop
		nop
		nop
	.org 0x080365F4
		nop
		nop
		nop

// Standard chips
	.org 0x0803657C
		bl		LibraryStandardCheck
	// remove blank spots in the standard library
	.org 0x080365CA
		bl		LibrarySortStandard
	
	.org 0x0800177E
		bl		LibraryStndValid

// Giga chips
	// count only valid gigas
	.org 0x08001800
		bl		LibraryGigaValid
	// fetch the # of valid gigas to use as max giga count
	.org 0x0803675C
		bl	LibraryGetGigaCount

	// disable a check to hide Bass+
	.org 0x08001A4C
		cmp		r1,1h

// Program Advances
	// hide and don't count invalid PAs
	.org 0x080367B8
		bl	LibraryValidPA
		nop
		nop
		nop
		nop
	
	.org 0x0803682C
		bl	LibraryGetPACount
	
	//disable an antiquated PA routine to free up some cycles
	.org 0x08035FE0
		nop
		nop
		nop


// PA cleanup
	// Spreader PA: only show the 1 PA combination
	.org 0x08035E6D
		.db 0x01
	// BigHeart PA: 2 combinations
	.org 0x08035E7A
		.db 0x02
	// GutsShoot PA: 2 combinations
	.org 0x08035E7B
		.db 0x02
	// ZStepCros PA: 2 combinations
	.org 0x08035E6B
		.db 0x02



.endif



//===============	 Quality of Life Changes


// Make it accept the A button at the start screen
.org 0x08022250
	mov		r1,9h

//Make HP visually drain faster, from tutorial
.org HPspeed
	.db 0x09



//show traps on custom screen

.org 0x0801051C		::	ShowBattleData:
.org 0x0801052C		::	HideBattleData:

//Toggle with Select
.org 0x0800EACA
	bl	CustSelectLoop
	nop
	nop
	nop


//Show while waiting after closing cust
.org 0x0800935E
	bl	ClosingCustScreen		//replaces the original branch address with a custom routine




.org EquipStoryNCPsHook
bl 		EquipStoryNCPs

//turn the tiny road press check into a story flag check
.org 0x0812D93A
	bl		PressFlagCheck
	nop




//===============	 PVE-specific



//	add Punk's chip to his drop table
.org 0x08018F88
	.dh 0x0710


//allow white gigas to appear in shops (skip the ID check)
.org 0x08001A66
	b 	.+1Eh
.org 0x08044B28
	.dh 0x137,0x137,0x137,0x137,0x138,0x138

//add white giga chips to various shops

.org 0x0804503A		//navirecycle in higsby shop
	.db 0x30,0x1,codeSTAR,0x0,0xE8,0x3
	//cost value is: 0xE8,0x3

.org 0x08044D22		//balance in yoka square shop
	.db 0x34,0x1,codeY,0x0,0xDC,0x5
	//cost value is: 0xDC,0x5

.org 0x08044E52		//bass in undernet 2 bugfrag shop (via hades isle gargoyle)
	.db	0x32,0x1,codeX,0x0,0x96,0x0
	//cost value is: 0x96,0x0

.org 0x08044ED0		//alpharm sigma in undernet 6 shop
	.db 0x2,0x1,0x31,0x1,codeV,0x0,0x2C,0x1
	//cost value is: 0x2C,0x1

.org 0x08044F9A		//meteors in secret area 2 shop
	.db 0xD4,0x0,codeR,0x0,0xD2
	//cost value is: 0xD2 

.if IS_PVP
.else


/*  might be causing problems

	//Prof.9's Colorful Internet hack	(for pve version)
	.org 0x0802A89C
		ldr	r0,=ColorfulInternet|1b
		bx	r0
		.pool
*/







	//N1-FldrA with varsword PA
	.org 0x0800CE02	//longsword R, VarSwrd B,D
		.db	0x11,0x00,0x26,0x00,0x01,0x00,0x26,0x00,0x03,0x00
	.org 0x0800CE22	//AreaGrabs, code E,A
		.db 0x04,0x00,0x82,0x00,0x00
	.org 0x0800CDF0	//2 mole D
		.db 0xA2,0x00,0x03,0x00,0xA2,0x00,0x03,0x00

//XtraFolder
.org 0x0800D08C
	.dd  0x0001001400010014 :: .dd  0x001A0014000D0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014


//next style change happens in 50 fights
.org 0x8015C7A
	mov r2,18h

//allow unlocking ground style

.org 0x08015D0A		//select random style?
	nop
	nop

.org 0x08015EAC		//prevent clearing style points from ground
	nop
	nop

.org 0x08015CE6		//prevent clearing style points from ground AGAIN
	nop
	nop

.org 0x08015E2A		//place ground style points into stack
	bl	CountGroundStyle



//	level up styles faster (100 battles to hit max level for each style)

//	Guts, 3
.org 0x0800D7B9
	.db 0x1E, 0x1E, 0x28

//	Custom, 3
.org 0x0800D7BD
	.db 0x1E, 0x1E, 0x28

//	Team, 3
.org 0x0800D7C1
	.db 0x1E, 0x1E, 0x28

//	Shield, 3
.org 0x0800D7C5
	.db 0x14, 0x1E, 0x32

//	Ground, 4
.org 0x0800D7C9
	.db 0x14, 0x14, 0x1E, 0x1E

//	Shadow, 3
.org 0x0800D7CD
	.db 0x14, 0x1E, 0x32

//	Bug, 2
.org 0x0800D7D1
	.db 0x32, 0x32



//pve-friendly MB (RegMem) value scaling
.org 0x0802B18A
	mov		r6,64h
	add		r6,r7
	ldrb	r2,[r6]
	//6 lines available
	add		r0,r1
	lsr		r0,3h
	lsr		r2,2h
	add		r0,r2
	add		r0,2h
	nop
//max: 0A 0C 04


//skip tutorial
.org 0x080045EA
	mov		r0,1h
	.skip 6
	nop
	.skip 2
	nop
	mov		r0,0h
	.skip 6
	nop
	.skip 6
	nop
	.skip 6


//use part of an openmode routine to add MistMan to the library at game start
.org 0x08004680
	;Set main hook that triggers when you press new game
	ldr r0,=mistRoutine|1b
	bx r0
.align 4
.pool


.endif


//===============	 System Changes


//Allow wind push/pull while stunned
.org 0x080AD794
	.dh 0x2A28


//Time Freeze Parry length
.org tfpWindow
	mov		r0,6h


//	use an expanded table for flinch properties
//	this repoints to a table in free space, allowing for additional flinch combinations 
.org 0x080AF18C
	.dw MegaFlinchTable

// new table for bosses and viruses
.org 0x080AF188
	.dw	BossFlinchTable


// don't waste a turn trying to run from fights you can't run from
.org 0x0800E58C
	bl		NoTimeToRun
	tst		r0,r0
	beq		.+08h




.org MegaWhiteFlashVal
	.db 0x0A 	;visual white flash time (megaman)
.org MegaFlashVal
	.db 0x3C 	;flashing (invis) time (megaman)

.org BossWhiteFlashVal
	.db 0x0A		;visual white flash time (bosses)
.org BossFlashVal	
	.db 0x3C		;flashing (invis) time (bosses)



.if IS_PVP



//comm menu: open immediately to netbattle prompt
.if IS_PVP
	.org 0x0803E37A
		mov		r0,24h
	.org 0x0803E37E
		mov		r0,66h
	.org 0x0803E382
		mov		r0,6Fh
	//exit menu from netbattle select
	.org 0x0803E5F8
		bl	803E578h
.endif

// fix the exit routine setting HP to zero by reading from uninitialized memory
// (set HP by reading max HP value instead)
.org 0x0803E452
	nop
	ldrh	r1,[r7,22h]


//hook: when pressing Start in battle, do not pause if it is pvp
.org 0x08006B8A
	bl	pvpPauseCheck


//hook to change boss flinch
//tested on plantman
.org BossFlinchHook
	bl		BossFlinch


//[experiemental] increase startup lag for boss movement, tested on plantman
.org 0x080B95A8
	mov		r0,6h
.org 0x080B95EE
	mov		r0,6h

.org 0x080B95C4
	bne		80B95F6h

.else
.endif


.org TimeFreezeFadeTime
	mov r0,1Eh 	;reduced fade-in time on timefreeze

.org CapcomScreenWaitTime	//logo boot start
	mov	r0,6h


//don't clear previous hand when using ADD option in custom screen
.org ADDClearHand
	nop
	nop



//make drag effects pierce superarmor
//hook to allow the armor check to read the hit type and bypass armor if the type is drag
.org NewArmorCheckHook
	nop
	.skip 2
	bl		NewArmorCheck


.org 0x080B4E5C
	bl		BigPushFlinch



//11th Chip Glitch Fix
//cust+1
.org Cust1Hook
	bl 		cust1
//cust+2
.org Cust2Hook
	bl 		cust2

// validate cust+ whenever opening the custom screen
.org CustomSizeCheckHook
	bl		CustomSizeCheck

// replace the routine that moves the cursor
.org CursorRightHook
	bl	CursorMove
.org CursorDownHook
	bl	CursorMove
.org CursorUpHook
	bl	CursorMove


// hook to replace object deletion with 10 extra dmg when hit by breaking
.org ObjectBreakHook
bl 		objectbreak
strh 	r0,[r5,24h]

// do it again for Guardian
.org ObjectBreakHook2
bl 		objectbreak
strh 	r0,[r5,24h]


// --- bind shield input to Select
.org GuardButtonDefineCheck
nop
lsl 	r6,r2,1Ch
lsr 	r6,r6,1Ch
cmp 	r6,4h
blt 	80B4C7Ch
cmp 	r6,8h
bge 	80B4C7Ch

// --- disable B button combination check
.org GuardButtonComboCheck :: nop


// Make areasteal and metagel hook to the custom check
.org PanelStealHook
bl 		panelsteal

.org MetaGelStealHook
bl 		panelsteal



// hook to the bigpush loop check
.org BigPushCheckHook
bl 		bigpushcheck



// hook to make grabrevenge return panels
.org grabRevengeResetBoardHook
bl 		grabRevengeResetBoard



// disable AntiRecov multiplying the HP reduction by 2
.org 0x080ADC30
	nop 



// ================
// ================ temporary superarmor hook codes are here
// ================

//Temporary Superarmor Code

.org ApplyStunHook
bl 		ArmorStunOn

//.org RemoveStunHook
//bl 		ArmorStunOff

.org RemoveVineStun
	bl 		VineArmorOff


//the zero setter
//hook the routine that sets action state to 0
.org SetAttackActionStateHook
	ldr		r1,=ChipArmorOn|1
	bx		r1
	.pool

//the seven getter
//hook the routine that sets action state back to 7
.org SetIdleActionStateHook
	ldr		r1,=ChipArmorOff|1
	bx		r1
	.pool


.org SuperArmorNCPCheckHook
bl 		SetArmorNCP
nop :: nop :: nop :: nop



// =============----------
// ===============-- StyleChange
// =============----------


.if IS_PVP

//	Style Change Code


//replace the NCPs for elemental virus encounters
;elec
.org BatteryNCPRoutineHook
nop
mov 	r0,1h
bl 		StyleElem

;heat
.org OilBodyNCPRoutineHook
nop
mov 	r0,2h
bl 		StyleElem

;aqua
.org FishNCPRoutineHook
nop
mov 	r0,3h
bl 		StyleElem

;wood
.org JungleNCPRoutineHook
nop
mov 	r0,4h
bl 		StyleElem


// 	Cycle through styles instead of toggling between the 2
.org ToggleStyleHook
bl 		SetStyle


//Custom Style base buff grants +3 custom size
.org CustomValStyleCheckHook
	bl	CustomTeamCheck

//Team Style base buff grants +2 MegaFolder
.org MegaFolderValStyleCheckHook
	mov		r1,7h

//Shield style heal 50HP from shield heal
.org ShieldHealPercentVal
	mov		r1,14h


.else

//PVE: hook to make ElemBody NCPs set the next style element
.org BatteryNCPRoutineHook + 4h
	bl		StyleElemPVE
.org OilBodyNCPRoutineHook + 4h
	bl		StyleElemPVE
.org FishNCPRoutineHook + 4h
	bl		StyleElemPVE
.org JungleNCPRoutineHook + 4h
	bl		StyleElemPVE


//hook to randomize next style element if no ElemBody NCP is installed
.org 0x080473BC
	bl		RandomizeNextStyle
	nop

.endif




// ------------ BN6 chip limit hook


.if IS_PVP

.org ChipLimitValHook
	bl LoadRarity

.org SetStandardChipLimitVal
	nop ;prevents it from clearing the custom chip limit value

.endif



// ------ dynamic invuln chip duration

.org ShadowInvulnTimeVal	;shadow time
	.dh 0x00A0

.org MoleInvulnTimeVal		;mole time
	.dh 0x00B8,0x00C8,0x00D4


.org MoleInvulnTimeHook
	bl		MoleInvulnTime

.org ShadowInvulnTimeHook
	bl		ShadowInvulnTime




// hook fastgauge and slowgauge routine
.org SetGaugeRoutineHook
	ldr		r7,=ChangeGauge|1
	mov		r14,r15
	bx		r7
	b		@@next
	.pool
@@next:
	nop


	//increment turn counter hook
.org IncrementTurnCountHook
	ldr		r0,=TurnCounter|1
	mov		r14,r15
	bx		r0
	b		@@next
	.pool
@@next:
	nop





//folderback nerf

.org FolderBackRoutineHook
	bl		FolderBack



//Hook trap indicator check
//your side
.org PlayerTrapIndicatorHook
	bl		TrapVisualCheck

//opp's side
.org OpponentTrapIndicatorHook
	bl		TrapVisualCheck



//save previous trap when using antimagic
.org TrapResetHook
	bl		TrapReset

//restore previous trap when removing antimagic
.org AntiMagicRestoreTrapHook
	bl		AntiMagicRestoreTrap

//Don't deal damage when piercing Barr/Aura
.org BarrierRemovalHook
	bl		BarrierRemoval
	nop




//hook the collision check to allow aura removal to pierce intangibility
.org CollisionCheckWindHook

	ldr		r3,=CollisionCheckWind|1
	b		@@next
	.pool
	@@next:
	mov		r14,r15
	bx		r3



//hook the TFP cooldown routine
//during cooldown
.org TFPCoolDownHook
	bl		TFPCoolDownResetCheck
//during active window
.org TFPActiveTimeHook
	bl		TFPCoolDownResetCheck




.if IS_PVP

//hook the elemental weakness 2x damage code (reduce to x1.5)
.org 0x080AD90E
	bl		ElemWeakness

.endif


//hook the elec + ice panel 2x damage code (reduce to x1.5 and make it null)
.org 0x080AF422
	bl		IcePanelBonus


//hook the fire + grass panel 2x damage code (make the bonus damage null)
.org 0x080AF414
	bl		GrassPanelBonus




//drag movement routine
.org 0x080B0AF0
	bl		DragShoesCheck

//slide movement routine
.org 0x080AD7E8
	bl		DragShoesCheck










//[EXPERIMENTAL] try to maintain value in memory area so you can apply damage to just barriers beforehand
.org 0x080B4EE8
	bl	KeepBarrierDmg







// ============================== ================ ================================
// ============================                      ==============================
// =========================    Free Space Routines    ============================
// ============================                      ==============================
// ============================== ================ ================================


org 0x08235154 ;Free Space
.area 0xDA8
.align 4







/*

This defines a chunk of free space in the middle of the rom where I can place original code.
Each instruction one after another is just written to the next available byte in the free space.

Nothing that branches to any of this code uses hardcoded addresses, instead they're assigned to labels like " HiThisIsALabel: ". When you see a label like this with a colon right after it, it just broadcasted its address at whatever position it was written, so then other instructions can say something like "branch to HiThisIsALabel" and the compiler will know what that address is supposed to be.

*/



// ==============================================
// ====================================================
// ========================================================== PUT NEW HOOKED CODE HERE



CursorMove:
	push	r14
	ldr		r7,=2034040h
	ldrb	r1,[r7,r0]
	cmp		r1,0xFF
	beq		@@invalid
	ldrb	r1,[r5,9h]
	cmp		r0,r1		// check if greater than current cust size
	bge		@@invalid
	cmp		r0,0Ah		// check if cursor is in farthest position
	bge		@@invalid

	// other parts of the game use the og ver of this routine and evaluate the return from this read,
	// but the instance I'm modifying discards this value after checking if it's 0xFF
	mov		r1,48h
	add		r1,r0
	ldrb	r0,[r5,r1]
	b		@@exit

	@@invalid:
	mov		r0,0xFF
	@@exit:
	pop		r15
	.pool

CustomSizeCheck:
	ldrb	r0,[r6,0Eh]
	cmp		r0,0Bh
	blt		@@valid
	mov		r0,0Ah
	@@valid:
	strb	r0,[r6,0Eh]
	strb	r0,[r7,9h]
	mov		r15,r14


.align
DarkBoot1:
	.arm	// this whole thing is running in ARM mode
	mov		r0,12h
	mov		cpsr,r0
	ldr		r13,=0x3007EA0
	// custom code part
	ldr		r0,=0x04000000
	mov		r1,40h
	strb	r1,[r0]
	add		r0,50h
	mov		r1,0FFh
	strb	r1,[r0]
	mov		r1,10h
	strb	r1,[r0,4h]

	ldr		r0,=DarkBoot1Return
	bx		r0
	.pool
	.thumb



//	changes the color of the screen on the first few frames after the rom is opened
.align
DarkBoot2:
	.arm
	ldr		r13,=3007C00h
	ldr		r0,=4000204h
	ldr		r1,=45B4h
	str		r1,[r0]
	//new code
	ldr		r0,=4000000h
	mov		r1,40h
	strb	r1,[r0]
	add		r0,50h
	mov		r1,0FFh
	strb	r1,[r0]
	mov		r1,10h
	strb	r1,[r0,4h]

	//return
	ldr		r0,=DarkBoot2Return
	//ldr	r0,=8000114h
	bx		r0
	.pool
	.thumb



NoTimeToRun:
	// return with r0 = 1 to not run, 
	// or r0 = 0 to run
	tst		r0,r0
	beq		@@checkbattle	//false = not attempting to run
	b		@@returnfalse

	@@checkbattle:
	ldr		r0,=200188Fh
	ldrb	r0,[r0]
	cmp		r0,7h
	bgt		@@returnfalse
	mov		r0,0h
	mov		r15,r14

	@@returnfalse:
	ldrb	r0,[r5,0Eh]
	strb	r0,[r5,1h]
	mov		r0,1h
	mov		r15,r14

	.pool


offsetGS:
	// horizontal
	mov		r2,18h
	lsl		r2,10h
	mul		r2,r3
	sub		r0,r0,r2
	// vertical
	mov		r2,5h
	lsl		r2,10h
	add		r1,r2
	mov		r15,r14


LibraryValidPA:

	ldr		r3,=140h
	add		r0,r3,r4
	//get chip manifest data without branching
	mov		r1,20h
	mul		r0,r1
	ldr		r1,=chipmanifest
	add		r0,r1

	ldrb	r0,[r0,0Eh]
	cmp		r0,0h
	beq		@@exit
	add		r5,1h
	ldr		r3,=140h
	add		r3,r4
	strh	r3,[r6]
	mov		r0,0h
	strb	r0,[r6,2h]

	@@exit:
	mov		r15,r14
	.pool

LibraryGetPACount:
	mov		r0,r5
	pop		r4-r7
	str		r0,[r5,54h]
	pop		r15





LibrarySortStandard:
	mov		r4,0h
	// r7 = base address of chip ram
	// r6 = current chip address being looked at
	// r4 = amount of address that have been checked
	@@loopstart:
	lsl		r6,r4,2h
	add		r6,r7
	ldrb	r0,[r6]
	cmp		r0,0h
	beq		@@moveup
	b		@@checknext

	@@moveup:
	mov		r3,r4
	mov		r2,4h
	add		r2,r6
	//check if there are multiple empty spaces in a row
	mov		r0,0h
	@@emptycheck:
	ldrb	r0,[r2]
	cmp		r0,0h
	beq		@@isempty
	b		@@moveloop

	@@isempty:
	add		r2,4h
	add		r0,1h	//sanity check, make an easy exit condition
	cmp		r0,9h
	blt		@@emptycheck

	@@moveloop:
	ldrb	r0,[r2]
	strb	r0,[r6]
	add		r2,4h
	add		r6,4h

	add		r3,1h
	ldr		r0,=13Fh
	cmp		r3,r0
	ble		@@moveloop


	@@checknext:
	add		r4,1h
	ldr		r0,=13Fh
	cmp		r4,r0
	ble		@@loopstart

	mov		r0,r5
	pop		r4-r7,r15
	.pool


LibraryStandardCheck:
	//statically increment the chip position (trying an alt method)
	;mov		r6,r5
	;lsl		r6,2h
	;add		r6,r7

	ldrh	r1,[r0,0Eh]
	cmp		r1,0h
	bne		@@seemsfine
	mov		r0,1h
	mov		r1,1h
	b		@@exit

	@@seemsfine:
	//og code
	ldrb	r0,[r0,13h]
	mov		r1,3h

	@@exit:
	mov		r15,r14


LibraryStndValid:
	mov		r1,r0
	ldrh	r0,[r1,0Eh]
	cmp		r0,0h
	bne		@@seemsfine
	mov		r0,1h
	mov		r1,1h
	b		@@exit

	@@seemsfine:
	// og code
	ldrb	r0,[r1,13h]
	mov		r1,3h

	@@exit:
	mov		r15,r14


LibraryGetMegaCount:
	pop		r4-r7
	mov		r0,4Ch
	ldrb	r0,[r5,r0]

	pop		r15

LibraryMegaValid:
	mov		r1,r0
	ldrh	r0,[r1,0Eh]
	cmp		r0,0h
	bne		@@seemsfine
	mov		r1,0h
	b		@@exit

	@@seemsfine:
	// og code
	ldrb	r0,[r1,13h]
	mov		r1,1h

	@@exit:
	mov		r15,r14

LibraryGigaValid:
	mov		r1,r0
	ldrh	r0,[r1,0Eh]
	cmp		r0,0h
	bne		@@seemsfine
	mov		r1,0h
	b		@@exit

	@@seemsfine:
	// og code
	ldrb	r0,[r1,13h]
	mov		r1,2h

	@@exit:
	mov		r15,r14

LibraryGetGigaCount:
	pop		r4-r7
	mov		r0,50h
	ldrb	r0,[r5,r0]

	pop		r15



pvpPauseCheck:
		
		mov		r0,0h
		ldr		r7,=2034EE0h
		//pvp check
		ldrb	r2,[r5,19h]
		cmp		r2,0Ah
		bgt		@@exit
	
		//og code
		ldrh	r2,[r7,4h]
		mov		r1,8h
		tst		r2,r1
		beq		@@check2
	
		mov		r0,0h
		strb	r0,[r5,11h]
		mov		r0,1h
		b		@@exit
	
		@@check2:
		add		r7,18h
		ldrh	r2,[r7,4h]
		tst		r2,r1
		beq		@@exit
	
		mov		r0,1h
		strb	r0,[r5,11h]
		@@exit:
		mov		r15,r14
	
		.pool
	


CountGroundStyle:
	ldrb	r0,[r3,13h]
	mov		r1,46h
	mul		r0,r1
	ldrb	r1,[r3,12h]
	mov		r2,46h
	mul		r1,r2
	add		r0,r0,r1
	str		r0,[sp,10h]

	mov		r15,r14



KeepBarrierDmg:
	add		r0,r1
	ldrh	r1,[r7,18h]
	add		r0,r1
	strh	r1,[r7,18h]

	mov		r15,r14




ClosingCustScreen:
	push	r14

	//show trap display
	mov		r0,40h
	bl		ShowBattleData

	//og code
	lsl		r0,r0,4h
	bl		ShowBattleData
	ldr		r0,=8010A14h
	bl		8000ADCh
	ldr		r1,=200F870h
	mov		r0,0h
	strb	r0,[r1,0Eh]
	pop		r15


/*	this addition was supposed to show your hand while you're waiting for the opponent, but
	the chip icons aren't loaded until the battle begins so this doesn't work as-is
	//show chips in hand

	mov		r0,20h
	bl		ShowBattleData

	//og code follows below
*/





CustSelectLoop:
	push	r2,r14
	mov		r0,40h			//enable displaying opponent's trap
	bl		ShowBattleData

	//og code
	ldr		r0,[r5,40h]
	ldrh	r0,[r0,4h]

	mov		r1,40h
	lsl		r1,r1,4h
	sub		r1,1h
	tst		r0,r1
	beq		@@exit

	//disable displaying opponent's trap when the cust is unhidden
	push	r0,r1,r3
	mov		r0,40h
	bl		HideBattleData
	//clear the trap sprite for your side by using 
	bl		0x08010496
	pop		r0,r1,r3


	@@exit:
	pop		r2,r15









CompareGauge:
	orr		r0,r1
	cmp		r0,3h
	bne		.+4h
	mov		r0,0h
	mov		r15,r14



AirSwordHitboxChooser:
	mov		r2,27h

	ldrb	r1,[r5,4h]
	cmp		r1,8h
	beq		.+6h
	mov		r1,26h
	mov		r15,r14

	mov		r1,6Ah
	mov		r15,r14




BurnerLvlCheck:
	mov		r0,61h
	ldrb	r0,[r5,r0]
	tst		r0,r0
	beq		.+6h
	mov		r0,23h
	b		.+4h
	mov		r0,3Ah

	strb	r0,[r5,10h]
	mov		r15,r14


DragShoesCheck:
	ldr		r3,[r7,4h]

	push	r0,r1
	mov		r1,40h
	lsl		r1,8h
	ldrh	r0,[r5,2Eh]
	tst		r0,r1
	pop		r0,r1
	beq		.+6h
	ldr		r7,=80B57DCh	
	b		.+4h
	ldr		r7,=80B57CCh
	ldrb	r2,[r5,16h]
	lsl		r2,3h
	add		r7,r2
	ldr		r2,[r7]
//	ldr		r3,[r7,4h]
	mov		r15,r14




IcePanelBonus:
	.if IS_PVP
	lsr		r1,1h
	.endif
	ldrh	r0,[r7,1Ah]
	add		r1,r0
	strh	r1,[r7,1Ah]

	mov		r15,r14


GrassPanelBonus:
	ldrh	r0,[r7,1Ah]
	add		r1,r0
	strh	r1,[r7,1Ah]

	mov		r15,r14


ElemWeakness:
	ldrh	r1,[r7,r0]
	push	r0
	lsr		r0,r1,1h
	add		r1,r0
	pop		r0
	mov		r15,r14



BigPushFlinch:

	mov		r1,8h
	tst		r0,r1
	bne		.+8h

	mov		r1,0h
	strb	r1,[r5,1Ch]
	mov		r15,r14

	mov		r1,1h
	strb	r1,[r5,1Ch]
	mov		r15,r14



NewArmorCheck:
	push	r7,r14
	//	decide whether to skip to the end and return "true" to make drag pierce armor
	cmp		r0,4h	//everything with the drag effect will have a value >= 4
	bge		@@exit


	//go to regular armor check but skip line for push r14
	mov		r0,0C0h
	bl		OldArmorCheckSkipR14Push	

@@exit:
	cmp		r0,r0	//must return with the flag for equals = true, so that's what this does
	pop		r7,r14



AntiMagicRestoreTrap:
	str		r0,[r6,2Ch]		//og code

	ldrb	r0,[r7,18h]
	strb	r0,[r7,17h]
	mov		r0,0h
	strb	r0,[r7,18h]

	mov		r15,r14



ChipDisplayFix:
	ldr		r0,[r5,30h]
	ldrb	r0,[r0,5h]
	tst		r0,r0
	mov		r15,r14




AntiDmgBarrierCheck:

	ldr		r1,[r7,54h]		//og code
	orr		r1,r0			//
	str		r1,[r7,54h]		//og code

	mov		r2,40h
	tst		r1,r2

	beq		@@skip

	mov		r0,24h			//check what type of barrier it is
	ldrb	r1,[r6,6h]
	sub		r1,r0,r1
	mov		r0,1h			//set aura timer to 1f
	cmp		r1,0Ch

	ble		.+4h
	mov		r0,0h			//set barr hp to 0
	strh	r0,[r6,16h]

	b		@@end

@@skip:

	//write here to apply damage to barriers, but probably only relevant for when antidmg blocks the hit
/*
	mov		r0,24h
	ldrb	r1,[r6,6h]
	sub		r1,r0,r1
	mov		r0,1h
	cmp		r1,0Ch
*/
	nop


@@end:
	mov		r15,r14





AntiDmgQueue:
	push	r14
	ldrb	r0,[r5,5h]

	// activate on idle state and buster endlag (move cancel window)
	mov		r1,3h
	tst		r0,r1
	bne		@@activate

	// activate if using certain chips
	ldrb	r0,[r5,6h]
	cmp		r0,28h		// slasher
	beq		@@activate
	cmp		r0,2Ch		// poison mask/face
	beq		@@activate

// queue antidmg to fire later
	mov		r0,0h
	b		.+4h

@@activate:
	mov		r0,1h

	tst		r0,r0
	pop		r15


AntiDmgExtraSpace:
	mov		r0,0h
	strh	r0,[r6,18h]
	strh	r0,[r6,1Ah]
	strh	r0,[r6,1Ch]
	strh	r0,[r6,1Eh]

	mov		r15,r14




//this resets the cooldown for TFP if megaman is hit
TFPCoolDownResetCheck:
	
	push	r0
	mov		r0,19h		//set pointer to read shake duration
	ldrb	r0,[r5,r0]
	cmp		r0,1Bh		//check if megaman started shaking within 2 frames
	pop		r0
	bgt		@@reset

	tst		r0,r0
	bmi		@@isneg

	sub		r0,1h
	b		@@continue

@@isneg:
	add		r0,1h			//og code
	b		@@continue

@@reset:
	mov		r0,0h

@@continue:
	strb	r0,[r7,12h]		//og code

	mov		r15,r14







//allow windboxes to pierce intangibility by making an extra routine in the collision check
CollisionCheckWind:


	//skip if entity is not intangible
	tst		r0,r0
	bne		@@skip




	ldrb	r0,[r7,6h]		//character hurtbox, barr/aura value
	tst		r0,r0
	beq		@@skip
	push	r1


	//check for windbox
	mov		r0,40h
	and		r1,r0
	beq		@@dmgcheck

	ldr		r0,[r7,2Ch]
	orr		r0,r1
	str		r0,[r7,2Ch]	
	b		@@popskip


@@dmgcheck:
	ldrh	r0,[r6,14h]		//damage from hitbox
	strh	r0,[r7,18h]		//apply to mem area for damage to barriers

@@popskip:
	mov		r0,0h
	pop		r1

@@skip:
	bic		r0,r2			//og code starts here
	bic		r1,r2
	ldr		r2,=0FE000000h
	add		r3,r2,0
	and		r2,r0
	and		r3,r1
	tst		r2,r3
	mov		r15,r14






BarrierRemoval:

	mov		r0,24h
	ldrb	r1,[r7,6h]
	
	sub		r1,r0,r1
	mov		r0,1h
	cmp		r1,0Ch
	ble		@@store
	//check for bubblewrap
	ldrb	r1,[r7,6h]
	cmp		r1,14h
	beq		@@notleafshield
	mov		r0,0h
@@store:
	strh	r0,[r7,16h]



	ldrb	r1,[r7,6h]
	cmp		r1,24h
	bne		@@notleafshield
	mov		r0,0h
	strb	r0,[r7,6h]
	strb	r0,[r7,0Bh]
	strh	r0,[r7,16h]
	str		r0,[r7,18h]
	pop		r15

@@notleafshield:
	mov		r15,r14



CustomTeamCheck:
	bne		@@notCustom
	mov		r1,8h
@@notCustom:
	cmp		r7,3h
	bne		@@notTeam
	mov		r1,6h
@@notTeam:
	mov		r15,r14


//ATK+ routine, making it also add to the WeaponLvl value
//this runs once for every ATK+ part
AtkPlusPart:
	push	r3,r14

	ldr 	r2,=2005770h	//og code
	strb	r1,[r2,r0]		//og code


	cmp		r1,5h
	blt		@@notguts
	add		r1,1h
	lsr		r1,1h			//calculate full ATK value then divide by 2 and sub 1
	sub		r1,1h			//this gives us what r1 would be if it wasn't guts style

@@notguts:
	//set r1 to 0 if it's an odd number
	mov		r3,1h
	tst		r1,r3
	bne		@@skip	 		//skip incrementing weaponlv if odd number

@@isequal:
	mov		r1,1h			//increment weaponlvl by +1
	mov		r0,0Dh
	ldrb	r3,[r2,r0]		//read current weaponlvl
	add		r3,r1
	cmp		r3,3h			//prevent weaponlvl from overflowing
	ble		@@itgood
	mov		r3,3h

@@itgood:
	strb	r3,[r2,r0]		//store new weaponlvl
@@skip:
	pop		r3,r15



//BusterMax weaponlv hook
BusterMaxAtk:
	ldr		r2,=2005770h
	strb	r1,[r2,r0]


	mov		r1,3h
	mov		r0,0Dh
	strb	r1,[r2,r0]

	mov		r15,r14






TrapReset:
//don't erase active trap when using antimagic
//this is ran when activating a new trap and when antidmg window ends without being triggered


//read if trap is not currently active
	ldrb	r0,[r7,17h]
	cmp		r0,0h
	beq		@@exit


//skip storing if the active trap is antimagic
	cmp		r0,14h
	beq		@@RestoreTrap

//skip storing if the new trap is not antimagic
	ldr		r1,[sp,8h]
	cmp		r1,14h
	bne		@@ClearTrap

//store the current trap so it can be recalled for later
	strb	r0,[r7,18h]

	b		@@ClearTrap

@@RestoreTrap:

//restore previous trap data
	ldrb	r0,[r7,18h]
	strb	r0,[r7,17h]

	mov		r0,0h
	strb	r0,[r7,18h]

	b		@@exit

@@ClearTrap:
	mov		r0,0h			//og code
	strb	r0,[r7,17h]		//og code

@@exit:
	mov		r15,r14





TrapVisualCheck:
//check if the value is AntiMagic, don't change the trap indicator if it is
//for any other trap, display a unique sprite

	ldrb	r0,[r7,17h]	//og code

	cmp		r0,14h
	bne		.+04h
	ldrb	r0,[r7,18h]

	tst		r0,r0
	beq		@@exit

	ldr		r3,=TrapImageAddr -10h
	lsl		r0,2h
	add		r3,r0

@@exit:
	mov		r15,r14

	.pool


FolderBack:

// 1) Creates a list of chips in the folder that can be restored. Reads from the entire folder, not just the used or unused chips. The list contains the chip positions, rather than their raw IDs.

// 2) Shuffles the list that it created, so it can then attempt to add up to 7 chips from that list back into the folder. The shuffle prevents topdecking the chips that get restored. Skips the shuffle step if the list is less than 2 (this avoids a softlock from bad math).

// 3) Goes through the list of chips to restore and checks whether each chip is still in the folder. Does not restore a chip unless it's already been used. Since it's working with folder positions, it's able to check unique position values instead of needing to guess the context based on real chip IDs.

// Extra) The list of invalid chips will need to be reviewed whenever new chips are created or significantly edited in order to ensure their eligibility for being restored still aligns with their chip behavior.

	push	r0-r7,r14

	ldr		r4,=2034100h	//free space to store the list of valid chips

	mov		r0,1Dh
@@checkchipIDloop:
	push	r0
	bl		80114A8h	;get chip ID from position

//	get the ID of a chip based on its position, then check
//	if it's a chip that folderback is allowed to restore.
//	this is a conservative list, friendly viruses are considered invalid
			
	cmp		r0,0CFh		//check if HeroSword, which was changed to Standard
	beq		@@skipmegacheck

	cmp		r0,9Ch		//greatest valid ID, anything greater is invalid
	bgt		@@chipNOTvalid

@@skipmegacheck:
	//compare to a list of specific chip IDs that are considered invalid
	mov		r2,8h		//amount of bytes to check
	ldr		r3,=InvalidChipList
	add		r3,r2
	sub		r3,1h

@@singleIDloop:
	ldrb	r1,[r3]
	cmp		r0,r1
	beq		@@chipNOTvalid

	sub		r3,1h
	sub		r2,1h
	bne		@@singleIDloop


//check for FIRST chunk of back-to-back invalid chip IDs
	mov		r1,79h
@@IDchunkloop1:
	cmp		r0,r1
	beq		@@chipNOTvalid
	add		r1,1h
	cmp		r1,82h
	ble		@@IDchunkloop1


//check for SECOND chunk of back-to-back invalid chip IDs
	mov		r1,85h
@@IDchunkloop2:
	cmp		r0,r1
	beq		@@chipNOTvalid
	add		r1,1h
	cmp		r1,90h
	ble		@@IDchunkloop2


//we get here if none of the above code branches past here
@@chipvalid:
	pop		r0
	strb	r0,[r4]
	add		r4,1h

	b		@@skip_pop

@@chipNOTvalid:
	pop		r0
@@skip_pop:
	sub		r0,1h
	bne		@@checkchipIDloop


//note the end of the valid chip list by putting an FF byte
	mov		r0,0FFh
	strb	r0,[r4]


	//	check whether any chips will be returned
	//	skip the shuffle if there are less than 2 items in the list
	ldr		r0,=2034100h
	cmp		r4,r0
	beq		@@nothingtoshuffle
	sub		r4,1h
	cmp		r4,r0
	beq		@@nothingtoshuffle

	//shuffle the results
	sub		r1,r4,r0
	mov		r2,r1
	bl		8000C7Eh
@@nothingtoshuffle:


//	=================

//	count how many chips have already been used

	mov		r2,0h
	ldr		r3,=203405Dh

@@countmissingloop:		//count the amount of chips that have been used
	ldrb	r1,[r3]
	cmp		r1,0FFh
	bne		@@restorechips

	add		r2,1h
	sub		r3,1h
	b		@@countmissingloop

@@restorechips:

	mov		r0,1Eh
	sub		r2,r0,r2	//make r2 = amount of remaining chips

	mov		r6,7h		//max amount of chips to restore
	ldr		r4,=2034100h

@@readnewchip:
	mov		r5,0h
	ldrb	r0,[r4]
	cmp		r0,0FFh
	beq		@@nomoreIDs

	ldr		r3,=2034040h
@@checkloop:
	ldrb	r1,[r3]
	cmp		r0,r1		
	bne		@@continue

	add		r4,1h
	b		@@readnewchip

@@continue:
	add		r5,1h
	add		r3,1h
	cmp		r5,r2
	blt		@@checkloop

	add		r2,1h
	cmp		r1,0FFh
	bne		@@notempty
	sub		r3,1h

@@notempty:
	strb	r0,[r3]
	add		r4,1h

	sub		r6,1h
	beq		@@nomoreIDs

	b		@@readnewchip


@@nomoreIDs:
	//shuffle the chips before opening custom screen
	ldr		r0,=2034040h
	mov		r1,r2
	bl		8000C7Eh


	pop		r0-r7,r15


.align 4
InvalidChipList:

.db 0x26,0x29,0x37,0x38,0x39,0x4C,0x4D,0x99

.pool






BlockStartup:
	ldrb	r2,[r0,5h]		//og code
	orr		r2,r1			//og code
	strb	r2,[r0,5h]		//og code

	mov		r0,0h
	str		r0,[r5,78h]

	push	r7
	ldr		r7,[r5,68h]

	// make a record of current HP so it can be checked later
	ldr		r0,[r7,50h]	
	strh	r0,[r5,22h]

	pop		r7
	mov		r15,r14


BlockCooldown:
	push	r14,r0-r1,r7
	ldrb	r2,[r0,5h]
	bic		r2,r1
	strb	r2,[r0,5h]


	ldr		r7,[r5,68h]

	ldrh	r0,[r5,22h]		//previous damage
	ldr		r1,[r7,50h]		//current damage

	cmp		r1,r0
	bgt		@@lowcooldown

	//set endlag state
	mov		r0,1h
	strb	r0,[r5,5h]
	mov		r0,5h
	strb	r0,[r5,6h]
	mov		r0,8h
	strb	r0,[r5,7h]


	mov		r0,0Ah		//endlag duration
	mov		r1,22h
	strh	r0,[r5,r1]

	ldr		r7,[r5,68h]	//fetch correct idle animation for style
	ldrb	r0,[r7,7h]
	strb	r0,[r5,10h]

	b		@@exit

@@lowcooldown:
	mov		r14,r15
	bl		80B4782h


@@exit:	
	pop		r15,r0-r1,r7



//Read a byte to check whether the shield blocked anything while active
ShieldMissCheck:

	ldr		r1,[r5,78h]		//byte set by shields when they block something
	tst		r1,r1
	bne		@@lowcooldown	//sets a low cooldown value if the shield has blocked something
	mov		r0,16h
	b		@@exit

@@lowcooldown:

	mov		r0,4h

	//new attempt at fixing Guard endlag
	mov		r2,60h
	ldrb	r1,[r5,r2]
	cmp		r1,0h
	beq		.+04h
	strb	r0,[r5,r2]

@@exit:
	strh	r0,[r5,22h]
	mov		r15,r14




ChangeGauge:

	strh	r0,[r5,8h]		//og code start
	ldr		r7,=80FA7A0h
	ldrb	r0,[r5,5h]
	ldrb	r0,[r7,r0]
	mov		r7,r10
	ldr		r7,[r7,0Ch]		//og code end

	push	r0
	ldrb	r0,[r7,0Fh]	

	cmp		r0,11h
	blt		@@dontstore
	cmp		r0,3Fh
	bgt		@@dontstore


	sub		r7,1h
	strb	r0,[r7]	
	add		r7,1h

@@dontstore:

	pop		r0
	strb	r0,[r7,0Fh]		

	push 	r0-r2

	//r7 is immediately written over upon returning from this hook, so go wild
	sub		r7,4h
	mov		r0,3h		//turn limit on gauge effect
	strb	r0,[r7,2h]

	mov		r0,0B4h		//set minimum elapsed time for first turn (180 frames)

	mov		r2,44h
	ldrh	r1,[r7,r2]	//get current elapsed match time
	add		r0,r1
	strh	r0,[r7]

	pop		r0-r2

	mov		r15,r14

	.pool



//runs when opening the custom menu during battle
TurnCounter:

	mov		r0,0h			//og code start
	strh	r0,[r5,36h]
	ldrb	r0,[r5,0Bh]
	add		r0,1h
	strb	r0,[r5,0Bh]		

	mov		r1,r10
	ldr		r1,[r1,8h]
	mov		r0,1h
	strb	r0,[r1,9h]		//og code end

	push	r0-r3,r5

	//end if the gauge is normal
	ldrb	r0,[r5,0Fh]
//	cmp		r0,20h
//	beq		@@skip

//increment gauge speed if it was affected by the NCP
	cmp		r0,11h
	blt		@@continue
	cmp		r0,3Fh
	bgt		@@continue
	cmp		r0,20h
	beq		@@skip
	bgt		@@sub

//add
	add		r0,2h
	b		@@skipsub
@@sub:
	sub		r0,2h
@@skipsub:
	strb	r0,[r5,0Fh]
	b		@@skip

@@continue:


	sub		r5,4h

	//check if enough time has elapsed
	mov		r2,44h
	ldrh	r0,[r5,r2]

	ldrh	r1,[r5]
	mov		r3,0h
	strh	r3,[r5]

	cmp		r1,r0
	bgt		@@skip		


	//check if a turn limit is set
	ldrb	r1,[r5,2h]
	tst		r1,r1
	beq		@@nosub

	sub		r1,1h
	strb	r1,[r5,2h]

@@nosub:
	bne		@@skip		//end if turn limit isn't up


	//reset the gauge speed
	mov		r0,0h
	strh	r0,[r5]


//	mov		r0,20h
//	mov		r2,13h
//	strb	r0,[r5,r2]

	ldrb	r0,[r5,3h]
	cmp		r0,0h
	bne		@@notzero
	mov		r0,20h
@@notzero:
	mov		r2,13h
	strb	r0,[r5,r2]

	mov		r0,0h		//clear previous stored gauge speed
	strb	r0,[r5,3h]

@@skip:

	pop		r0-r3,r5
	mov		r15,r14






//	set invuln time dynamically based on cust gauge time

ShadowInvulnTime:
	ldrh	r1,[r6,r1]

	b		ChipInvulnTime

MoleInvulnTime:
	ldrh	r1,[r7,r1]

ChipInvulnTime:

	push	r0,r2,r5
	ldr		r2,=2006CAFh	;address for cust gauge speed
	ldrb	r0,[r2]			;read cust gauge speed
	lsr		r0,4h			;make the value single digit
	mov		r2,5h
	sub		r0,r2,r0		;invert that value so fastgauge = 1, slow = 4

	mul		r1,r0			;multiply invuln time by the value we get

//			200h 	normal gauge
//			100h	fast
//			400h	slow

	pop		r0,r2
	mov		r15,r14

	.pool



//	lower boss flinch time, don't reset flinch time if already flinching
BossFlinch:
	push	r1
	ldrb	r1,[r5,11h]		;checks indicator for if navi is already flinching
	cmp		r1,1h
	bne		@@NotAlreadyFlinching


	ldrh	r0,[r5,20h]
	cmp		r0,0h
	bgt		@@noreset

@@NotAlreadyFlinching:

	mov		r0,1Eh		//mm's flinch duration is 18h

	strh	r0,[r5,20h]
	
@@noreset:
	pop		r1
	mov		r15,r14





//	this is the code for the pvp-ready progress setter that runs when continuing from an existing save file every time to keep stuff clean. It won't be compiled if the var is set to not compile pvp-only code

.if IS_PVP

ContinueFromSave:
	push	r14
	mov 	r0,0h		//og code start
	strb 	r0,[r5,6h]
	strb 	r0,[r5,7h]
	strb 	r0,[r5,3h]	//og code end

	ldr r0,=OpenModeFromSave|1	// in expanded_space.asm
	bx r0
	.pool
	//it returns to the root branch without going back through this code
.endif




BalanceHPReduction:
	push	r3

	mov		r0,r3
	mov		r1,3h
	swi		6h		//divide r0 by r1

	pop		r3
	sub		r3,r0

//	add		r3,r1	//add remainder
	mov 	r15,r14



LoadRarity:
	push r0,r14

	//at this time, r7 holds the pointer needed to check the rarity value
	mov r0,r7

	//branch to the routine that loads the battle chip data offset
	bl 		8011444h

	//read the chip rarity value


	.if IS_PVP
		ldrb 	r4,[r0,09h]		//load chip rarity
		add 	r4,1h
	.else
		ldrb 	r4,[r0,0Ah]		//load chip MB
		mov		r0,6h
		sub		r4,r0,r4
		bgt		.+4h	//branch if 6 is > MB, so if it's equal or less than, it resets the limit to 1
		mov		r4,1h
	.endif


	//	chip limit is rarity value + 1
	//	rarity val ranges from 0-4

	//	this isn't used but here's some info just because
	// 	chip limit to megabyte ratio (BN6) :
	// 	5:  0-19mb 	4: 20-29mb 	3: 30-39mb
	// 	2: 40-49mb 	1: 50mb +


	ldr r2,[sp,10h]		;og code

	pop r0,r15





// Replace breaking hitbox object deletion with extra damage
objectbreak:
	// check whether the collision was with a body hitbox, branch if yes
	lsr		r0,18h
	cmp		r0,20h
	ble		@@delete
	// only reduce HP if there is already a source of damage
	mov		r0,0h
	ldrh	r1,[r7,1Ah]
	add		r0,r1
	ldrh	r1,[r7,1Ch]
	add		r0,r1
	ldrh	r1,[r7,1Eh]
	add		r0,r1
	ldrh	r1,[r7,20h]
	add		r0,r1
	// don't count the final element, hp drain
	cmp		r0,0
	bgt		@@damage
	b		@@nosub
	@@damage:
	ldrh 	r0,[r5,24h]
	sub 	r0,0Ah 		;dmg value here
	bmi 	@@delete	;branch if the subtraction results in a negative val
	mov 	r15,r14
@@delete:
	mov 	r0,0h
	mov 	r15,r14
@@nosub:
	ldrh 	r0,[r5,24h]
	mov 	r15,r14

// 11th chip glitch fix
cust1:
	add 	r1,r0,1
	mov 	r0,13h
	cmp 	r1,0Ah
	ble 	@@exit
	mov 	r1,0Ah

@@exit:
	mov 	r15,r14

cust2:
	add 	r1,r0,2
	mov 	r0,13h
	cmp 	r1,0Ah
	ble 	@@exit
	mov 	r1,0Ah

@@exit:
	mov r15,r14


// ---------- Panel steal check
panelsteal:
	push 	r14
	cmp 	r0,6h
	beq 	@@nograb

	cmp 	r0,1h
	beq 	@@nograb
	bl 		800BF06h ;do normal check
	b 		@@exit

@@nograb:
	mov 	r0,0h
@@exit:
	pop 	r15



// ---------- Read the new hitbox push table
hitboxtable:
	ldr 	r7,=ExpandedHitboxTable
	ldr 	r0,[r7,r0]

	mov 	r15,r14

	.pool


// ---------- BIGPUSH CHECK
bigpushcheck:
	mov 	r1,1Ch
	ldrb 	r1,[r5,r1]
	mov 	r0,1h
	tst 	r0,r1
	bne 	@@obstaclecheck

	mov 	r0,3h
	tst 	r0,r1
	bne 	@@obstaclecheck
	
	b 	@@endloop
@@obstaclecheck:
	mov 	r1,42h
	ldrb 	r0,[r5,r1]
	tst 	r0,r0
	bne 	@@continue

@@endloop:
	mov 	r0,8h
	strh 	r0,[r5,0Ah]
	b 		@@exit

@@continue:
	mov 	r0,0h
	strh 	r0,[r5,0Ah]

@@exit:
	ldr 	r0,=080B0B7Ah|1
	bx 		r0

	.pool



//===============================								  ============
//===============================	START OF TEMP SUPERARMOR CODE
//===============================								  ============


// ---------- apply temporary superarmor when stunned
ArmorStunOn:
	mov		r0,80h
	ldrb 	r1,[r7,0Fh]
	orr		r0,r1
	strb	r0,[r7,0Fh]

	mov 	r1,1h 			;og code
	ldr 	r2,[r5,68h] 	;og code

	mov 	r15,r14



// ---------- remove temporary superarmor if stunned by vine
VineArmorOff:
	mov		r0,80h
	ldrb 	r1,[r7,0Fh]
	bic		r1,r0
	strb	r1,[r7,0Fh]

	mov 	r1,1h 			;og code
	ldr 	r2,[r5,68h]		;og code
	mov 	r15,r14



// ---------- if litearmor is equipped, apply temporary superarmor
ChipArmorOn:
	ldrb 	r1,[r5,5h]	;og code
	bic 	r1,r0 		;og code
	strb 	r1,[r5,5h]	;og code
	tst 	r1,r1
	bne 	ChipArmorOffExtraBranch

		push 	r0,r7
		ldr		r7,[r5,68h]

		//check for minor armor value
		mov 	r1,28h
		ldrb 	r0,[r5,r1]
		tst 	r0,r0
		beq 	@@exit

		mov		r0,80h
		ldrb 	r1,[r7,0Fh]
		orr		r0,r1
		strb	r0,[r7,0Fh]

	@@exit:
		pop 	r0,r7
		mov 	r15,r14



// ---------- check whether temporary superarmor is applied and remove if it is
ChipArmorOff:
	ldrb	r1,[r5,5h]		;og code
	orr		r1,r0			;og code
	strb	r1,[r5,5h]		;og code

	ChipArmorOffExtraBranch:
	push	r0,r7

	//r7 will sometimes be empty so this sets it to the proper offset if it's empty
	//code for assigning r7, this should read the right address which is given in the other memory block for the entity's battle data

	ldr		r7,[r5,68h]

	mov		r0,80h
	ldrb 	r1,[r7,0Fh]
	bic		r1,r0
	strb	r1,[r7,0Fh]

	pop 	r0,r7
	mov 	r15,r14



SetArmorNCP:
	push 	r14
	tst 	r0,r0
	beq 	@@exit
	cmp 	r0,1h
	beq 	@@fullarmor

	mov 	r0,1h
	b 		@@apply

@@fullarmor:
	mov r0,40h

@@apply:
	ldrb r1,[r5,16h]

	push	r0
	add 	r0,r1,0

	bl 		8001354h
	pop 	r0

	ldr 	r7,[r7,68h]
	cmp 	r0,1h
	bgt 	@@SetFullArmor

	mov 	r1,28h
	strb 	r0,[r5,r1]
	b 		@@exit

@@SetFullArmor:
	ldrb 	r1,[r7,0Fh]
	orr 	r0,r1
	strb 	r0,[r7,0Fh]

@@exit:
	pop r15

//===============================								  ============
//===============================	END OF TEMP SUPERARMOR CODE   ============
//===============================								  ============



//-------------------------	NCP and Style code

//	Toggle NCP compression

CompressionToggle:
	ldr 	r2,=2000030h
	lsr 	r1,r0,3h
	add 	r2,r2,r1
	lsl		r0,r0,0x1D
	lsr		r0,r0,0x1D
	mov		r1,0x80
	lsr		r1,r0
	ldrb	r0,[r2]
	xor		r0,r1
	strb	r0,[r2]
	mov		r15,r14
	.pool


//	HubBatch custom HP reduction

HubHP:
	mov 	r1,3Ch
	sub 	r1,r0,r1
	mov 	r0,2Ch

	mov 	r15,r14


//	Set Style element

StyleElem:
	push	r1-r3,r14
	ldr 	r2,=2001881h

	//check if normal style and skip if true
	ldrb 	r1,[r2]
	cmp 	r1,0h
	beq 	@@cancel

	// load style value and remove existing element
	mov		r3,38h	//all the possible bits for style without elem
	and		r1,r3
	orr		r1,r0

	strb 	r1,[r2,13h]
	strb 	r1,[r2]

@@cancel:
	pop 	r1-r3,r15
	
	.pool


StyleElemPVE:
	bl		8047304h	//og code, should be fine
	//the correct element value is already loaded in r1 by vanilla code
	ldr		r2,=2001DBBh
	strb	r1,[r2]

	pop		r15


RandomizeNextStyle:
	bl		8047304h	//og code, remove ElemBody effect

	bl		8016040h	//routine to choose new random elem style

	pop		r4,r7,r15


// Cycle thru Styles in the menu 

SetStyle:
	push 	r1-r3,r14
	ldr 	r2,=2001881h
	mov 	r3,13h

	ldrb 	r0,[r2]

	// remove element modifier
	mov		r1,38h		//all style bits, no elem bits
	and		r0,r1
	lsr 	r0,3h		//will return 0-7

	// load position of index
	ldr 	r1,=@@StyleList

	// increase index pointer by 1, or reset it
	add 	r0,1h
	cmp 	r0,8h
	blt 	@@noreset
	mov 	r0,0h

@@noreset:

	//0 = Norm 	1 = Guts 	2 = Cust
	//3 = Team 	4 = Shield  5 = Ground
	//6 = Shdow	7 = Bug

	// read style value from list
	ldrb 	r0,[r1,r0]


	cmp 	r0,0h
	beq 	@@skipwriting
	strb 	r0,[r2,r3]

@@skipwriting:
	mov 	r0,1Ch 		;og code
	strb 	r0,[r5,1h] 	;og code
	pop 	r1-r3,r15

	.pool

@@StyleList:
	.db 00h,0Ah,13h,19h,24h,29h,32h,3Bh




PressFlagCheck:
//replace the NCP check for Press with a direct check for the story flag
//
	mov		r1,2h
	lsl		r1,18h		//r1 is loaded with the address for game flags
	mov		r0,0D5h		//pointer for which flag to check
	ldrb	r0,[r1,r0]	//read the flag
	mov		r1,80h
	tst		r0,r1
	beq		.+6
	mov		r0,1h
	b		.+4
	mov		r0,0h
	mov		r15,r14

// Equip story NCPs whenever reseting navicust abilities

.align 4
EquipStoryNCPs:
	push r2,r3,r14

// Press
//	mov		r2,2h
//	lsl		r2,18h		//r2 is loaded with the address for game flags
//	mov		r3,0D5h		//pointer for which flag to check	
//	ldrb	r0,[r2,r3]	//read the flag
//	mov		r1,80h
//	tst		r0,r1
//	beq		.+0Ah		//branch if r0 doesn't include r1's bit
//	mov 	r0,28h
//	mov 	r1,1h
//	bl 		8047304h

// EnergyChange
	mov 	r0,24h
	mov 	r1,1h
	bl 		8047304h

// Alpha
//	mov 	r0,25h
//	mov 	r1,1h
//	bl 		8047304h

// BlackMind
//	mov 	r0,21h
//	mov 	r1,1h
//	bl 		8047304h

//og code
	mov 	r0,15h
	mov 	r1,1h
	pop 	r2,r3,r15



.align 2
grabRevengeResetBoard:
	push r14

	//Read what team called this chip 00 = Player 04 = Enemy. This conveniently also means the return value can be used as an offset to the list of timer pointers
	ldrb 	r0, [r5,6h]

	tst		r0,r0
	beq		@@skip
	mov		r0,4h

@@skip:
	ldr 	r1, =GrabRevengeMemoryTimerPointer
	add 	r0, r1, r0 //get offset in the pool below
	ldr 	r0, [r0] //load the value into 40 from there
	
	mov 	r1, 0h ;timer value to set
	push 	r2,r3
	mov 	r2, 0h
	mov 	r3, 2h ;0-2 columns
	
	returnColumns:
		strh 	r1, [r0] ;Set the current timer of panels to 0 frames
		add 	r0, r0, 4h ;Go to next position for next row.
		/*
		push 	r0
		mov 	r0, 1h
		add 	r1, r1, r0
		pop 	r0
		*/
		add 	r2, r2, 1h ;Update counter
		cmp 	r2,r3
		ble 	returnColumns


	pop 	r2,r3
	mov 	r0, 5h ;original code
	mov 	r1, 4h ;original code
	pop 	r15

	.pool

GrabRevengeMemoryTimerPointer:

	//Panels that the enemy stole from you will reset
	.dw 	0200F7A4h
	//Panels that the player stole from the other team will reset
	.dw 	0200F7B0h




//Prof.9's patch for returning the colorful internet palette at the endgame
ColorfulInternet:
push	r14
ldr		r0,=200A30Ah
ldrb	r0,[r0]
cmp		r0,80h
bge		@@end
mov		r0,0Ah
mov		r1,6h
mov		r2,r15
add		r2,7h
mov		r14,r2
ldr		r2,=8021D41h
bx		r2
ldr		r0,=802A8BFh
bx		r0

@@end:
pop		r15
.pool



.endarea


.close