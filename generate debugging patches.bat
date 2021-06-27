@echo off
armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 1 -equ IS_ROLLBACK 0 -sym bbn3.sym 
textpet run-script pvp_eng.tpl

echo      creating debugging pvp patch 

flips -c -b "rom/bn3blue.gba" "bbn3.gba" ".ignore/BBN3.bps"

echo      creating debugging pvp patch without textpet

flips -c -b "rom/bn3blue.gba" "rom/output.gba" ".ignore/BBN3_no-tp.bps"

timeout 4