@echo off
armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 1 -equ IS_ROLLBACK 1 -sym bbn3.sym 
textpet run-script pvp_eng.tpl

echo  making copy of rollback rom
xcopy /v /y "BBN3.gba" ".rollback\rom\BBN3 Online.gba"

echo      creating rollback patch
flips -c -b "rom/bn3blue.gba" "BBN3.gba" ".rollback/BBN3_Online.bps"

timeout 3