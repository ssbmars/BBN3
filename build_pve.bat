@echo off
armips patch.asm -sym bbn3.sym
textpet run-script writepve.tpl
timeout 3