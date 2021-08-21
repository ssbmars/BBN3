@echo off

armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -equ IS_ROLLBACK 1 -sym bbn3.sym 
textpet run-script pvp_eng.tpl
textpet run-script pvp_esp.tpl

echo  making copy of rollback rom
xcopy /v /y /i "BBN3.gba" ".rollback\rom\BBN3 Online.gba"

echo      creating rollback patch
flips -c -b "rom/bn3blue.gba" "BBN3.gba" ".rollback/BBN3_Online.bps"
echo      creating Spanish rollback patch
flips -c -b "rom/bn3blue.gba" "BBN3_esp.gba" ".rollback/BBN3_Online_Spanish.bps"

armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -equ IS_ROLLBACK 0 -sym bbn3.sym 
textpet run-script pvp_eng.tpl
textpet run-script pvp_esp.tpl

armips patch.asm -equ IS_PVP 0 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -equ IS_ROLLBACK 0 -sym bbn3_pve.sym
textpet run-script pve_eng.tpl
textpet run-script pve_esp.tpl

echo      creating pvp patch
flips -c -b "rom/bn3blue.gba" "BBN3.gba" ".release/BBN3.bps"

echo      creating singleplayer patch
flips -c -b "rom/bn3blue.gba" "BBN3_pve.gba" ".release/singleplayer version/BBN3_pve.bps"

echo      creating randomizer patch
flips -c -b "rom/bn3blue.gba" "rom/output.gba" ".release/singleplayer version/BBN3_pve_randomize.bps"

echo      creating Spanish pvp patch
flips -c -b "rom/bn3blue.gba" "BBN3_esp.gba" ".release/Spanish/BBN3_Spanish.bps"

echo      creating Spanish singleplayer patch
flips -c -b "rom/bn3blue.gba" "BBN3_pve_esp.gba" ".release/Spanish/singleplayer version/BBN3_pve_Spanish.bps"


armips patch.asm -equ IS_PVP 0 -equ IS_ENG 1 -definelabel IS_BN3PLUS 1 -equ AM_DEBUGGING 0 -equ IS_ROLLBACK 0
textpet run-script pve_bn3plus_eng.tpl
textpet run-script pve_bn3plus_esp.tpl

echo      creating bbn3plus patch
flips -c -b "BBN3_pve.gba" "BBN3_pve_bn3plus.gba" ".release/singleplayer version/bn3plus patch/BBN3_pve_bn3plus.bps"
echo      creating Spanish bbn3plus patch
flips -c -b "BBN3_pve_esp.gba" "BBN3_pve_bn3plus_esp.gba" ".release/Spanish/singleplayer version/bn3plus patch/BBN3_pve_bn3plus_Spanish.bps"

timeout 6