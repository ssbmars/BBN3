.sym on


//Everything included here will expand the size of the ROM
//This offset is beyond any byte that would be used by the randomizer or any of its patches.

.org 0x08800000






//===========================================
//============		EXPANDED HITBOX TABLE 	(wind hitboxes, bigpush, etc)
//===========================================


//	expanded flinch property tables for megaman and npcs

.area 0x20, 0	//size must be in factors of 4 bytes because the data under this is read as words
MegaFlinchTable:
.db 0x00, 0x01, 0x03, 0x03, 0x05, 0x07, 0x0D, 0x0F, 0x7F

//	the boss table is also used by viruses, but virusbody ignores flashing; bosses treat bigpush as smallpush
BossFlinchTable:
.db 0x00, 0x01, 0x03, 0x03, 0x05, 0x07, 0x0D, 0x0F, 0x7F
.endarea


ExpandedHitboxTable:
.import "rom\bn3blue.gba",0x0AF60C,0x328


// new table value wind-smallpush (65)
.dw 0x80000140 	;a
.dw 0x40000240 	;b

//new table value windpull (66)
.dw 0x80000840 	;a
.dw 0x40001040 	;b

//poison drain that doesn't pierce invis (67)
.dw 0x80000020	;a
.dw 0x40000020	;b

//new table value revenge w/o break (68)
.dw 0x80000085	;a
.dw 0x40000085	;b


//new table value standard wind hit  (69)
.dw 0x80000040	;a
.dw 0x40000040	;b


//new table value AirSword 	(6A)
.dw 0x80000108	;a
.dw 0x40000208	;b

//============================================================================================
//============================================================================================


OpenModeRoutine:
	cmp		r1,45h
	beq		@@continuesave
	push 	r0-r3
	
	bl writeStoryFlags
	bl writeEmails
	bl writeJobs
	bl writeKeyItems
	bl writeArea
	bl writeStyle
	bl writeProgress
	bl writeFolders
@@continuesave:
	bl writeReadSpeed
	bl writeNaviCust
	bl writeFullLibrary
	bl ValidateBackpackOnStartup
	bl FriendlyVirus
	bl writeFriendlyVirusesCaptured
	
	pop r0-r7,r15



writeStoryFlags:
	;set all the story flags to just after beating alpha
	ldr r0,=flags			;r0 = addr for flags
	ldr r1,=2000030h		;r1 = addr for flags in ram
	mov r2,0B0h				;r2 = # of 2byte writes
	swi 0Bh					;call memcopy
	
	bx lr					;return

	.pool



writeEmails:
	;give the player all the relevant emails
	ldr r0,=emails			;r0 = addr for emails

	ldr r1,=2000250h		;r1 = addr for emails in ram
	mov r2,03h				;r2 = # of 2byte writes
	swi 0Bh					;call memcopy
//
	ldr r0,=emails
	mov r2,03h
//
	add r2,r2,r2			;r2 *= 2
	add r0,r0,r2			;r0 = r0 + r2 		offset r0 by r2
	
	ldr r1,=20051A0h		;r1 = addr for emails in ram
	mov r2,17h				;r2 = # of 2byte writes
	swi 0Bh					;call memcopy
	
	ldr r0,=200157Ch		;r0 = addr for # of emails in ram
	mov r1,25h				;r1 = # of emails
	strb r1,[r0]			;write r1 in the r0 addr

	//	make the BBN3 explanation mail unread
	ldr r0,=unreadmail
	ldr r1,=2000260h
	mov r2,3h
	swi 0Bh


	bx lr					;return
	
	.pool



writeJobs:
	;give the player all the jobs
	ldr r0,=jobs			;r0 = addr for jobs
	
	ldr r1,=2001B70h		;r1 = addr for jobs in ram
	mov r2,0Dh				;r2 = # of 2byte writes
	swi 0Bh					;call memcopy
//
	mov r2,0Dh
	ldr r0,=jobs
//
	add r2,r2,r2			;r2 *= 2
	add r0,r0,r2			;r0 = r0 + r2 		offset r0 by r2

	ldr r1,=20002C0h		;r1 = addr for jobs in ram
	mov r2,02h				;r2 = # of 2byte writes
	swi 0Bh					;call memcopy
	
	ldr r0,=20013D0h		;r1 = addr for # of jobs in ram
	mov r1,19h				;r1 = # of jobs
	strb r1,[r0]			;write r1 in the r0 addr
	
	bx lr					;return
	
	.pool

	
writeArea:
	;set the area to Lan's Room
	ldr r0,=2001884h		;r0 = addr for area?
	mov r1,0h				;r1 = area?
	strb r1,[r0]			;write r1 into r0
	
	ldr r0,=2001885h		;r0 = addr for subarea?
	mov r1,3h				;r1 = subarea?
	strb r1,[r0]			;write r1 into r0
	
	bx lr					;return


writeKeyItems:
	;give the player all the keyitems needed to beat Alpha
	ldr r2,=keyitems		;r2 = addr for keyitem pointers
	
	mov r1,1h				;r1 = value to write
	mov r3,2Ch				;r3 = # of keyitem pointers
	
	@@writeloop:			;loop to write r1 to the pointers
		ldr r0,[r2]			;r0 = pointer at r2
		strb r1,[r0]		;write r1 at the pointer
		add r2,4h			;r2 += 4h		offset r2 by 4
		sub r3,1h			;r3 -= 1h	
		bne @@writeloop		;keep looping if r3 != 0
		


	//give max HP and MB stats
	ldr		r2,=2001A20h
	ldr		r3,=MaxHPandMB
	mov		r0,0h
	@@HPMBloop:
		ldrb	r1,[r3,r0]
		strb	r1,[r2,r0]

		add		r0,1h

		cmp		r0,7h
		blt		@@HPMBloop


	//hardcode HP to max so it shows before loading HP mem count
	ldr		r2,=20018A0h
	ldr		r1,=3E8h

	strh	r1,[r2]
	add		r2,2h
	strh	r1,[r2]


	//hardcode MB to max so it shows before loading MB count
	ldr		r2,=2001897h
	mov		r1,5h
	strb	r1,[r2]

	ldr		r2,=0E001897h
	strb	r1,[r2]


	bx lr					;return
	
	MaxHPandMB:
	.db 2Dh,02h,0Ah,0Ch,4h,8h

	.pool



writeStyle:
	;enable style change by setting a stored style
	push lr					;push return addr (r14)
	
	ldr		r1,=02001896h	;r1 = addr for ?	reject style?
	mov		r0,0h			;r0 = ?				
	strb 	r0,[r1]			;write r0 in r1
	
	ldr 	r1,=02001894h	;r1 = addr for style
	mov		r0,9h			;set to first valid style value
	strb 	r0,[r1]			;store style
	
	;ldr	r1,=02001881h	;r1 = addr for currently equipped style
	;strb	r0,[r1]			;store equipped style
	
	pop r15					;return
	
	.pool



writeReadSpeed:
	//ensure that the opcode prefetching option is enabled
	ldr		r2,=800020Ch
	mov		r1,40h
	lsl		r1,8h
	ldrh	r0,[r2]
	orr		r0,r1
	strh	r0,[r2]

	bx		lr


writeNaviCust:
	;give the player all NCPs needed for pvp

	ldr r2,=navicust		;r2 = addr for navicust pointers

	mov 	r1,1h			;r1 = value to write
	mov 	r3,25h			;r3 = # of navicust pointers
	
	@@writeloop:			;loop to write r1 to the pointers
		ldr 	r0,[r2]		;r0 = pointer at r2
		strb 	r1,[r0]		;write r1 at the pointer
		add 	r2,4h		;r2 += 4h		offset r2 by 4
		sub 	r3,1h		;r3 -= 1h		
		bne @@writeloop		;keep looping if r3 != 0


	mov 	r1,9h				
	mov 	r3,1Eh		
	
	@@writeloop9:			
		ldr 	r0,[r2]			
		strb 	r1,[r0]		
		add 	r2,4h			
		sub 	r3,1h				
		bne @@writeloop9


	//give max size navicust
	ldr		r2,=2001A21h
	mov		r1,2h
	strb	r1,[r2]


	bx 		lr				;return


writeProgress:
	;set the progress byte to post-Alpha
	ldr r1,=02001886h		;r1 = progress byte addr
	mov r0,79h				;r0 = progress value
	strb r0,[r1]			;write r0 into r1
	
	bx lr					;return
	
	.pool



writeFolders:
	;Give the player Folder2 & the Extra Folder after pressing new game	
	push lr					;push return addr (r14)
	
	;load parameters for setfolder function for extrafolder (idk which ones I actually need lmao)
	ldr r0,=0x0000000A		;extrafolder id?
	ldr r5,=0x02009480
	ldr r6,=0x0000FC00
	
	;call setfolder function
	ldr r4,=080019E9h		;r4 = setfolder(?) function
	mov r14,r15				;move PC into LR so that we can return here
	bx r4					;call setfolder(?) function
	
	;load parameters for setfolder function for folder2 (idk which ones I actually need lmao)
	ldr r0,=0x00000001		;folder2 id?
	ldr r5,=0x02009DB0
	ldr r6,=0x0000FC00
	
	;call setfolder function
	ldr r4,=080019E9h		;r4 = setfolder(?) function
	mov r14,r15				;move PC into LR so that we can return here
	bx r4					;call setfolder(?) function
	
	;return
	pop r15					;return
	
	.pool



writeFullLibrary:
	;fills the player's library
	push 	lr
	

	//fix for flashcarts- write 0xFF to [02001DC3] (fixes library anticheat triggering)
	mov		r0,0FFh
	ldr		r1,=2001DC3h
	strb	r0,[r1]
	//end of flashcart fix


	ldr 	r1,=2000330h
	mov 	r0,7Fh
	strb 	r0,[r1]
	mov 	r0,0FFh
	mov		r2,26h
	strb 	r0,[r1,r2]
	mov 	r2,0h
	mov 	r0,0FFh

@@continueFullLibraryLoop:
	cmp 	r2,2Bh
	beq 	@@endFullLibraryLoop

	cmp		r2,25h	//don't write anything to this byte
	bne		.+4h
	add		r2,2h

	add 	r2,1h
	strb 	r0,[r1,r2]
	b 		@@continueFullLibraryLoop

@@endFullLibraryLoop:
	mov		r2,0h
	mov		r5,0h

@@LibraryCountLoop:		//dynamically calculate the correct value that will avoid triggering an anticheat
	ldrb	r0,[r1,r2]
	add		r5,r0
	add		r2,1h
	cmp		r2,30h
	blt		@@LibraryCountLoop

	mov		r0,0FFh
	add		r5,r0
	neg		r5,r5
	lsl		r5,10h
	lsr		r5,10h

	ldr 	r1,=20019B0h
	strh 	r5,[r1]
	mov 	r0,0h
	ldr		r5,=0x02009DB0
	strb 	r0,[r5,6h]
	strb 	r0,[r5,7h]
	strb 	r0,[r5,3h]
	
	pop r15

	.pool



//runs validation check on the backpack 
//this fixes chip codes and gives missing chips

ValidateBackpackOnStartup:
	push	r14

	ldr		r6,=2001F72h 	;backpack address
	ldr 	r4,=8011444h|1	;fetch chip manifest address	

	mov		r0,0h		//holds current chip ID most of the time
	mov		r1,0h		//reads chip codes from ROM
	mov		r5,0h		//handles the pointer for which chip code to read

@@nextchiploop:
	mov 	r5,0h
	add		r0,1h
	push	r0
	mov		r14,r15
	bx		r4

@@nextcodeloop:
	ldrb	r1,[r0,r5]
	cmp		r1,1Bh
	blt		@@validcode

	mov		r2,0h		
	strb	r2,[r6]		
	b		@@nextcode

@@validcode:
	ldrb	r2,[r0,9h]	;get chip limit value so it sets the chip count to show the limit
	add		r2,1h
	strb	r2,[r6]		

@@nextcode:
	add 	r6,1h
	add		r5,1h

	cmp		r5,6h
	blt		@@nextcodeloop

@@nextchip:
	ldr		r5,=138h
	add		r6,0Ch
	pop		r0
	cmp		r0,r5
	blt		@@nextchiploop

@@exit:

	pop		r15

	.pool



// ---------- Forced FV food values
FriendlyVirus:
	push	r14
	mov 	r1,2h
	lsl 	r1,r1,18h
	mov 	r2,0h
	mov		r0,0h

@@loop:
		str 	r0,[r1,r2]
		add 	r2,4h
		cmp 	r2,28h
		blt 	@@loop

	mov 	r0,1h
	mov 	r2,1Bh
	strb 	r0,[r1,r2]
	mov 	r2,24h
	strb 	r0,[r1,r2]
	mov 	r2,25h
	strb 	r0,[r1,r2]

	pop		r15




writeFriendlyVirusesCaptured:

	ldr		r0,=capturedfv

	mov		r1,2h
	lsl		r1,18h
	add		r1,36h

	mov		r2,6h

	swi 	0Bh

	mov		r15,r14


.sym off

capturedfv:
	.db 0x00,0x11,0xF3,0xFF,0xFE,0x5F,0xFF,0xFF,0xFF,0xFF,0xE6,0x88

.pool


flags:
	.db 0xE2,0x06,0x78,0x18,0x23,0x00,0x00,0x00,0x03,0xFF,0xFE,0x58,0x00,0x00,0x00,0x00
	.db 0x06,0x88,0x0C,0x03,0xF9,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFC,0x00,0x00,0x1F
	.db 0xFF,0xFF,0xFF,0xFF,0xFF,0x9B,0xA2,0xFB,0xB3,0xFF,0xF1,0x80,0x7F,0xFF,0xC0,0x0F
	.db 0x00,0x00,0xFF,0xF0,0x00,0x6C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x9D,0x0A,0x40,0x01,0x08,0x98,0x00,0x43,0x73,0x08,0x00,0x40,0x3F,0xFF,0xFF,0xF8
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0xFC,0x2F,0x09,0xF9,0xFF,0xFD,0x7F,0xBF,0x7F,0xD0,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0xFD,0xCF,0xFA,0xFF,0xFF,0xFF,0xFA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x7F,0xDF,0xFF,0xA1,0xEF,0xFF,0xB6,0xFD,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x8F,0xFF,0x0F,0xFF,0xFF,0x1F,0xFF,0xC0,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x01,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xEF,0xF8,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x7F,0xFF,0xFF,0xFF,0xFF,0xFE,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x01,0xFF,0xFF,0xFF,0xF2,0x7E,0xFC,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0xFD,0xFF,0xFF,0xFF,0xFC,0x00,0xF7,0xEF,0x81,0xE0,0x00,0x00,0x00,0x00,0x00,0x00
	.db 0x00,0x78,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x25,0x00,0x00,0x40,0x00
	
.pool
	
emails:
	.db 0xff,0xff,0xff,0xff,0xff,0xe0 //these bytes tell which styles are already obtained

	.db 0x00,0x01,0x02,0x03,0x1F,0x04,0x05,0x21,0x08,0x09,0x23,0x24,0x25,0x26,0x27,0x28,0x2a,0xa,0xb,0x20,0xc,0xe,0xf,0x10,0x11,0x22,0x12,0x06,0x16,0x13,0x29,0x14,0x15,0xd,0x07,0x17,0x18,0x1C,0x19,0x1A,0x1B,0x1D,0x1E,0x80,0x80
.pool

//0x1C marks the end of the email list

unreadmail:
.db 0x1,0x4,0x0D,0x84,0x0,0x40



jobs:	
	.db 0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x00,0x01,0x02,0x03,0x0D,0x0E,0x0F
	.db 0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x40
	.db 0xFF,0xFF,0xFF,0x80
	
.pool

keyitems:
	.word 0x20019C3,0x20019CA,0x20019CE,0x20019D0,0x20019D2,0x20019D5,0x20019D7,0x20019DB,0x20019DC,0x20019DD,0x20019DE,0x20019DF,0x20019E0,0x20019E1,0x20019E2,0x20019E3,0x20019E4,0x20019E5,0x2001A1C,0x2001A1D,0x2001A1E,0x2001A1F,0x20019F4,0x20019F7,0x20019F8,0x20019F9,0x20019FA,0x2001A07,0x2001A08,0x2001A09,0x2001A0A,0x2001A0B,0x2001A0C,0x2001A0D,0x2001A0E,0x2001A0F,0x2001A10,0x2001A11,0x2001A12,0x2001A13,0x2001A14,0x2001A1C,0x2001A1F,0x20019EF
	
.pool


navicust:
	.word 0x2001A87,0x2001A8B,0x2001A8C,0x2001A8F,0x2001A93,0x2001A97,0x2001A9B,0x2001A9F,0x2001AA3,0x2001AA7,0x2001ABB,0x2001ABF,0x2001AC3,0x2001AC7,0x2001ACB,0x2001ACF,0x2001ADE,0x2001AE3,0x2001AE5,0x2001AEB,0x2001AEC,0x2001AF4,0x2001AF8,0x2001AFD,0x2001B02,0x2001B04,0x2001B09,0x2001B30,0x2001B35,0x2001B3D,0x2001B40,0x2001B44,0x2001B48,0x2001AD0,0x2001AD4,0x2001AD9,0x2001B38


navicust9:
	.word 0x2001B0C,0x2001B0D,0x2001B0E,0x2001B10,0x2001B11,0x2001B12,0x2001B15,0x2001B16,0x2001B18,0x2001B19,0x2001B1D,0x2001B1E,0x2001B20,0x2001B21,0x2001B22,0x2001B24,0x2001B25,0x2001B26,0x2001B28,0x2001B29,0x2001B2A,0x2001B2C,0x2001B2D,0x2001B2E,0x2001AAA,0x2001AAB,0x2001AAF,0x2001AB1,0x2001AB3,0x2001AB7

.pool












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


