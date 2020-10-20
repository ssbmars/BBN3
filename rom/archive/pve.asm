.gba
.open "inputrom.gba","pveoutput.gba",0x8000000
.loadtable "text_table.txt"

// Changes byte at 0x123456 to 0xAB
//.org 0x8123456
//    .db    0xAB

// Changes halfword (2 bytes little endian) at 0x123456 to 0xABCD
//.org 0x8123456
//    .dh    0xABCD

// Changes word (4 bytes little endian) at 0x123456 to 0xABCDEF00
//.org 0x8123456
//    .dw    0xABCDEF00

//-------- Quality of Life Changes

//Make HP visually drain faster, from tutorial
.org 0x08010E22 :: .db 0x0F


//Time Trial battles without xtrafolder
.org 0x08028556 :: .dh 0x46C0

//-------- System Changes

.org 0x080B4E38 :: .db 0x0A 	;visual white flash time
.org 0x080B4E3C :: .db 0x3C 	;flashing (invis) time


// --- bind shield input to Select
.org 0x080B4C68
nop
lsl r6,r2,1Ch
lsr r6,r6,1Ch
cmp r6,4h
blt 80B4C7Ch
cmp r6,8h
bge 80B4C7Ch
// --- disable B button combination check
.org 0x080B4802 :: nop


//-------- Navi Customizer Changes

//antidamage (framedata applies to chip too)
.org 0x080b2152 :: .db 0x1A 	;active time
.org 0x080B216C :: .db 0x28 	;cooldown on miss
.org 0x080B22FE :: .db 0x10 	;throw endlag
.org 0x080B2352 :: .db 0x06 	;cooldown on hit
.org 0x080B5295 :: .db 0xE0 	;disable antispam
.org 0x08340958 :: .db 0x7D 	;plushie despawn time
// animation frames
.org 0x0823895C :: .db 0x00 	;standing in air, remove
.org 0x08238970 :: .db 0x01 	;arms folded
.org 0x08238984 :: .db 0x00 	;hand out pre blur, remove
.org 0x08238998 :: .db 0x02 	;hand smear
.org 0x082389AC :: .db 0x00 	;hand out 1, remove
.org 0x082389C0 :: .db 0x00 	;hand out 2, remove


//reflect / shield
;.org 0x080B140E :: .db 0x1A	;active defense
.org 0x080B1582 :: .db 0x01	;action state after endlag 1
.org 0x080B1564 :: .db 0x12	;endlag 2 value


// ---------- Chip Changes

// Rook HP 300
.org 0x080E52BE :: .dh 0x0c12

// Rope 2 & 3 - reduce stun
.org 0x08011EF8 :: .db 0x00
.org 0x08011F18 :: .db 0x00

// Shock/Sonic/Dyna Wave - crack panels
.org 0x08011A98 :: .db 0x03
.org 0x08011AB8 :: .db 0x03
.org 0x08011AD8 :: .db 0x03

// Random Meteor HP 210
.org 0x080FBA28 :: .db 0xD2

// Hole Meteor HP 210
.org 0x080FBA29 :: .db 0xD2

// Shot Meteor HP 210
.org 0x080FBA2A :: .db 0xD2

// Needlers' HP 150
;v1
.org 0x080E176E :: .db 0x96
;v2
.org 0x080E1772 :: .db 0x96
;v3
.org 0x080E1776 :: .db 0x96

// Team1 HP 150
.org 0x080E8F66 :: .db 0x96

// Custom Sword damage logic
.org 0x0801061A
b 8010632h
.org 0x08010632
sub r1,0h
mov r0,4Bh
.org 0x0801063C
add r0,38h


// ------------ Framedata Changes

// --- Time Freeze Chips ---

// ------ Magnum
.org 0x080C8028 :: .db 0x18 	;v1 cursor speed
.org 0x080C8029 :: .db 0x18 	;v2 crsr spd
.org 0x080C802A :: .db 0x08 	;v3 crsr spd
.org 0x082D1074 :: .db 0x17 	;crsr sprite keyframe cycle

// ------ MetalMan

.org 0x080BE4D6 :: .db 0x3c 	;IW


// ---- Real Time Chips ----

// ------ Heat Charge Shot
.org 0x082389E8 :: .db 0x01 	;SL

// ------ Buster
.org 0x080B10D0 :: .db 0x02 	;CL

// ------ Ice Wave
.org 0x080B3666 :: .db 0x1E 	;EL
.org 0x080B3682 :: .db 0x01 	;CL

// ------ Spreader
.org 0x080B168A :: .db 0x0A 	;EL
.org 0x080B169E :: .db 0x01 	;CL

// ------ Bomb Throw
.org 0x080B177C :: .db 0x01 	;CL

// ------ Fishy
.org 0x080B30BC :: .db 0x0A 	;SL
.org 0x080B329E :: .db 0x08 	;CL

// ------ Condor
.org 0x080B30BD :: .db 0x0F 	;SL

// ------ Boomer
.org 0x080B2DF8 :: .db 0x14 	;CL

// ------ Rock Arm
.org 0x080B2CC8 :: .db 0x0F 	;CL

// ------ Lava Cannon
.org 0x080B411E :: .db 0x0C 	;SL

// ------ Black Bomb
.org 0x080B3740 :: .db 0x19 	;CL

// ------ Burner
.org 0x080B344E :: .db 0x01 	;SF
.org 0x080B34A0 :: .db 0x01 	;SF
.org 0x080B3500 :: .db 0x01 	;SF
.org 0x080B3546 :: .db 0x01 	;CL

// ------ Burning
.org 0x080B3500 :: .db 0x01 	;SF
.org 0x080B34A0 :: .db 0x01 	;SF
.org 0x080B3546 :: .db 0x01 	;CL

// ------ Shock Wave
.org 0x080B1B30 :: .db 0x03 	;CL

// ------ Air Storm
.org 0x080B3E18 :: .db 0x03 	;v1 pull duration
.org 0x080B3E19 :: .db 0x03 	;v2 pull duration
.org 0x080B3E1A :: .db 0x03 	;v3 pull duration
.org 0x080B3E26 :: .db 0x01		;time between wind pulls
.org 0x080B3E70 :: .db 0x06 	;pause duration
.org 0x080B3EA2 :: .db 0x06 	;time between tornado spawns
.org 0x080B3EE0 :: .db 0x04 	;CL

// ------ Ratton
.org 0x080B2DA4 :: .db 0x04 	;v1 CL
.org 0x080B2DA5 :: .db 0x04 	;v2 CL
.org 0x080B2DA6 :: .db 0x04 	;v3 CL

// ------ Arrow
.org 0x080B4346 :: .db 0x01 	;CL

// ------ Shake
.org 0x080B42BC :: .db 0x01 	;CL

// ------ Guts Punches
.org 0x080B274C :: .db 0x3C 	;IW

// ------ Waves
.org 0x080B4090 :: .db 0x0A 	;CL

// ------ Spice
.org 0x080B3A6E :: .db 0x1E 	;CL

// ------ Geyser
.org 0x080B35F4 :: .db 0x01 	;CL

// ------ Rope
//.org 0x08238B28 :: .db 0x 	;startup 1
//.org 0x08238B3C :: .db 0x 	;startup 2
.org 0x08238B50 :: .db 0x04 	;pre attack 1
.org 0x08238B64 :: .db 0x06 	;pre attack 2
//.org 0x08238B78 :: .db 0x 	;???
.org 0x08238B8C :: .db 0x04 	;endlag
.org 0x08238BA0 :: .db 0x04 	;recoil 1
.org 0x08238BB4 :: .db 0x04 	;recoil 2
.org 0x080B3FF8 :: .db 0x14 	;CL

// ------ Pawn
.org 0x080E547A :: .db 0x3C 	;EL on swing

// ------ Shake
.org 0x080E7616 :: .db 0x0F 	;movement count

// ------ Team1
.org 0x080DF19E :: .db 0x06 	;attack delay

.org 0x082C8244 :: .db 0x00 	;keyframe timers
.org 0x082C8258 :: .db 0x00
.org 0x082C826C :: .db 0x01
.org 0x082C8280 :: .db 0x01
.org 0x082C8294 :: .db 0x01
.org 0x082C82A8 :: .db 0x01


//-------------------- Flinch and Status changes

// ------ Bomb Throw
.org 0x080D616C :: .db 0x01 	;FL

// ------ ElecSword 	;stun
.org 0x080D66EB :: .db 0x00 	;FL
.org 0x080D66E8 :: .db 0x10 	;ST

// ------ Needler 	;no flinch
.org 0x080E16BC :: .db 0x00 	;FL

// ------ Team 1 	;flinch
.org 0x080DF1AE :: .db 0x01 	;FL

// ------ Pawn 		;flinch
;.org 0x080D66D3 :: .db 0x01 	;FL

// ------ Shake 	;flinch
.org 0x080E754C :: .db 0x01 	;FL

// ------ Meteor
;.org 0x080D6DC2 :: .db 0x01 	;FL

// ------ LavaStage
;.org 0x080AF376 :: .db 0x01 	;FL

// ------ Guts Machinegun
;.org 0x080D5E12 :: .db 0x00		;final hit


// -------------- Damage Changes ---------

// Friendly Viruses
;disable redistributing food
.org 0x08130E6A :: .dh 0x0000
.org 0x08130E6E :: .db 0x00
;disable feeding virus
.org 0x081312C0 :: .db 0x00 ;max virus food
;branch if max not reached, change to unconditional branch
.org 0x081312C2 :: .dh 0xE00D 
;value to increase FV atk by when feeding
.org 0x08131330 :: .db 0x00 
;hook forced food values
.org 0x0802200E
bl 8235160h
nop
nop
.org 0x08235160 
mov r0,0h
strb r0,[r5,6h]
strb r0,[r5,7h]
strb r0,[r5,3h]
mov r1,2h
lsl r1,r1,18h
mov r2,0h
str r0,[r1,r2]
add r2,4h
cmp r2,28h
blt 823516Eh
mov r0,1h
mov r2,1Bh
strb r0,[r1,r2]
mov r2,24h
strb r0,[r1,r2]
mov r2,25h
strb r0,[r1,r2]
bl 8022016h

;change value check for skipping FV version
.org 0x080CBD88
cmp r2,1h
bge 80CBD96h

//181 KillerEye
.org 0x0800D77F :: .db 0x00 ;omega 0
.org 0x08012cbc :: .dh 0x0064 ;damage display
.org 0x08012cc3 :: .db 0x04 ;chip class show atk
.org 0x08012cb6 :: .db 0x00 ;elem display null
.org 0x080CC50E :: .db 0x00 ;elem actually be null
;speed values
.org 0x080CC640 :: .db 0x1E	;first cycle delay
.org 0x080CC686 :: .db 0x1E	;cycle speed
.org 0x080CC8C8 :: .db 0x1E ;laserdot timing

//182 Scuttle
.org 0x0800D784 :: .db 0x82 ;beam 130
.org 0x0800D785 :: .db 0x5A ;fire 90
.org 0x0800D786 :: .db 0x64 ;ice 100
.org 0x0800D787 :: .db 0x50 ;elec 80
.org 0x0800D788 :: .db 0x00 ;vine 0
.org 0x0800D789 :: .db 0x00 ;omega 0
;speed values
.org 0x080D0216 :: .db 0x1E ;cycle speed
.org 0x080D01D0 :: .db 0x1E ;stall speed at first

//M Poltergeist 50
.org 0x080b01fc
.db 0x32

//M Muramasa cap at 500
;.org 0x08010604 :: .db 0x49
;.org 0x0801060C :: .db 0x00
.org 0x08010604 :: lsl r1,r1,1h
.org 0x0801060C :: nop

/*
//-------- Attack/Support Type Changes

//Guard > Attack (reverted)
//.org 0x080123db
//.db 0x01

//Poltergeist > Attack (reverted)
//.org 0x08012fbb
//.db 0x01

//Snake > Support
.org 0x0801257b
.db 0x02

//GrabBack > Support
.org 0x0801261b
.db 0x02

//GrabRevenge > Support
.org 0x0801263b
.db 0x02

//Meteors > Support
.org 0x08012f9b
.db 0x42

//Bubbleman 1/2 > Support
.org 0x0801335b  :: .db 0x42
.org 0x0801337b :: .db 0x42

//DarkMan 1/2 > Support
.org 0x0801399b :: .db 0x42
.org 0x080139bb :: .db 0x42

//PA DeuxHero > Support
.org 0x0801409b :: .db 0x42

//PA 2xHero > Support
.org 0x08013f7b :: .db 0x42


//-------- Chip Element Changes

;actually change the hitbox element for magnums
.org 0x080C7FC4 :: .db 0x00

;these are for display and atk+
// Magnum1 Null
.org 0x08011f36 :: .db 0x00

// Magnum2 Null
.org 0x08011f56 :: .db 0x00

// Magnum3 Null
.org 0x08011f76 :: .db 0x00


//-------- Chip Class Changes

//Varsword -Mega
.org 0x080119e3
.db 0x81

//Mole3 -Mega
.org 0x080129a3
.db 0x81

//Aura -Mega
.org 0x08012b23
.db 0x81

//Sanctuary -Mega
.org 0x08012c23
.db 0x81

//HeroSword -Standard
.org 0x08012f03
.db 0x24

// Poltergeist -Standard
.org 0x08012fc3
.db 0x24


//-------- Library Value Changes

//Varsword
.org 0x080119de
.db 0xCA

//Herosword
.org 0x08012efe
.db 0x27

//Poltergeist
.org 0x08012fbe
.db 0xac

*/

//-------- Changes for fixing exploits

//PrixPower -> KingMan v1
.org 0x080140d8 :: .db 0x30
.org 0x080140dc :: .dh 0x0045 	;atk 69

//GelRain -> MetaGel 1
.org 0x08013fd8 :: .db 0x0F

//-------- Code changes for balance

/*

//39 Herosword (no way of obtaining the extra codes yet)
//B L N P
.org 0x080123f0 :: .dh 0x0b01
.org 0x080123f2 :: .dh 0x0f0e

//103 Magnum
//A C H T V
//A B C M S
.org 0x08011F30 :: .dh 0x0100
.org 0x08011F32 :: .dh 0x0c02
.org 0x08011F34 :: .db 0x12

//121 Metagel
// Y > P
.org 0x080125b4 :: .db 0x0f

//131 Lance
// Y > *
.org 0x08011e74 :: .db 0x1a

//168 Airshoes
//H I N U Y *
//B Z I N G A
.org 0x08012a10 :: .dh 0x1901
.org 0x08012a12 :: .dh 0x0d08
.org 0x08012a14 :: .dh 0x0006

//170 Barrier 100
// * > B
.org 0x08012ad5 :: .db 0x01

//172 Poltergeist
// G > *
.org 0x08012fb0 :: .db 0x1a

//173 Northwind
// Z > *
.org 0x08012b34 :: .db 0x1a

//M Varsword
; L R U U U
.org 0x080119D0 :: .dw 0x1414110B
.org 0x080119D4 :: .db 0x14

//M Mole3
//L M
//K L
.org 0x08012992 :: .dh 0x0b0a

//M Aura
// Y > *
.org 0x08012b14 :: .db 0x1a


//-------- Library Fixes S/M


//Sanctuary
.org 0x08012c1e
.dh 0x00d9

//Mole3
.org 0x0801299e
.dh 0x00da

//Aura
.org 0x08012b1e
.dh 0x00db

//-----move down 1

//Lifeaura
.org 0x08012e3e
.dh 0x00dc

//Fullcust
.org 0x08012f7e
.dh 0x00dd

//Atk+30
.org 0x08012ebe
.dh 0x00de

//Navi+40
.org 0x08012ede
.dh 0x00df

//Roll
.org 0x0801307e
.dh 0x00e0

//Roll2
.org 0x0801309e
.dh 0x00e1

//Roll3 - disabled
.org 0x080130c3
//.db 0x92
.db 0x00
.org 0x080130be
.dh 0x011e

//Jealousy - disabled
.org 0x08012fe3
//.db 0x92
.db 0x00
.org 0x08012fde
.dh 0x011e

*/

// ---------- Guts to NavRcycl ---------- 
.org 0x08013157 :: .dh 0x0035
.org 0x0801315c :: .dh 0x0000
.org 0x0801315b :: .db 0x60
//code
.org 0x08013150 :: .db 0x1a
//icon
.org 0x08013164 :: .dw 0x086ad734
//sprite
.org 0x08013168 :: .dw 0x08800a10
//palette
.org 0x0801316c :: .dw 0x08801110
//name
.org 0x08704d03 :: .dw 0x1c3a2518
.org 0x08704d07 :: .dw 0x30273d27
//desc
.org 0x08707268 :: .dw 0x27291c02
.org 0x0870726c :: .dw 0x37303025
.org 0x08707270 :: .strn "\nlast Navi\nchip used"
/*
.org 0x08707268 :: .dw 0x27291c02
.org 0x0870726c :: .dw 0x37303025
.org 0x08707270 :: .dw 0x372530e8
.org 0x08707274 :: .dw 0x25180038
.org 0x08707278 :: .dw 0x39e82d3a
.org 0x0870727c :: .dw 0xeb282937
.org 0x08707280 :: .dw 0xece703f1
*/

// ---------- Proto to Bass ---------- 
.org 0x080131f7 :: .dh 0x4b14
.org 0x080131fc :: .dh 0x0046
//code
.org 0x080131f0 :: .db 0x17
//icon
.org 0x08013204 :: .dw 0x086ad834
//sprite
.org 0x08013208 :: .dw 0x088002f0
//palette
.org 0x0801320c :: .dw 0x088009f0
//name
.org 0x08704d30 :: .dw 0x3737250c
.org 0x08704d34 :: .dw 0x00000000
//desc
.org 0x0870731c :: .strn "DC Explds\ndown rows\nrandomlyFEBFEB"

// ---------- Flash to Serenade ---------- 
.org 0x08013297 :: .dh 0x5714
.org 0x0801329c :: .dh 0x0050
//elem
.org 0x08013296 :: .db 0x00
//code
.org 0x08013290 :: .db 0x12
//icon
.org 0x080132a4 :: .dw 0x086ad8b4
//sprite
.org 0x080132a8 :: .dw 0x08801130
//palette
.org 0x080132ac :: .dw 0x08801830
//name
.org 0x08704d5d :: .dw 0x2936291d
.org 0x08704d61 :: .dw 0x29282532
//desc
.org 0x087073c8 :: .dw 0x2f36250e
.org 0x087073cc :: .dw 0x2d2c2700
.org 0x087073d0 :: .dw 0x3312e834
.org 0x087073d4 :: .dw 0x34003d30
.org 0x087073d8 :: .dw 0x38e8363b
.org 0x087073dc :: .dw 0x362a0033
.org 0x087073e0 :: .dw 0xeb383233



// ---------- Beast to Balance ---------- 
.org 0x08013337 :: .dh 0x480c
.org 0x0801333c :: .dh 0x0000
.org 0x0801333b :: .db 0x42
//code
.org 0x08013330 :: .db 0x18
//icon
.org 0x08013344 :: .dw 0x086ad934
//sprite
.org 0x08013348 :: .dw 0x087ffbd0
//palette
.org 0x0801334c :: .dw 0x088002d0
//name
.org 0x08704d8a :: .dw 0x2530250c
.org 0x08704d8e :: .dw 0x00292732
//desc
.org 0x08707470 :: .dw 0x330c02f1
.org 0x08707474 :: .dw 0x12002c38
.org 0x08707478 :: .dw 0x2936e81a
.org 0x0870747c :: .dw 0x29273928
.org 0x08707480 :: .dw 0x3d26e828
.org 0x08707484 :: .dw 0x30252c00
.org 0x08707488 :: .dw 0xebeb472a


//-------- Bubble to AlphArm ---------- 
.org 0x080133d7 :: .dh 0x5414
.org 0x080133dc :: .dh 0x0028
//elem
.org 0x080133d6 :: .db 0x00
//code
.org 0x080133d0 :: .db 0x06
//icon
.org 0x080133e4 :: .dw 0x086ad7b4
//sprite
.org 0x080133e8 :: .dw 0x08801850
//palette
.org 0x080133ec :: .dw 0x08801f50
//name
.org 0x08704db7 :: .dw 0x2c34300b
.org 0x08704dbb :: .dw 0x6b31360b
//desc
.org 0x08707514 :: .dw 0x38373f04
.org 0x08707518 :: .dw 0xe8292b25
.org 0x0870751c :: .dw 0x27293029
.org 0x08707520 :: .dw 0x272d3638
.org 0x08707524 :: .dw 0x383825e8
.org 0x08707528 :: .dw 0x472f2725


// ---------- Desert to FlashMn ---------- 
.org 0x08013477 :: .dh 0x0414
.org 0x0801347c :: .dh 0x0064
//elem
.org 0x08013476 :: .db 0x01
//code
.org 0x08013470 :: .db 0x05
//sprite
.org 0x08013488 :: .dw 0x086eaacc
//palette
.org 0x0801348c :: .dw 0x086eb24c
//name
.org 0x08704de4 :: .dw 0x37253010
.org 0x08704de8 :: .dw 0x5b32172c
//desc
.org 0x087075c0 :: .dw 0x37253010
.org 0x087075c4 :: .dw 0x3825002c
.org 0x087075c8 :: .dw 0x2534e82f
.org 0x087075cc :: .dw 0x3d302536
.org 0x087075d0 :: .dw 0xe837293e
.org 0x087075d4 :: .dw 0x31293229
.org 0x087075d8 :: .dw 0xf1ebeb3d


// ---------- Insert Art ---------- 
//balance
.org 0x087ffbd0 :: .import "art/a_balance.bin"
.org 0x088002d0 :: .import "art/p_balance.bin"

//bass
.org 0x088002f0 :: .import "art/a_bass.bin"
.org 0x088009f0 :: .import "art/p_bass.bin"

//recycle
.org 0x08800a10 :: .import "art/a_recycle.bin"
.org 0x08801110 :: .import "art/p_recycle.bin"

//serenade
.org 0x08801130 :: .import "art/a_serenade.bin"
.org 0x08801830 :: .import "art/p_serenade.bin"

//sigma
.org 0x08801850 :: .import "art/a_sigma.bin"
.org 0x08801f50 :: .import "art/p_sigma.bin"

//black palette
.org 0x08801f70 :: .import "art/p_black.bin"


.close