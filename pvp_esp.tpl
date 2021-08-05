load-plugins "tp\plugins"
game mmbn3
load-file-index "tp\indexes\mmbn3b-us.tpi"
read-text-archives "rom\output.gba" 

trim --preserve-commands --split-text --max 2
trim --preserve-commands --max 1
read-text-archives "tp\scripts\spanish\" --patch --format tpl

read-text-archives "tp\scripts\spanish2\chip_text_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\comm_menu_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\misc_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\ncp_text_esp.tpl" -p

read-text-archives "tp\scripts\spanish2\pvp\PVP_chip_text_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\pvp\PVP_comm_menu_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\pvp\PVP_emails_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\pvp\PVP_misc_esp.tpl" -p
read-text-archives "tp\scripts\spanish2\pvp\PVP_ncp_text_esp.tpl" -p
read-text-archives "tp\scripts\pvp\PVP_global.tpl" -p


write-text-archives "BBN3_esp.gba"