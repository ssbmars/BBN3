.sym on


//Everything included here will expand the size of the ROM
//This offset is beyond any byte that would be used by the randomizer or any of its patches.

.org 0x08800000








//===========================================
//============		IMPORTED ART
//===========================================

//these are imported directly from a vanilla BN3 White ROM, which must be located in the /rom folder


//balance

img_Balance:
.import "rom/bn3white.gba", 0x6F60E0, 0x700

pal_Balance:
.import "rom/bn3white.gba", 0x6F67E0, 0x20


//bass

img_Bass:
.import "rom/bn3white.gba", 0x6F52A0, 0x700

pal_Bass:
.import "rom/bn3white.gba", 0x6F59A0, 0x20


//recycle

img_NavRcycl:
.import "rom/bn3white.gba", 0x6F4460, 0x700

pal_NavRcycl:
.import "rom/bn3white.gba", 0x6F4B60, 0x20


//serenade

img_Serenade:
.import "rom/bn3white.gba", 0x6F59C0, 0x700

pal_Serenade:
.import "rom/bn3white.gba", 0x6F60C0, 0x20


//sigma

img_AlphArmS:
.import "rom/bn3white.gba", 0x6F4B80, 0x700

pal_AlphArmS:
.import "rom/bn3white.gba", 0x6F5280, 0x20


//black palette

pal_black:
.area 0x20,0
.endarea



//Roll icon
ico_roll:
.import "art/icon/roll.bin"

//Gutsman
ico_gutsman:
.import "art/icon/gutsman.bin"

//Protoman
ico_protoman:
.import "art/icon/protoman.bin"

//Flashman
ico_flashman:
.import "art/icon/flashman.bin"

//Beastman
ico_beastman:
.import "art/icon/beastman.bin"

//Bubbleman
ico_bubbleman:
.import "art/icon/bubbleman.bin"

//Desertman
ico_desertman:
.import "art/icon/desertman.bin"

//Plantman
ico_plantman:
.import "art/icon/plantman.bin"

//Flameman
ico_flameman:
.import "art/icon/flameman.bin"

//Drillman
ico_drillman:
.import "art/icon/drillman.bin"

//Metalman
ico_metalman:
.import "art/icon/metalman.bin"

//Kingman
ico_kingman:
.import "art/icon/kingman.bin"

//Mistman
ico_mistman:
.import "art/icon/mistman.bin"

//Bowlman
ico_bowlman:
.import "art/icon/bowlman.bin"

//Darkman
ico_darkman:
.import "art/icon/darkman.bin"

//Yamatoman
ico_yamatoman:
.import "art/icon/yamatoman.bin"

//Punk
ico_punk:
.import "art/icon/punk.bin"



//Sensorman
img_sensorman:
.import "art/img_sensorman.bin"
pal_sensorman:
.import "art/pal_sensorman.bin"


//===========		Trap Text

TrapImageAddr:

//AntiDmgQs:
.dh	0xD066, 0xD068, 0xD000, 0xD000, 0xD067, 0xD069, 0xD000, 0xD000

//AntiSwrdQs:
.dh	0xD06A, 0xD06C, 0xD000, 0xD000, 0xD06B, 0xD06D, 0xD000, 0xD000

//AntiNaviQs:
.dh	0xD06E, 0xD070, 0xD000, 0xD000, 0xD06F, 0xD071, 0xD000, 0xD000

//AntiRcovQs:
.dh	0xD072, 0xD074, 0xD000, 0xD000, 0xD073, 0xD075, 0xD000, 0xD000


BattleTextWithTrapSprites:
.import "art/BattleTextSprites.bin"
























//prof9's bn3plus patch data that goes in expanded rom space

.if IS_ENG
		.include "asm\bn3plus\bbn3plusext.asm"
.else
.endif


.if IS_PVP
.else

	//add mistman to library, randomizer-friendly 
	
	mistRoutine:
		push r0-r3
	
		ldr		r1,=2000353h	//mistman library byte
		mov		r0,3Ch			//bitfield with all 4 mist mega bits
		ldrb	r2,[r1]	
		bic		r0,r2			//records which mistman bits were not already unlocked
		orr		r2,r0			//adds the missing mistman bits to r2
		strb	r2,[r1]
	
		ldr		r1,=20019B0h	//anticheat tracker
	
		ldrh	r2,[r1]
		sub		r2,r0			//context-aware, only updates with the library bits that were changed
		strh	r2,[r1]
	
		pop r0-r7,r15
		.pool
	
.endif


