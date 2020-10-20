load-plugins "tp\plugins"
game mmbn3
load-file-index "tp\indexes\mmbn3b-us.tpi"
read-text-archives "rom\output.gba" 

run-script "tp\scripts\bbn3_scripts.tpl" 

write-text-archives "bbn3.gba"