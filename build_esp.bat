@echo off
armips patch.asm -equ IS_PVP 1 -equ IS_ENG 1 -equ AM_DEBUGGING 1 -sym out/bbn3.sym 
textpet run-script pvp_esp.tpl
timeout 3