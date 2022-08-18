import os
import re
import sys
import shutil
#import struct

# what it do:
# 1) parse through the asm files in bbn3's source and construct a list of all hardcoded .org addresses for bn3blue
# 2) read and store the values in a vanilla bn3blue rom at the addresses found in the constructed list
# 3) modify the read values to remove hardcoded references that would be unlikely to match between versions of bn3
	# ie. remove the exact relative distance values from Branch&Link opcodes, leaving just the requirement that it 
	# be a bl opcode where any address in range would be a valid match
# 4) with the new modified values, search through exe3black for matches. For each address in the first list, create
#	 a list of all potential matches found within the rom


sys.stdout.write("Which step? [all, 1, 2] : ")
step = input()

exp0 = step == "all"	# parse the asm files in bbn3 source
exp1 = step == "1"
exp2 = step == "2"

# ,"asm/.asm"
asmfiles = ["patch.asm","asm/attack_edits.asm","asm/expanded_space.asm","asm/NCP_edits.asm","asm/pvp_qol.asm"]

# find any hardcoded rom address being used for .org, bl, b, ldr
	# positive lookbehind for .org, bl, b, ldr (ldr uses r[0-9],=)
	# match a hex value that either starts with 0x or ends with h
	# matches are allowed to drop the 0x0 at the start and do 0x8, but there must be 6 characters immediately after
hardcoded = re.compile("((?<=\.org\s)|(?<=bl\s)|(?<=bl\s{2})|(?<=b\s{2})|(?<=r[0-9],=))(0[xX]0*8[0-9a-fA-F]{6}|0*8[0-9a-fA-F]{6}h)")

if exp0 or exp1:
	biglist = ""
	cleanlist = ""
	for filename in asmfiles:
		new = ""
		clean = ""
		try:
			with open(filename,'r', encoding = 'utf-8') as file:
				txt = file.read()
			# file is closed now
			addresses = hardcoded.findall(txt)
			ii = 0
			for addr in addresses:
				new += "{}\n".format(addr[1])

				this = re.sub("^(0x0*|0*)8","", addr[1])
				this = re.sub("h","", this)
				this = "0x{}".format(this)

				clean += "{}\n".format(this)

				ii += 1
			print("good: found {} matches in {}".format(ii,filename))
		except IOError:
			print("ERROR: could not open {}".format(filename))
			continue

		biglist += new
		cleanlist += clean
	# exited the for loop

	# store the created address list in a file	
	if not os.path.exists("snek"): # make sure output folder exists
		os.mkdir("snek",0o666)
	newfile = open("snek/addr_list.txt",'w', encoding = 'utf-8')
	newfile.write(biglist)
	newfile.close()
	print("created file snek/addr_list.txt")
	cleanfile = open("snek/clean_addr_list.txt",'w', encoding = 'utf-8')
	cleanfile.write(cleanlist)
	cleanfile.close()
	print("created file snek/clean_addr_list.txt")

# how to process a branch&link?
# AA BB CC DD
#	BB must be [F0-F7]
#	DD must be [F8-FF]
#	AA & CC can be any value [00-FF]
# DD can exist by itself, but it's an absolute branch from 0x0, looks like bios access
findbl = re.compile(b"(.)[\xF0-\xF7](.)[\xF8-\xFF]")
findhalfbl = re.compile(b"(.)[\xF8-\xFF]")
#findbl = re.compile(b"(.)[\xF0\xF1\xF2\xF3\xF4\xF5\xF6\xF7](.)[\xF8\xF9\xFA\xFB\xFC\xFD\xFE\xFF]")
#findhalfbl = re.compile(b"(.)[\xF8\xF9\xFA\xFB\xFC\xFD\xFE\xFF]")


# how to process a branch?
# 

if exp0 or exp2:
	values = []

	offsets = []
	try:
		with open("snek/clean_addr_list.txt",'r', encoding = 'utf-8') as file:
			lines = file.readlines()
			for line in lines:
				offsets.append(int(line,16))

	except IOError:
		print("ERROR: could not open snek/clean_addr_list.txt")
		quit()
	try:
		with open("rom/bn3blue.gba", 'rb') as file:
			lookback = 2*2
			readamount = 2*8
			for offset in offsets:
				file.seek(offset-lookback)
				value = file.read(readamount)
				# value = struct.unpack_from(,bn3, offset-lookback)

				# check if it read only half of a branch opcode,
				# if true, reread file but farther back this time.
					# Either way, read again as hex
				match = findhalfbl.search(value)
				if match and match.start() == 0:
					file.seek(offset - lookback - 2)
					value = file.read(readamount + 4)#.hex()
					#print(hex(int(value,16)))
				#else:
					#value = file.read(readamount).hex()
				values.append(value)

		# file is now closed
		for value in values:
			yougoi = False
			blip = bytearray(value)
			for match in findbl.finditer(value):
				yougoi = True
				place = match.start()
				print("{} {}".format(value[place:place+2].hex(),value[place+2:place+4].hex()))
				#value = value
				print(blip[place])
				#print(blip[place+2])
				#blip[place] = b"(.)"

			if yougoi:
				break




	except IOError:
		print("ERROR: could not open rom/bn3blue.gba")
		quit()




print("finished")