# BBN3
https://bbn3.n1gp.dev  

BBN3 is a balance patch for Megaman Battle Network 3 Blue. There are changes at every level, from individual chips to universal engine mechanics. Its goal is to make BN3 pvp accessible, fun, and interactive. The extensive list of changes are documented in the [changelog on the BBN3 website.](https://bbn3.n1gp.dev/changelog)

There is a "pve" version designed for playing through singleplayer. This version does not aim to directly rebalance the singleplayer experience, but instead makes changes that improve the feel of the game. The effect on game balance is secondary to the main goal of making chips, navicust parts, and engine mechanics more fun to use and less annoying to deal with. There are several BBN3 changes that exist to make preparation for pvp faster and easier. Many of these changes are detrimental or nonsensical in the context of pve, so they are either not included or replaced with a version that makes sense for pve. You can always read the changelog to see exactly what is and isn't included in the pve version.  

This project is open source in the colloquial sense, but it was not published with the intention of democratizing the balance decisions in the official release. In other words, the balance decisions for this patch will always be the result of a single person's arbitrary opinions. There is no objectively correct way to fix the balance issues from vanilla BN3. For each problem, there are likely to be several valid and very different solutions. BBN3 explores just one narrow path in an infinitely branching tree of interesting ideas. If you disagree with the balance decisions of BBN3, or wish to see what it would be like if things were balanced a different way, you are highly encouraged to create the version that you want. Permission to do so has already been granted unconditionally, for everyone.  

Contributions to the real-world accessibility of BBN3 are very welcome and will be accepted into the official release. Translations for new languages are highly desirable.  


## Tango Rollback
The latest build of BBN3 is always made available from within Tango.  
Tango is the rollback netplay emulator that supports pvp for all MegaMan Battle Network titles. It comes bundled with a curated, auto-updating repository of pvp-focused patches.  
https://tango.n1gp.net/


## About Spanish Translations
The Spanish translation exists thanks to the hard work of the MNTWFL Translations group, who have translated multiple Battle Network games to Spanish. Additional info about this group can be found at:  
https://www.romhacking.net/community/4853

The source for these translation files is Closed Source and provided on an individual basis at the full discretion of the translation team. The BBN3 repository does not contain a copy of the source. It does however have a prepared file structure and a build script for compiling with Spanish translations. To build the Spanish patches, place all of the .tpl files from the source into the directory "\tp\scripts\spanish\" and use the "build_esp.bat" script.  
Attempting to build the translated patches without the necessary source files will result in an error. If you do not have the Spanish translation files, you may need to modify the existing build scripts to disable building the Spanish versions of the patch.

The directory "\tp\scripts\spanish2\" contains additional translations for the modified mechanics in BBN3. These translations are Open Source, and provided courtesy of the community members in the NetSaviors Discord server.


