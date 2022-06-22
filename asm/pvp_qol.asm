
//modify internal ROM name
.org 0x080471C8
.area 0x0C,0x20
	.ascii "BBN3 v0.5.0"
.endarea



//make Tamako's kiosk take you to Secret Area
.org 0x0812B530
	.import "rom/bn3blue.gba", 0x1321B0,0x10

//make Lan's doghouse take you to Secret Area
.org 0x0812B3C8
	.import "rom/bn3blue.gba", 0x1321B0,0x10

//make Secret Area 1's warp panel take you to area 3
.org 0x0812CDFC
	.import "rom/bn3blue.gba", 0xAA6DC,0x10



//Fix bug where the bottom left chip name disappears in battle for both players
//if either player enters an animation with chip lockout
.org ChipDisplayFixHook
	bl		ChipDisplayFix




// 			 run the modified openmode patch routines

//	-------- hook game startup to run validation check on the backpack 


// run when loading an existing save file
.org ContinueFromSaveHook
	bl	ContinueFromSave	// in patch.asm
	nop
	nop

.org OpenModeHook
	;Set main hook that triggers when you press new game
	ldr r0,=OpenModeRoutine|1	// in expanded_space.asm
	bx r0
	
.align 4
.pool





//	Make story NCPs equipped by default
.org EquipStoryNCPsHook
bl 		EquipStoryNCPs



//	Replace Starting folders

//Folder1 default
.org 0x0800CBDC
	.dd  0x0001001400010014 :: .dd  0x001A0014000D0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014

//Folder2 default
.org 0x0800CC54
	.dd  0x0001001400010014 :: .dd  0x001A0014000D0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014 :: .dd  0x001A0014001A0014
	.dd  0x001A0014001A0014

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

//020014A0	xtrafolder loaded into RAM here


//Time Trial battles without xtrafolder
.org 0x08028556 :: .dh 0x46C0


//enable secret area jack out
.org 080AAE2Ah
	mov 	r0,0h
.org 080AB2B0h
	mov 	r0,0h
.org 080AB6C6h
	mov 	r0,0h



//08002904	reads all the battle config settings, can be used to find any battle
//08005A36	this is similarly helpful, works for pvp


//Omega Navi Time Trial fights


//flashman
.org 0x08019E28
	.db 0xAB

//beastman
.org 0x0801A6E8
	.db 0xAF

//bubbleman
.org 0x0801A014
	.db 0xB3

//desertman
.org 0x0801A188
	.db 0xB7

//plantman
.org 0x0801A23C
	.db	0xBB

//flameman
.org 0x0801A3D4
	.db 0xBF

//drillman
.org 0x0801A814
	.db 0xC3

//gutsman
.org 0x08019E9C
	.db 0xCB

//protoman
.org 0x0801A900
//	.db 0xCF
	.db	0xF2	//bass gs

//metalman
.org 0x0801A10C
	.db 0xD3

//kingman
.org 0x0801A87C
	.db 0xDB

//bowlman
.org 0x0801A74C
	.db 0xE3

//darkman
.org 0x0801A960
	.db 0xE7

//japanman
.org 0x0801A9C0
	.db 0xEB



//bowlman in DNN comp
.org 0x0801A758
	.db 0xDF	//mistman omega



//mistman
//.org 0x080
//	.db 0xDF





//disable random encounters
.org 0x80ABF90
	nop


//hardcode the resulting value for the megabyte check, 
.org 0x0802B19A
	mov		r0,5h

//hardcode the resulting value for the HP mem check
.org 0x080473B2
	mov		r1,0C8h

//prevent going over max hp from buying hp mems
.org 0x0802B12E
	mov		r1,r0
.org 0x0802B106
	nop


//prevent obtaining new chips
.org 0x80112DE
nop

//remove chip count check
.org 0x082373BA
	nop
	nop
.org 0x08033D2E
	nop
	nop

.org 0x080351BA		;remove chip from pack 1/2
	nop
.org 0x0803520E		;remove chip from pack 2/2
	nop
.org 0x08035132		;add chip back to pack
	nop

.org 0x804178C		;changing this makes it impossible to confirm a chip trade
	nop	
.org 0x8041764		;trader remove chip
	nop
.org 0x80416EE		;trader add chip back
	nop	









