
//MetalMan fight for testing
.org 0x0812BE50 :: .db 0x00 	;acdc background
.org 0x0812BE51 :: .db 0x0B		;battle type, pvp
//.org 0x0812BE52 :: .db 0x00 	;folder unshuffled
;.org 0x0812BE54 :: .db 0x00 	;allow running
;.org 0x0812BE57 :: .db 0x10 	;music/enable running

.org 0x0801A11D :: .db 0x02 		;mm position
.org 0x0801A120 :: .dw 0x00020501 	;enemy 1 megaman
.org 0x0801A124 :: .dw 0x08010601 	;no enemy
.org 0x0801A128 :: .dw 0x08030601 	;no enemy


//0812C29C	reads background value

//08002904	this routine reads the battle configuration. Breakpoint it to get the data for any battle.



//strange music test
;.org 0x08004DC0
;	bl	waitmusictest

.org 0x0800646C
	bl RollbackLoop

//this is the routine ^^it would normally branch to 
.org 0x08014944
	nop
	nop
	ldr		r0,=rbl_returnaddr|1
	bx		r0
	.pool
	//it branches here and then immediately branches back, which does nothing within the game itself
	//but this will be an opcode trigger for the netplay script





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


// allow the script to create an infinite loop while initializing battle
// (shouldn't loop if the script is inactive)
.org 0x0800761A
	bl	StallBattleStart




//	EXPERIMENTAL: make the pvp mode byte work offline


//breaks the match if not hardcoded
.org 0x08008C86	::	b	8008C98h	//causes comm error
.org 0x08006520	::	b	8006524h	//prevents battle from loading in
.org 0x0800685C	::	b	8006866h	//softlocks when the battle ends (tested w/ winning & running)

//hardcode to influence certain features
.org 0x08006912 ::	b	8006940h	//where it puts you after battle ends (currently returns to ow)
//.org 0x0800735E	::	b	8007372h	//controls if you can run from battle


//keep an eye on these, research their impact
//.org 0x080078D2	::	b	800791Eh	//may be RNG related

	//this one is pretty important, it's related to the mechanic that will properly flip hitboxes for p2
	//.org 0x08008C64	::	b	8008C6Ah	//


//effect unknown
.org 0x080059C7 ::	.db 0x0C	//value read by using battle value as a pointer, effect unknown
//.org 0x080071D8	::	b	80071EAh	//runs every frame, if it weren't disabled, it would read something that's possibly related to pointers for gamestate-related routines that can run in pvp


//disabled but doesn't seem to break things, their real impact is unknown
//
//some of these may have an impact on RNG values
//.org 0x0801494C ::	nop
//.org 0x08005A04 ::	nop		//something related to the cust data, runs at match start
//.org 0x080074B2 ::	nop		//runs at cust and in battle, but seemingly only when displaying a chip name
//.org 0x08007694 ::	nop		//looks similar to the one at 0x080074B2 but only runs while battle loading in
//.org 0x08006662 ::	nop		//runs once while loading in, seems to affect how it reads battle config data





.org 0x0800859E
	bl	DelayBuffer


// this does nothing, but it's a consistent offset for the script to check for, the input routine
// will branch here to signify that it's finished cycling the stack but hasn't applied p2's inputs yet
.org 0x08008800
scriptinjectinputs:
	nop
	mov		r15,r14
scriptsetport:
	nop
	mov		r15,r14
scriptbeginresim:
	nop
	mov		r15,r14
scriptstopresim:
	nop
	mov		r15,r14
scriptwaitloop:
	nop
	mov		r15,r14








