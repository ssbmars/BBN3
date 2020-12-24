@echo off
start "" EmuHawk --lua="Lua\bbn3_netplay.lua" BBN3\BBN3.gba
start "" EmuHawk --config="config2.ini" --lua="Lua\bbn3_netplay.lua" BBN3\BBN3p2.gba