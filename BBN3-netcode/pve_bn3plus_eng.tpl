load-plugins "tp\plugins"
game mmbn3
load-file-index "tp\indexes\mmbn3b-us.tpi"
read-text-archives "rom\output.gba" 


read-text-archives "tp\scripts\chip_text_eng.tpl" -p
read-text-archives "tp\scripts\comm_menu_eng.tpl" -p
read-text-archives "tp\scripts\misc_menus_eng.tpl" -p
read-text-archives "tp\scripts\ncp_text_eng.tpl" -p

read-text-archives "tp\scripts\pve\PVE_misc_menus_eng.tpl" -p
read-text-archives "tp\scripts\pve\PVE_ncp_text_eng.tpl" -p


write-text-archives "bbn3_pve_bn3plus.gba"