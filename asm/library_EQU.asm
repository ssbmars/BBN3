

set 	EQU		ChipProperties

//				code
elem	EQU		Element
fam		EQU		Family
sublv	EQU		SubLevel
lim		EQU		Limit
mb		EQU		MegaByte
//				type
clss	EQU		Class
atk		EQU		Attack
pos		EQU		Position
//				icon
img		EQU		Image
color	EQU		Palette



.macro ChipProperties,ID
    .org ChipManifest + (ID * 0x20)
.endmacro


.macro SetChipOffset,offset
    .org (((.-ChipManifest) / 0x20) * 0x20) + ChipManifest + offset
.endmacro





.if IS_PVP

		.if ALL_STAR_CODES		//makes every chip come in * code with only 1 copy

			.macro Code,c1,c2,c3,c4,c5,c6
				SetChipOffset 0x0
				.db 0x1A
				SetChipOffset 0x1
				.db 0xFF
				SetChipOffset 0x2
				.db 0xFF
				SetChipOffset 0x3
				.db 0xFF
				SetChipOffset 0x4
				.db 0xFF
				SetChipOffset 0x5
				.db 0xFF
			.endmacro
			
			.macro code1,c,pos
				SetChipOffset pos
				.db 0x1A
			.endmacro
			
			.macro Position,val
				SetChipOffset 0x0E
        	.endmacro

		.else					//assign chip codes normally if ALL_STAR_CODES == 0

			.macro Code,c1,c2,c3,c4,c5,c6
				SetChipOffset 0x0
				.db c1
				SetChipOffset 0x1
				.db c2
				SetChipOffset 0x2
				.db c3
				SetChipOffset 0x3
				.db c4
				SetChipOffset 0x4
				.db c5
				SetChipOffset 0x5
				.db c6
			.endmacro
			
			.macro code1,c,pos
				SetChipOffset pos
				.db c
			.endmacro

			.macro Position,val
				SetChipOffset 0x0E
				.dh val
			.endmacro

	    .endif					//ALL_STAR_CODES endif


//	EVERYTHING FOR IS_PVP
//	this is what compiles normally for the PVP build, contains no debugging code


.macro Family,val
    SetChipOffset 0x7
    .db val
.endmacro


.macro SubLevel,val
    SetChipOffset 0x8
    .db val
.endmacro


.macro Limit,val
    SetChipOffset 0x9	//rarity
    .db val

    SetChipOffset 0xA	//megabyte
    .db (0x5 - val)
.endmacro


.macro Type,val			//ATK or Support, show or hide damage value
    SetChipOffset 0x0B
    .db val
.endmacro


.macro Class,val
    SetChipOffset 0x13
    .db val
.endmacro


.macro Attack,val
    SetChipOffset 0x0C
    .dh val
.endmacro


.macro Image,val
    SetChipOffset 0x18
    .dw val
    .org .-0x10
.endmacro


.macro Palette,val
    SetChipOffset 0x1C
    .dw val
    .org .-0x10
.endmacro



.else				//these only compile when IS_PVP == 0


//does NOT change code byte
.macro code1,c,pos				
    SetChipOffset pos
.endmacro

//does NOT change code bytes
.macro Code,c1,c2,c3,c4,c5,c6	
    SetChipOffset 0x0
    SetChipOffset 0x1
    SetChipOffset 0x2
    SetChipOffset 0x3
    SetChipOffset 0x4
    SetChipOffset 0x5
.endmacro


//does NOT change chip Family
.macro Family,val
    SetChipOffset 0x7
.endmacro


//does NOT change chip Family SubLevel
.macro SubLevel,val
    SetChipOffset 0x8
.endmacro


//changes ONLY the MB value of chip
.macro Limit,val
    SetChipOffset 0xA	//megabyte
    .db (0x5 - val)
.endmacro


//does NOT change chip Class
.macro Class,val
    SetChipOffset 0x13
.endmacro


//does NOT change chip ATK/SUP type
.macro Type,val
    SetChipOffset 0x0B
.endmacro


//does NOT change chip Attack value
.macro Attack,val
    SetChipOffset 0x0C
.endmacro


//does NOT change chip's position in library
.macro Position,val
    SetChipOffset 0x0E
.endmacro

//does NOT change chip image
.macro Image,val
    SetChipOffset 0x18
    .org .-0x10
.endmacro

//does NOT change chip palette
.macro Palette,val
    SetChipOffset 0x1C
    .org .-0x10
.endmacro



.endif					//IS_PVP endif



//THESE COMPILE UNCONDITIONALLY

.macro Element,val
	SetChipOffset 0x6
	.db val
.endmacro


.macro MegaByte,val
	SetChipOffset 0x0A
	.db val
.endmacro


.macro Icon,val
    SetChipOffset 0x14
    .dw val
    .org .-0x10
.endmacro






//14:Sword, BambSwrd, Slasher
//1C:CustSwrd
//24:Cannon (all 3), Spreader
//34:Bubbler  HeatSide, StepSwrd, StepCros

//PA chips have an extra value added to the Class value

//Standard Chip
S 		EQU 	0x04
Spa1	EQU		0x14
Spa2	EQU 	0x1C
Spa3	EQU 	0x24
Spa4	EQU 	0x34

//Mega Chip
M		EQU		0x81
Mpa 	EQU		0x91

//Giga Chip
G		EQU		0x82
Gpa		EQU		0x92


//Elements
null	EQU	0
elec	EQU	1
fire	EQU 2
aqua	EQU 3
wood	EQU 4


//Pitch-black palette offset
black	EQU		pal_black

//opposite-version Chip Icon offsets
icon_Balance	EQU		0x086ad934
icon_NavRcycl	EQU		0x086ad734
icon_AlphArmS	EQU		0x086ad7b4
icon_Bass		EQU		0x086ad834
icon_Serenade	EQU		0x086ad8b4




Cannon		EQU		0x01 
Hicannon	EQU		0x02 
Mcannon		EQU		0x03 
Airshot1	EQU		0x04 
Airshot2	EQU		0x05 
Airshot3	EQU		0x06 
Lavacan1	EQU		0x07 
Lavacan2	EQU		0x08 
Lavacan3	EQU		0x09 
ShotGun		EQU		0x0A 
VGun		EQU		0x0B 
SideGun		EQU		0x0C 
Spreader	EQU		0x0D 
Bubbler		EQU		0x0E 
BubV		EQU		0x0F 
BublSide	EQU		0x10 
Heatshot	EQU		0x11 
HeatV		EQU		0x12 
HeatSide	EQU		0x13 
MiniBomb	EQU		0x14 
SnglBomb	EQU		0x15 
DublBomb	EQU		0x16 
TrplBomb	EQU		0x17 
CannBall	EQU		0x18 
IceBall		EQU		0x19 
LavaBall	EQU		0x1A 
BlkBomb1	EQU		0x1B 
BlkBomb2	EQU		0x1C 
BlkBomb3	EQU		0x1D 
Sword		EQU		0x1E 
WideSwrd	EQU		0x1F 
LongSwrd	EQU		0x20 
FireSwrd	EQU		0x21 
AquaSwrd	EQU		0x22 
ElecSwrd	EQU		0x23 
BambSwrd	EQU		0x24 
CustSwrd	EQU		0x25 
VarSwrd		EQU		0x26 
StepSwrd	EQU		0x27 
StepCros	EQU		0x28 
Panic		EQU		0x29 
AirSwrd		EQU		0x2A 
Slasher		EQU		0x2B 
ShockWav	EQU		0x2C 
SonicWav	EQU		0x2D 
DynaWave	EQU		0x2E 
GutPunch	EQU		0x2F 
GutStrgt	EQU		0x30 
GutImpct	EQU		0x31 
AirStrm1	EQU		0x32 
AirStrm2	EQU		0x33 
AirStrm3	EQU		0x34 
DashAtk		EQU		0x35 
Burner		EQU		0x36 
Totem1		EQU		0x37 
Totem2		EQU		0x38 
Totem3		EQU		0x39 
Ratton1		EQU		0x3A 
Ratton2		EQU		0x3B 
Ratton3		EQU		0x3C 
Wave		EQU		0x3D 
RedWave		EQU		0x3E 
MudWave		EQU		0x3F 
Hammer		EQU		0x40 
Tornado		EQU		0x41 
Zapring1	EQU		0x42 
Zapring2	EQU		0x43 
Zapring3	EQU		0x44 
YoYo1		EQU		0x45 
YoYo2		EQU		0x46 
YoYo3		EQU		0x47 
Spice1		EQU		0x48 
Spice2		EQU		0x49 
Spice3		EQU		0x4A 
Lance		EQU		0x4B 
Scuttlst	EQU		0x4C 
Momogra		EQU		0x4D 
Rope1		EQU		0x4E 
Rope2		EQU		0x4F 
Rope3		EQU		0x50 
Magnum1		EQU		0x51 
Magnum2		EQU		0x52 
Magnum3		EQU		0x53 
Boomer1		EQU		0x54 
Boomer2		EQU		0x55 
Boomer3		EQU		0x56 
RndmMetr	EQU		0x57 
HoleMetr	EQU		0x58 
ShotMetr	EQU		0x59 
IceWave1	EQU		0x5A 
IceWave2	EQU		0x5B 
IveWave3	EQU		0x5C 
Plasma1		EQU		0x5D 
Plasma2		EQU		0x5E 
Plasma3		EQU		0x5F 
Arrow1		EQU		0x60 
Arrow2		EQU		0x61 
Arrow3		EQU		0x62 
TimeBomb	EQU		0x63 
Mine		EQU		0x64 
Sensor1		EQU		0x65 
Sensor2		EQU		0x66 
Sensor3		EQU		0x67 
CrsShld1	EQU		0x68 
CrsShld2	EQU		0x69 
CrsShld3	EQU		0x6A 
Geyser		EQU		0x6B 
PoisMask	EQU		0x6C 
PoisFace	EQU		0x6D 
Shake1		EQU		0x6E 
Shake2		EQU		0x6F 
Shake3		EQU		0x70 
BigWave		EQU		0x71 
Volcano 	EQU		0x72 
Condor		EQU		0x73 
Burning		EQU		0x74 
FireRatn	EQU		0x75 
Guard		EQU		0x76 
PanlOut1	EQU		0x77 
PanlOut3	EQU		0x78 
Recov10		EQU		0x79 
Recov30		EQU		0x7A 
Recov50		EQU		0x7B 
Recov80		EQU		0x7C 
Recov120	EQU		0x7D 
Recov150	EQU		0x7E 
Recov200	EQU		0x7F 
Recov300	EQU		0x80 
PanlGrab	EQU		0x81 
AreaGrab	EQU		0x82 
Snake		EQU		0x83 
Team1		EQU		0x84 
MetaGel1	EQU		0x85 
MetaGel2	EQU		0x86 
MetaGel3	EQU		0x87 
GrabBack	EQU		0x88 
GrabRvng	EQU		0x89 
Geddon1		EQU		0x8A 
Geddon2		EQU		0x8B 
Geddon3		EQU		0x8C 
RockCube	EQU		0x8D 
Prism		EQU		0x8E 
Wind		EQU		0x8F 
Fan			EQU		0x90 
RockArm1	EQU		0x91 
RockArm2	EQU		0x92 
RockArm3	EQU		0x93 
NoBeam1		EQU		0x94 
NoBeam2		EQU		0x95 
NoBeam3		EQU		0x96 
Pawn		EQU		0x97 
Knight		EQU		0x98 
Rook		EQU		0x99 
Needler1	EQU		0x9A 
Needler2	EQU		0x9B 
Needler3	EQU		0x9C 
SloGauge	EQU		0x9D 
FstGauge	EQU		0x9E 
Repair		EQU		0x9F 
Invis		EQU		0xA0 
Hole		EQU		0xA1 
Mole1		EQU		0xA2 
Mole2		EQU		0xA3 
Mole3		EQU		0xA4 
Shadow		EQU		0xA5 
Mettaur		EQU		0xA6 
Bunny		EQU		0xA7 
AirShoes	EQU		0xA8 
Team2		EQU		0xA9 
Fanfare		EQU		0xAA 
Discord		EQU		0xAB 
Timpani		EQU		0xAC 
Barrier		EQU		0xAD 
Barr100		EQU		0xAE 
Barr200		EQU		0xAF 
Aura		EQU		0xB0 
NrthWind	EQU		0xB1 
HolyPanl	EQU		0xB2 
LavaStge	EQU		0xB3 
IceStage	EQU		0xB4 
GrassStg	EQU		0xB5 
SandStge	EQU		0xB6 
MetlStge	EQU		0xB7 
Snctuary	EQU		0xB8 
Swordy		EQU		0xB9 
Spikey		EQU		0xBA 
Mushy		EQU		0xBB 
Jelly		EQU		0xBC 
KillrEye	EQU		0xBD 
AntiNavi	EQU		0xBE 
AntiDmg		EQU		0xBF 
AntiSwrd	EQU		0xC0 
AntiRecv	EQU		0xC1 
CopyDmg		EQU		0xC2 
Atkp10		EQU		0xC3 
Firep30		EQU		0xC4 
Aquap30		EQU		0xC5 
Elecp30		EQU		0xC6 
Woodp30		EQU		0xC7 
Navip20		EQU		0xC8 

LifeAura	EQU		0xC9 
Muramasa	EQU		0xCA 
Guardian	EQU		0xCB 
Anubis		EQU		0xCC 
Atkp30		EQU		0xCD 
Navip40		EQU		0xCE 
HeroSwrd	EQU		0xCF 
ZeusHamr	EQU		0xD0 
GodStone	EQU		0xD1 
OldWood		EQU		0xD2 
FullCust	EQU		0xD3 
Meteors		EQU		0xD4 
Poltrgst	EQU		0xD5 
Jealousy	EQU		0xD6 
StandOut	EQU		0xD7 
WatrLine	EQU		0xD8 
Ligtning	EQU		0xD9 
GaiaSwrd	EQU		0xDA 

Roll		EQU		0xDB 
RollV2		EQU		0xDC
Gutsman		EQU		0xDE 
GutsmanV2	EQU		0xDF 
Protoman	EQU		0xE3 
ProtomnV2	EQU		0xE4 
Beastman	EQU		0xED 
BeastmnV2	EQU		0xEE 
BubblMan	EQU		0xF2 
BubblMnV2	EQU		0xF3 
DesrtMan	EQU		0xF7 
DesrtMnV2	EQU		0xF8
FlamMan		EQU		0x0101 
FlamManV2	EQU		0x0102 
DrillMan	EQU		0x0106 
DrillMnV2	EQU		0x0107 
MetalMan	EQU		0x010B 
MetalMnV2	EQU		0x010C 
Punk		EQU		0x0110 
Salamndr    EQU	  	0x0111
Fountain	EQU		0x0112
Bolt		EQU		0x0113
GaiaBlad	EQU		0x0114 

KingMan		EQU		0x0115 
KingManV2	EQU		0x0116 
MistMan		EQU		0x011A 
MistManV2	EQU		0x011B 
BowlMan		EQU		0x011F 
BowlManV2	EQU		0x0120 
DarkMan		EQU		0x0124 
DarkManV2	EQU		0x0125 
JapanMan	EQU		0x0129 
JapanMnV2	EQU		0x012A 

DeltaRay	EQU		0x012E 
FoldrBak	EQU		0x012F 
DarkAura	EQU		0x0135
AlphArmO	EQU		0x0136
Bassp		EQU		0x0137

BassGS		EQU		0x0138

Balance		EQU		0xF1
NavRcycl 	EQU		0xE2
Serenade	EQU		0xFB 
AlphArmS	EQU		0xF6
Bass		EQU		0xE7

KingManV5	EQU		0x0119 
MistManV5	EQU		0x011E 
BowlManV5	EQU		0x0123 
FlamManV5	EQU		0x0105 
DarkManV5	EQU		0x0128 
DrillMnV5	EQU		0x010A 
JapanMnV5	EQU		0x012D 
MetalMnV5	EQU		0x010F 

//BeastMnV5	EQU		0xF1 
//GutsManV5	EQU		0xE2 
//BubblMnV5	EQU		0xF6 
//ProtoMnV5	EQU		0xE7 
//DesrtMnV5	EQU		0xFB 

FlashMnV5	EQU		0xEC
PlantMnV5	EQU		0x0100 

ZCanon1		EQU		0x0140 
ZCanon2		EQU		0x0141 
ZCanon3		EQU		0x0142 
ZPunch		EQU		0x0143 
ZStrght		EQU		0x0144 
ZImpact		EQU		0x0145 
ZVaribl		EQU		0x0146 
ZYoyo1		EQU		0x0147 
ZYoyo2		EQU		0x0148 
ZYoyo3		EQU		0x0149 
ZStep1		EQU		0x014A 
ZStep2		EQU		0x014B 
TimeBom		EQU		0x014C 
HBurst		EQU		0x014D 
BubSprd		EQU		0x014E 
HeatSprd	EQU		0x014F 
LifeSwrd	EQU		0x0150 
ElemSwrd	EQU		0x0151 
EvilCut		EQU		0x0152 
DblHero		EQU		0x0153 
HyperRat	EQU		0x0154 
EverCurse	EQU		0x0155 
GelRain		EQU		0x0156 
PoisPhar	EQU		0x0157 
BodyGrd		EQU		0x0158 
Barr500		EQU		0x0159 
BigHeart	EQU		0x015A 
GtsShoot	EQU		0x015B 
DeuxHero	EQU		0x015C 
MomQuake	EQU		0x015D 
PrixPowr	EQU		0x015E 
MstrStyl	EQU		0x015F


RollV3		EQU		0xDD 
MistManV3	EQU		0x011C 
MistManV4	EQU		0x011D 
BowlManV3	EQU		0x0121 
BowlManV4	EQU		0x0122 
DarkManV3	EQU		0x0126 
DarkManV4	EQU		0x0127 
JapanMnV3	EQU		0x012B 
JapanMnV4	EQU		0x012C 
GutsmanV3	EQU		0xE0 
GutsmanV4	EQU		0xE1 
ProtomnV3	EQU		0xE5 
ProtomnV4	EQU		0xE6 
BeastmnV3	EQU		0xEF 
BeastmnV4	EQU		0xF0 
BubblMnV3	EQU		0xF4 
BubblMnV4	EQU		0xF5 
DesrtMnV3	EQU		0xF9 
DesrtMnV4	EQU		0xFA 
FlamManV3	EQU		0x0103 
FlamManV4	EQU		0x0104 
DrillMnV3	EQU		0x0108 
DrillMnV4	EQU		0x0109 
MetalMnV3	EQU		0x010D 
MetalMnV4	EQU		0x010E 
KingManV3	EQU		0x0117 
KingManV4	EQU		0x0118 
Flashman	EQU		0xE8 
FlashmnV2	EQU		0xE9 
FlashmnV3	EQU		0xEA 
FlashmnV4	EQU		0xEB 
PlantMan	EQU		0xFC 
PlantMnV2	EQU		0xFD 
PlantMnV3	EQU		0xFE 
PlantMnV4	EQU		0xFF 



codeA		EQU		0
codeB		EQU		1
codeC		EQU		2
codeD		EQU		3
codeE		EQU		4
codeF		EQU		5
codeG		EQU		6
codeH		EQU		7
codeI		EQU		8
codeJ		EQU		9
codeK		EQU		10
codeL		EQU		11
codeM		EQU		12
codeN		EQU		13
codeO		EQU		14
codeP		EQU		15
codeQ		EQU		16
codeR		EQU		17
codeS		EQU		18
codeT		EQU		19
codeU		EQU		20
codeV		EQU		21
codeW		EQU		22
codeX		EQU		23
codeY		EQU		24
codeZ		EQU		25
codeSTAR	EQU		26
codeNONE	EQU		0xFF
