
//MetalMan fight for testing
.org 0x0812BE50 :: .db 0x00 	;acdc background
.org 0x0812BE51 :: .db 0x0B		;battle type, pvp
//.org 0x0812BE52 :: .db 0x00 	;folder unshuffled
//.org 0x0812BE54 :: .db 0x00 	;allow running
.org 0x0812BE57 :: .db 0x10 	;music/enable running

.org 0x0801A11D :: .db 0x02 		;mm position
.org 0x0801A120 :: .dw 0x00020501 	;enemy 1 megaman
.org 0x0801A124 :: .dw 0x08010601 	;no enemy
.org 0x0801A128 :: .dw 0x08030601 	;no enemy

//0812C29C	reads background value

//08002904	this routine reads the battle configuration. Breakpoint it to get the data for any battle.




oOoofakepvp	EQU	1
breakthings EQU 0

//EXPERIMENTAL: test modifications to simulate a pvp match in an offline battle
.if oOoofakepvp



//extend the amount of bytes to clear when preparing the input section of ram
.org 0x08008880
	bl	ClearInputStack


//make it never reach the interruption frame count for disconnecting
.org 0x080085FE
	nop
.org 0x08008742
	nop

//do the same for the custom screen
.org 0x080093D0
	nop
	b	80093EAh


//make the screen fade to black instead of white when starting a match 
.org 0x0812C256
	mov		r0,4h		//fade out
.org 0x080066A0
	cmp		r1,0Bh
	beq		80066BCh	//fade in


//attempt to stop it from flagging player2 as finished with customizing
.org 0x08008ACA
	mov		r0,70h







//	EXPERIMENTAL: make the pvp mode byte work offline


//breaks the match if not hardcoded
.org 0x08008C86	::	b	8008C98h	//causes comm error
.org 0x08006520	::	b	8006524h	//prevents battle from loading in
.org 0x0800685C	::	b	8006866h	//softlocks when the battle ends (tested w/ winning & running)

//hardcode to influence certain features
.org 0x08006912 ::	b	8006940h	//where it puts you after battle ends (currently returns to ow)
.org 0x0800735E	::	b	8007372h	//controls if you can run from battle


//keep an eye on these, research their impact
.org 0x080078D2	::	b	800791Eh	//may be RNG related
.org 0x08008C64	::	b	8008C6Ah	//I think it reads a branch pointer while closing the cust 


//effect unknown
.org 0x080059C7 ::	.db 0x0C	//value read by using battle value as a pointer, effect unknown
.org 0x080071D8	::	b	80071EAh	//runs every frame, if it weren't disabled, it would read something that's possibly related to pointers for gamestate-related routines that can run in pvp


//disabled but doesn't seem to break things, their real impact is unknown
//
//some of these may have an impact on RNG values
.org 0x0801494C ::	nop
.org 0x08005A04 ::	nop		//something related to the cust data, runs at match start
.org 0x080074B2 ::	nop		//runs at cust and in battle, but seemingly only when displaying a chip name
.org 0x08007694 ::	nop		//looks similar to the one at 0x080074B2 but only runs while battle loading in
.org 0x08006662 ::	nop		//runs once while loading in, seems to affect how it reads battle config data




//these branches need to maintain vanilla behavior otherwise features will break
//.org 0x08006C90	::	b	8006CA2h	//sync setstage ncps
//.org 0x08006CB2	::	b	8006CBEh	//sync setstage ncps
//.org 0x08014CE2	::	b	8014CECh	//controls the 15 turn limit for pvp
//.org 0x08006C20	::	b	8006C3Eh	//checks if p2 has custom bug (hp drain)








	.if breakthings
	

		//hardcode some values to prevent link mode from auto disconnecting when not actually linked
		.org 0x08008906 
			mov r0,7h

		.org 0x08132544 
			mov r0,3h
		
		
		.org 0x08008C82	::	mov r2,6h
		.org 0x080074A4	::	mov r0,6h
		.org 0x08014CDE	::	mov r1,6h
		.org 0x0800FF44	::	mov r0,6h
		.org 0x080074AE	::	mov r1,6h
		
		.org 0x080073C8	::	mov r1,6h
		.org 0x080B0504	::	mov r0,6h
		.org 0x080B49A6	::	mov r1,6h

		//.org 0x08	::	mov r,6h
		
	.else
	.endif






.else
.endif




.org 0x0800859E
	bl	DelayBuffer








/*	code for figuring out simulated pvp that's been replaced with cleaner implementations










//EXPERIMENTAL: allow pve battles to show if the opponent has an active trap
	.org 0x0800FF48
//		nop


//make the custom screen input check use the pvp mode routine
.org 0x0800700E
//	cmp		r0,6h


//attempt syncing clients: prevent starting battle until the script manually initiates it
//	(this breaks pve battles)
.org 0x080048CA
//	mov		r1,4h


//remove pve check that prevents puppet megaman from being able to use chips
.org 0x080073CC
//	nop

//modify pve check to allow puppet megaman to use navi chips and properly target the opponent
.org 0x08008F00	
//	cmp		r0,6h
.org 0x080D1AE2
//	cmp		r0,6h


//make it display the "turn X start" message instead of "battle start"
.org 0x08006A26
//	mov r0,0Bh



*/




















//for experimenting
//remap folder memory to free space that gets stored in the .sav

/*
.org 0x0800194C :: .dw 0x020052A0
.org 0x08004E08 :: .dw 0x020052A0
.org 0x08007EA4 :: .dw 0x020052A0
.org 0x08008134 :: .dw 0x020052A0
.org 0x08011438 :: .dw 0x020052A0
.org 0x08027440 :: .dw 0x020052A0
.org 0x08033F84 :: .dw 0x020052A0
.org 0x08034288 :: .dw 0x020052A0
.org 0x0803C958 :: .dw 0x020052A0
.org 0x082374E8 :: .dw 0x020052A0
*/

