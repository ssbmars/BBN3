@echo off
armips patch.asm -equ IS_PVP 0 -equ IS_ENG 1 -sym bbn3_pve.sym
textpet run-script pve_eng.tpl
timeout 3