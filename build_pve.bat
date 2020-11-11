@echo off
armips patch.asm -sym bbn3_pve.sym
textpet run-script writepve.tpl
timeout 3