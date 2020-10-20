
//MetalMan fight for testing
.org 0x0812BE50 :: .db 0x00 	;acdc background
.org 0x0812BE51 :: .db 0x06		;no chip reward
.org 0x0812BE52 :: .db 0x00 	;folder unshuffled
.org 0x0812BE54 :: .db 0x00 	;allow running
.org 0x0812BE57 :: .db 0x10 	;music/enable running

.org 0x0801A11D :: .db 0x02 		;mm position
.org 0x0801A120 :: .dw 0x01020500 	;enemy 1 megaman
.org 0x0801A124 :: .dw 0x08010601 	;no enemy
.org 0x0801A128 :: .dw 0x08030601 	;no enemy

//0812C29C	reads background value

//08002904	this routine reads the battle configuration. Breakpoint it to get the data for any battle.


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

