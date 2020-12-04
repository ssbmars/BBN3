@echo off
armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -sym bbn3.sym 
textpet run-script pvp_eng.tpl

armips patch.asm -equ IS_PVP 0 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -sym bbn3_pve.sym
textpet run-script pve_eng.tpl

echo      creating pvp patch

flips -c -b "rom/bn3blue.gba" "bbn3.gba" ".release/bbn3.bps"

echo      creating singleplayer patch

flips -c -b "rom/bn3blue.gba" "bbn3_pve.gba" ".release/singleplayer version/bbn3_pve.bps"

echo      creating randomizer patch

flips -c -b "rom/bn3blue.gba" "rom/output.gba" ".release/singleplayer version/bbn3_pve_randomize.bps"


armips patch.asm -equ IS_PVP 0 -equ IS_ENG 1 -definelabel IS_BN3PLUS 1 -equ AM_DEBUGGING 0
textpet run-script pve_bn3plus_eng.tpl

echo      creating bbn3plus patch
flips -c -b "bbn3_pve.gba" "bbn3_pve_bn3plus.gba" ".release/singleplayer version/bn3plus patch/bbn3_pve_bn3plus.bps"


timeout 6