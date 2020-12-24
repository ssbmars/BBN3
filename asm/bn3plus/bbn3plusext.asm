



//
//
//	Prof9 BN3 Plus Patch (for translated versions)
//
//


JackInFadeIn:
mov	r0,1h
mov	r1,10h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,4h
strb	r0,[r5,1h]
pop	r15

JackInAnimation:
push	r14
mov	r7,r10
ldr	r4,[r7,10h]
strh	r1,[r4]

ldr	r1,=off0x08029984
ldr	r1,[r1,r0]

push	r0,r1,r3,r5
mov	r0,r2
ldr	r1,=off0x02010800
swi	11h
pop	r0,r1,r3,r5

push	r0,r3,r5
ldr	r0,=off0x02010800
mov	r2,4Bh
lsl	r2,r2,8h
ldr	r3,=off0x08000B7D
mov	r14,r15
bx	r3
pop	r0,r3,r5

ldr	r1,=off0x08029990
ldr	r1,[r1,r0]
mov	r0,r3
mov	r2,20h
ldr	r3,=off0x08000B7D
mov	r14,r15
bx	r3

ldrb	r0,[r5,2h]
add	r0,1h
strb	r0,[r5,2h]
pop	r15

JackInFadeOut:
strb	r0,[r5,1h]
mov	r0,0h
strb	r0,[r5,2h]
mov	r0,2h
mov	r1,40h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
ldr	r0,=off0x08029941
mov	r14,r15
bx	r0
pop	r15
.pool

JackInFrames:
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	JackInFrame4,JackInPal4
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	JackInFrame4,JackInPal4
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	JackInFrame4,JackInPal4
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	JackInFrame4,JackInPal4
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	JackInFrame4,JackInPal4
dcd	JackInFrame0,JackInPal0
dcd	JackInFrame1,JackInPal1
dcd	JackInFrame2,JackInPal2
dcd	JackInFrame3,JackInPal3
dcd	0xFFFFFFFF

JackInPal0:
.import Pal0Path
JackInPal1:
.import Pal1Path
JackInPal2:
.import Pal2Path
JackInPal3:
.import Pal3Path
JackInPal4:
.import Pal4Path

JackInFrame0:
.import Frame0Path
JackInFrame1:
.import Frame1Path
JackInFrame2:
.import Frame2Path
JackInFrame3:
.import Frame3Path
JackInFrame4:
.import Frame4Path



NaviCustPrepare:
push	r4-r7,r14

ldr	r0,=off0x08001CB1
mov	r14,r15
bx	r0
ldr	r0,=off0x08001D09
mov	r14,r15
bx	r0

ldr	r0,=NCPETTiles
ldr	r1,=off0x02010800
swi	11h

ldr	r0,=off0x02010800
ldr	r1,=off0x06008040
ldr	r2,=NCPETTiles
ldr	r2,[r2]
lsr	r2,r2,0Ah
mov	r3,3h
ldr	r4,=84000000h
ldr	r5,=off0x080009C9
mov	r14,r15
bx	r5

mov	r0,8h
ldr	r1,=off0x080009F5

ldr	r0,=NCBGTiles
ldr	r1,=off0x02010800
swi	11h

ldr	r0,=off0x02010800
ldr	r1,=off0x06000020
ldr	r2,=NCBGTiles
ldr	r2,[r2]
lsr	r2,r2,0Ah
mov	r3,3h
ldr	r4,=84000000h
ldr	r5,=off0x080009C9
mov	r14,r15
bx	r5

mov	r0,8h
ldr	r1,=off0x080009F5

ldr	r0,=NCLetterTiles
ldr	r1,=off0x02010800
swi	11h

ldr	r0,=NCPalettes
ldr	r1,=off0x02009810
mov	r2,80h
ldr	r3,=off0x08000B7D
mov	r14,r15
bx	r3

mov	r0,r10
ldr	r0,[r0,5Ch]
mov	r1,2h
lsl	r1,r1,0Bh
add	r1,r1,r0
ldr	r0,=NCAnimData
mov	r2,80h
lsl	r2,r2,1h
ldr	r3,=off0x08000B7D
mov	r14,r15
bx	r3

mov	r0,0h
mov	r1,0h
mov	r2,1h
ldr	r3,=NCBGTilemap
mov	r4,1Eh
mov	r5,14h
ldr	r6,=off0x08001DB1
mov	r14,r15
bx	r6

pop	r4-r7,r15
.pool


NaviCustPrepare2:
strh	r1,[r0,10h]
strh	r1,[r0,12h]
strh	r1,[r0,14h]
strh	r1,[r0,16h]
strh	r1,[r0,18h]
strh	r1,[r0,1Ah]
ldr	r0,[r7,38h]
mov	r1,3Fh
strb	r1,[r0,8h]
mov	r1,11h
strb	r1,[r0,0Ah]
mov	r1,0h
strb	r1,[r0,1h]
mov	r1,0h
strb	r1,[r0,5h]
mov	r1,0F0h
strb	r1,[r0]
mov	r1,0A0h
strb	r1,[r0,4h]
mov	r15,r14

NaviCustPrepare3:
mov	r0,25h
ldr	r1,=off0x080005D9
mov	r14,r15
bx	r1
ldr	r0,=off0x0802BCE9
mov	r14,r15
bx	r0
ldr	r0,=off0x08047818
ldr	r1,=off0x0802BC59
mov	r14,r15
bx	r1
mov	r0,4h
ldr	r1,=off0x080478D9
bx	r1
.pool

NaviCustAnimation:
push	r14

ldr	r0,=NaviCustSubRoutines
ldrb	r1,[r5,1h]
ldr	r0,[r0,r1]
mov	r14,r15
bx	r0

bl	NaviCustAnimation2
pop	r15
.pool

NaviCustSubRoutines:
dcd	NaviCustSub0|1b
dcd	NaviCustSub1|1b
dcd	NaviCustSub2|1b
dcd	NaviCustSub3|1b
dcd	NaviCustSub4|1b
dcd	NaviCustSub5|1b
dcd	NaviCustSub6|1b
dcd	NaviCustSub7|1b
dcd	NaviCustSub8|1b
dcd	NaviCustSub9|1b
dcd	NaviCustSub10|1b
dcd	0
dcd	0
dcd	0
dcd	0
dcd	0
dcd	NaviCustSub11|1b

NaviCustSub0:
push	r14
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,10h
blt	@@end

mov	r0,3h
mov	r1,8h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]
@@end:
bl	NaviCustSubEnd
pop	r15
.pool

NaviCustSub1:
push	r14
ldr	r0,=off0x080052C9
mov	r14,r15
bx	r0
beq	@@end

mov	r0,0h
strh	r0,[r5,4h]

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]
@@end:
bl	NaviCustSubEnd
pop	r15
.pool

NaviCustSub2:
push	r14
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,30h
blt	@@end

mov	r0,0h
strh	r0,[r5,4h]

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]
@@end:
bl	NaviCustSubEnd
pop	r15
.pool

NaviCustSub3:
push	r14

mov	r7,r10
ldr	r0,[r7,10h]
ldr	r1,=3F41h
strh	r1,[r0]
mov	r0,40h
lsl	r0,r0,8h
str	r0,[r5,8h]
str	r0,[r5,0Ch]
mov	r0,50h
neg	r0,r0
strh	r0,[r5,10h]
mov	r0,4Ah
strh	r0,[r5,12h]
mov	r0,1h
lsl	r0,r0,8h
strh	r0,[r5,14h]
strh	r0,[r5,16h]
mov	r0,0h
lsl	r0,r0,8h
strh	r0,[r5,18h]
ldr	r0,=11Dh
ldr	r1,=off0x080005B9
mov	r14,r15
bx	r1
mov	r0,0h
strh	r0,[r5,4h]

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]
@@end:
bl	NaviCustSubEnd
pop	r15
.pool

NaviCustSub4:
push	r14
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,10h
blt	@@end

mov	r0,0h
strh	r0,[r5,4h]

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]

@@end:
mov	r1,0Ah
mul	r4,r1
mov	r0,50h
neg	r0,r0
add	r0,r0,r4
strh	r0,[r5,10h]
bl	NaviCustSubEnd2
pop	r15
.pool

NaviCustSub5:
push	r14
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,84h
bne	@@skip
ldr	r0,=off0x0802BCE9
mov	r14,r15
bx	r0

@@skip:
cmp	r4,0A0h
blt	@@end
ldr	r0,=142h
ldr	r1,=off0x080005B9
mov	r14,r15
bx	r1
mov	r0,0h
strh	r0,[r5,4h]

ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]
@@end:
bl	NaviCustSubEnd2
pop	r15
.pool

NaviCustSub6:
push	r14
ldrh	r4,[r5,4h]
add	r4,2h
strh	r4,[r5,4h]
cmp	r4,20h
blt	@@end

mov	r0,0h
strh	r0,[r5,4h]
ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]

@@end:
ldrh	r0,[r5,18h]
lsl	r1,r4,7h
add	r0,r0,r1
strh	r0,[r5,18h]
ldrh	r0,[r5,14h]
lsl	r1,r4,0h
sub	r0,r0,r1
strh	r0,[r5,14h]
strh	r0,[r5,16h]
bl	NaviCustSubEnd2
pop	r15
.pool

NaviCustSub7:
push	r14
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,10h
blt	@@end

mov	r0,4h
mov	r1,20h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r7,r10
ldr	r0,[r7,38h]
mov	r1,3Fh
strb	r1,[r0,8h]
mov	r1,1h
strb	r1,[r0,0Ah]
mov	r0,0h
strh	r0,[r5,4h]
ldrb	r0,[r5,1h]
add	r0,0Ch
strb	r0,[r5,1h]

@@end:
bl	NaviCustSubEnd2
pop	r15
.pool

NaviCustSub8:
push	r14
ldrh	r4,[r5,4h]
add	r4,18h
strh	r4,[r5,4h]
cmp	r4,50h
blt	@@end
mov	r4,4Fh
mov	r0,0h
strh	r0,[r5,4h]
ldrb	r0,[r5,1h]
add	r0,4h
strb	r0,[r5,1h]

@@end:
mov	r0,r10
ldr	r0,[r0,38h]
mov	r1,0h
add	r1,r1,r4
strb	r1,[r0,5h]
mov	r1,9Fh
sub	r1,r1,r4
strb	r1,[r0,4h]
bl	NaviCustSubEnd2
pop	r15
.pool

NaviCustSub9:
push	r14
ldr	r0,=off0x080052C9
mov	r14,r15
bx	r0
beq	@@end
mov	r0,4h
mov	r1,0FFh
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,8h
strb	r0,[r5]

@@end:
pop	r15
.pool

NaviCustSub10:
push	r14
ldr	r0,=off0x080052C9
mov	r14,r15
bx	r0
beq	NaviCustSub10End
mov	r0,4h
mov	r1,0FFh
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,8h
strb	r0,[r5]

NaviCustSub10End:
pop	r15
.pool

NaviCustSub11:
push	r14
ldr	r0,=80052C9h
mov	r14,r15
bx	r0
beq	NaviCustSub10End
ldrh	r4,[r5,4h]
add	r4,1h
strh	r4,[r5,4h]
cmp	r4,14h
blt	@@end

mov	r0,4h
mov	r1,10h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,8h
strb	r0,[r5]

@@end:
pop	r15
.pool

NaviCustSubEnd:
push	r4-r7,r14
mov	r7,r10
ldr	r7,[r7,4h]
ldrh	r0,[r7,2h]
mov	r1,3h
tst	r1,r0
beq	@@end

mov	r0,0h
strh	r0,[r5,4h]
mov	r0,4h
strb	r0,[r5]
mov	r0,40h
strb	r0,[r5,1h]
mov	r0,3h
mov	r1,0FFh
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,r10
ldr	r0,[r0,10h]
ldr	r1,=3F41h
strh	r1,[r0]
mov	r0,40h
lsl	r0,r0,8h
str	r0,[r5,8h]
str	r0,[r5,0Ch]
mov	r0,50h
strh	r0,[r5,10h]
mov	r0,4Ah
strh	r0,[r5,12h]
mov	r0,10h
lsl	r0,r0,4h
strh	r0,[r5,14h]
strh	r0,[r5,16h]
mov	r0,0h
lsl	r0,r0,8h
strh	r0,[r5,18h]
mov	r0,r10
ldr	r0,[r0,38h]
mov	r1,0h
strb	r1,[r0,1h]
mov	r1,0F0h
strb	r1,[r0]
mov	r1,0h
strb	r1,[r0,5h]
mov	r1,0A0h
strb	r1,[r0,4h]
mov	r0,1h
strb	r0,[r5,3h]

@@end:
pop	r4-r7,r15
.pool

NaviCustSubEnd2:
push	r4-r7,r14
mov	r7,r10
ldr	r7,[r7,4h]
ldrh	r0,[r7,2h]
mov	r1,3h
tst	r1,r0
beq	@@end

mov	r0,8h
strb	r0,[r5]
mov	r0,4h
mov	r1,10h
ldr	r2,=off0x08005289
mov	r14,r15
bx	r2
mov	r0,1h
strb	r0,[r5,3h]

@@end:
pop	r4-r7,r15
.pool

NaviCustAnimation2:
push	r14
ldr	r0,=off0x0802BC75
mov	r14,r15
bx	r0
ldr	r0,=off0x0802BCA1
mov	r14,r15
bx	r0

mov	r0,r5
add	r0,8h
mov	r1,r10
ldr	r1,[r1,10h]
add	r1,1Ch
mov	r2,1h
swi	0Eh
bl	NaviCustAnimation3
pop	r15
.pool

NaviCustAnimation3:
push	r4-r7,r14
ldrh	r0,[r5,6h]
add	r4,r0,1h
ldr	r1,=NaviCustAnimationData
ldrb	r2,[r1,r0]
cmp	r2,0FFh
bne	@@continue
mov	r4,1h
ldrb	r2,[r1]

@@continue:
lsl	r2,r2,5h
ldr	r0,=NCPalettes
add	r0,r0,r2
add	r0,60h
ldr	r1,=off0x02009870
mov	r2,20h
ldr	r6,=off0x08000B7D
mov	r14,r15
bx	r6
strh	r4,[r5,6h]
pop	r4-r7,r15
.pool

NaviCustAnimationData:
dcb	0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01
dcb	0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05
dcb	0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09
dcb	0x0A,0x0A,0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0xFF

.align 4
NCPETTiles:
.import "asm\bn3plus\navicust\petset.bin"
NCBGTiles:
.import "asm\bn3plus\navicust\bgset.bin"
NCLetterTiles:
.import "asm\bn3plus\navicust\letterset.bin"
NCPalettes:
.import "asm\bn3plus\navicust\palettes.bin"
NCAnimData:
.import "asm\bn3plus\navicust\animdata.bin"
NCBGTilemap:
.import "asm\bn3plus\navicust\bgmap.bin"

;eof