load-plugins "tp\plugins"
game mmbn3
load-file-index "tp\indexes\mmbn3b-us.tpi"
read-text-archives "rom\output.gba" 

read-text-archives "tp\scripts\pve.tpl" -p

write-text-archives "bbn3_pve.gba"