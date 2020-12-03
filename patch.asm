

.gba


AM_DEBUGGING	EQU	0
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

//These files are always compiled

//These 2 will define symbols that other files are dependent on, so they must be ran first
.include "asm\free_space.asm"
.include "asm\expanded_space.asm"


.include "asm\library_EQU.asm"
.include "asm\chip_manifest.asm"
.include "asm\attack_edits.asm"
.include "asm\NCP_edits.asm"



	.sym on


//this symbol is only defined in the build script that generates the .bps files
.ifdef IS_BN3PLUS
	.include "asm\bn3plus\bbn3plus.asm"
.else
.endif




//===============	Aesthetic changes



/*
//use white version menu palette
.org 0x087C9950
	.import "rom/bn3white.gba", 0x7C9D64, 0x40

.org 0x087CB214
	.import "rom/bn3white.gba", 0x7CB628, 0x40
*/


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


//===============	 Quality of Life Changes


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




//===============	 PVE-specific



.if IS_PVP
.else


/*  might be causing problems

	//Prof.9's Colorful Internet hack	(for pve version)
	.org 0x0802A89C
		ldr	r0,=ColorfulInternet|1b
		bx	r0
		.pool
*/






//allow white gigas to appear in shops (skip the ID check)
.org 0x08001A66
	b 	.+1Eh
.org 0x08044B28
	.dh 0x137,0x137,0x137,0x137,0x138,0x138

//add white giga chips to various shops

.org 0x0804503A		//navirecycle in higsby shop
	.db 0x30,0x1,codeSTAR,0x0,0x88,0x13

.org 0x08044D22		//balance in yoka square shop
	.db 0x34,0x1,codeY,0x0,0x58,0x1B

.org 0x08044E52		//serenade in undernet 2 bugfrag shop
	.db	0x33,0x1,codeS,0x0,0x2C,0x1

.org 0x08044ED0		//alpharm sigma in undernet 6 shop
	.db 0x2,0x1,0x31,0x1,codeV,0x0,0xF4,0x1

.org 0x08044F40		//bass in undernet square shop
	.db	0x2,0x1,0x32,0x1,codeX,0x0,0xAC,0x26

.org 0x08044F98		//meteors in secret area 2 shop
	.db 0xD4,0x0,codeR,0x0,0xD2




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



//pve-friendly MB value scaling
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



.org MegaWhiteFlashVal
	.db 0x0A 	;visual white flash time (megaman)
.org MegaFlashVal
	.db 0x3C 	;flashing (invis) time (megaman)

.org BossWhiteFlashVal
	.db 0x0A		;visual white flash time (bosses)
.org BossFlashVal	
	.db 0x3C		;flashing (invis) time (bosses)



.if IS_PVP

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

.org CapcomScreenWaitTime
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



// hook to replace object deletion with 10 extra dmg when hit by breaking
.org ObjectBreakHook
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

//Shield style heal 50HP from shield heal
.org ShieldHealPercentVal
	mov		r1,14h




// ------------ BN6 chip limit hook


.if IS_PVP

.org ChipLimitValHook
	bl LoadRarity

.org SetStandardChipLimitVal
	nop ;prevents it from clearing the custom chip limit value

.else
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



//hook the elemental weakness 2x damage code
.org 0x080AD90E
	bl		ElemWeakness


//hook the elec + ice panel 2x damage code
.org 0x080AF422
	bl		IcePanelBonus


//hook the fire + grass panel 2x damage code
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






// =================
// =======================
// ============================= PUT NEW HOOKED CODE HERE






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
	lsr		r1,1h
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
	cmp		r0,5h
	beq		@@exit		//skip to the end if getting hit by a dragging hit
	cmp		r0,0Dh
	beq		@@exit		//check again for the new bigpush value


	//go to regular armor check but skip line for push r14
	mov		r0,0C0h
	bl		OldArmorCheckSkipR14Push	

@@exit:
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

	push	r0
	ldrb	r0,[r5,5h]

	cmp		r0,7h
	beq		@@activate

	cmp		r0,1h
	beq		@@activate

//queue antidmg to fire later
	mov		r0,0h
	b		.+4h

@@activate:
	mov		r0,1h

	tst		r0,r0
	pop		r0,r15


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

	mov		r0,0h
@@store:
	strh	r0,[r7,16h]



	ldrb	r1,[r7,6h]
	cmp		r1,24h
	bne		@@notleafshield
	mov		r0,0h
	strb	r0,[r7,6h]
	strh	r0,[r7,16h]
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
	push	r0-r7,r14

	ldr		r4,=2034100h	//free space to store the list of valid chips

	mov		r0,1Dh
@@checkchipIDloop:
	push	r0
	bl		80114A8h	;get chip ID from position

//	get the ID of a chip based on its position, then check
//	if it's a chip that folderback is allowed to restore

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


	//shuffle the results
	sub		r4,1h
	ldr		r0,=2034100h
	sub		r1,r4,r0
	mov		r2,r1
	bl		8000C7Eh




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


	mov		r0,0Ah		//endlag value
	mov		r1,22h
	strh	r0,[r5,r1]

	mov 	r0,2h
	mov		r1,10h
	strb	r0,[r5,r1]	

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
	push 	r1-r7,r14

	mov 	r0,0h		//og code start
	strb 	r0,[r5,6h]
	strb 	r0,[r5,7h]
	strb 	r0,[r5,3h]	//og code end

	mov		r1,45h

	bl		OpenModeHook

	//it returns to the root branch without going back through this custom code
.else
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
	lsr		r0,18h
	cmp		r0,20h
	ble		@@delete	;check whether the collision was with a body hitbox, branch if it was

	ldrh 	r0,[r5,24h]
	sub 	r0,0Ah 		;dmg value here
	bmi 	@@delete	;branch if the subtraction results in a negative val

	mov 	r15,r14

@@delete:
	mov 	r0,0h
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
	ldrb 	r0,[r2]
	mov 	r1,0FFh
	sub 	r0,r1,r0
	strb 	r0,[r2]

	mov 	r15,r14
	
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
	mov 	r3,13h

	//check if normal style and skip if true
	ldrb 	r1,[r2]
	cmp 	r1,0h
	beq 	@@cancel

	// load style value and remove existing element
	ldrb 	r1,[r2,r3]
	lsr 	r1,3h
	lsl 	r1,3h

	add 	r1,r0
	strb 	r1,[r2,r3]
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

	// remove element modifier with the power of math
	lsr 	r0,3h

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



// Equip story NCPs whenever reseting navicust abilities

.align 4
EquipStoryNCPs:
	push r2,r3,r14

// Press
	mov		r2,2h
	lsl		r2,18h		//r2 is loaded with the address for game flags
	mov		r3,0D5h		//pointer for which flag to check
	
	ldrb	r0,[r2,r3]	//read the flag
	mov		r1,80h
	tst		r0,r1
	beq		.+0Ah		//branch if r0 doesn't include r1's bit

	mov 	r0,28h
	mov 	r1,1h
	bl 		8047304h

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