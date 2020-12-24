.gba
.open "rom\bn3blue.gba","rom\dumbalpha.gba",0x8000000
.loadtable "tp\plugins\bn3-utf8.tbl"


.org 0x080D4482		//pause time while shooting shoulder guns
	mov		r0,19h


.org 0x080D43F2		//pause time after first claw swing
	mov		r0,0Fh

.org 0x080D4424		//pause time after second claw swing
	mov		r0,14h

.org 0x080D44B4		//pause time while shooting laser
	mov		r0,28h

.org 0x080EC17A		//amount of electric shocks
	mov		r0,20h

.close