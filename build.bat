@echo off
armips patch.asm -sym bbn3.sym
textpet run-script writebn3.tpl
timeout 4