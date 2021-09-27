# BBN3
The source code for Balanced Battle Network 3  
https://bbn3.n1gp.dev


## About Spanish Translations
The Spanish translation exists thanks to the hard work of the MNTWFL Translations group, who have translated multiple Battle Network games to Spanish. Additional info about this group can be found at:  
https://www.romhacking.net/community/4853

The source for these translation files is Closed Source and provided on an individual basis at the full discretion of the translation team. The BBN3 repository does not contain a copy of the source. It does however have a prepared file structure and a build script for compiling with Spanish translations. To build the Spanish patch, place all of the .tpl files from the source into the directory "\tp\scripts\spanish\" and use the "build_esp.bat" script. Attempting to build the translated patch without the necessary source files will result in an error.

The directory "\tp\scripts\spanish2\" contains additional translations for the modified mechanics in BBN3. These translations are Open Source, and provided courtesy of the community members in the NetSaviors Discord server.


# Rollback Build
This repository includes the assembly portion of BBN3's netcode implementation.  
The netcode client itself (emulator + lua scripts) is a separate repository and can be found at https://github.com/ssbmars/BBN3-netcode  
