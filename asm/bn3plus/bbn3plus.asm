


// This file defines the EQU values for the addresses used by the patch
// (for BBN3 we've already ran it earlier in the compiling process, so we won't run it again)
//.include boffsetsblueus.asm


// And this file is ran inside "expanded_space.asm", so it also won't be ran here
//.include bbn3plusext.asm



// Jack In Animation hack
.org off0x08029900
ldr	r0,=JackInFadeIn|1b
bx	r0
.pool

.org off0x08029924
ldr	r4,=JackInAnimation|1b
mov	r14,r15
bx	r4
b	off0x08029930
.pool

.org off0x08029934
ldr	r1,=JackInFadeOut|1b
bx	r1
.pool

.org off0x0802999C
dcd	0x340,0x540

.org off0x080299AC
dcd	JackInFrames



// NaviCust Animation hack
.org off0x08047918
ldr	r0,=NaviCustPrepare|1b
bx	r0
.pool

.org off0x080478AC
ldr	r0,=NaviCustPrepare2|1b
mov	r14,r15
bx	r0
b	off0x080478B8
.pool

.org off0x080478D0
ldr	r0,=NaviCustPrepare3|1b
bx	r0
.pool

.org off0x080478DC
dcd	0x3B41

.org off0x08047894
dcd	NaviCustAnimation|1b



;eof