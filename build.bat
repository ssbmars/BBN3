@echo off
armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 0 -sym out/bbn3.sym 
textpet run-script pvp_eng.tpl
timeout 3