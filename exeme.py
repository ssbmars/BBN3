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

srcrom = "rom/bn3blue.gba"
newrom = "rom/exe3black.gba"
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
			# get all hardcoded addresses from the asm files
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


# matching function that weenie gave me, try this instead of regex
def is_bl(pattern):
	a, b, c, d = pattern
	return (
		b >= 0xf0 and int(b) <= 0xf7 and
		d >= 0xf8 and int(d) <= 0xff
	)
def match_bl(pattern, chunk):
	fuz = 0x30
	a, b, c, d = pattern
	b1 = 0xf0; b2 = 0xf7; d1 = 0xf8; d2 = 0xff;
	if (
		(a-fuz)	<= chunk[0] <= (a+fuz)	and
		b1		<= chunk[1] <= b2		and
		(c-fuz)	<= chunk[2] <= (c+fuz)  and
		d1		<= chunk[3] <= d2 
	):
		return True
	return False

def match_normal(pattern, chunk):
	if (
		chunk[0] == pattern[0] and
		chunk[1] == pattern[1] and
		chunk[2] == pattern[2] and
		chunk[3] == pattern[3]
	):
		return True
	return False


# trying this
def main_match(pattern, chunk):
	#if is_bl(pattern):
	if False:
		# fuzzy match for branch&link
		answer = match_bl(pattern, chunk)
	else:
		# normal match
		answer = match_normal(pattern, chunk)
	return answer

# main matching func
def does_match(pattern, chunk):
	if (
		chunk[0] == pattern[0] and	# first byte matches
		chunk[1] == pattern[1] and	# second byte matches
		chunk[2] == pattern[2] and	# third byte matches
		chunk[3] >= pattern[3]		# fourth byte is greater than or equal
	):
		return True
	return False


# halfword matching funcs

def hw_match(pattern, chunk):
	if (
		chunk[0] == pattern[0] and
		chunk[1] == pattern[1]
	):
		return True
	return False


# end of halfword funcs

lookback = 2*2
readamount = 2*8

if exp0 or exp2:
	values = []
	offsets = []
	try:
		# create 'offsets' list, it's all the addresses we want to find the equivalent of
		with open("snek/clean_addr_list.txt",'r', encoding = 'utf-8') as file:
			lines = file.readlines()
			for line in lines:
				offsets.append(int(line,16))

	except IOError:
		print("ERROR: could not open snek/clean_addr_list.txt")
		quit()
	try:
		# read data from original ROM at the addresses we got earlier
		# construct 'values' list
		with open(srcrom, 'rb') as file:
			for offset in offsets:
				file.seek(offset-lookback)
				value = file.read(readamount)
				values.append(value)

	except IOError:
		print("ERROR: could not open rom/bn3blue.gba")
		quit()



# 0x309c4
# 



	try:
		#with open(newrom, 'rb') as file:
		with open(srcrom, 'rb') as file:
			exe3 = file.read()
		# file is closed now
		newstring = ""
		ii = 0
		for value in values:
			completematchlimit = 15
			completematches = 0
			bookmark = 0
			matches = 0		# number of contiguous bytes that match the desired pattern
			shlice = 0
			hwamnt = len(value)/2 # amount of halfwords that need to be correct in a row
			#print("hwamnt = {}".format(hwamnt))
			print(hex(offsets[ii]))
			newstring += "{}".format(hex(offsets[ii] + 0x08000000))
			for addr in range(0, len(exe3) - 4 + 1, 2):
				chunk = exe3[addr:addr+2]
				val = value[shlice:shlice+2]

				if hw_match(val,chunk):
					if matches == 0:
						bookmark = addr + lookback
					matches += 1
					shlice += 2
					if matches == hwamnt:
						print("   {}".format(hex(bookmark)))
						newstring += "	{}".format(hex(bookmark + 0x08000000))
						matches = 0
						shlice = 0
						completematches += 1
						if completematches == completematchlimit:
							print("   limit reached")
							break
				elif hw_match(value[0:2],chunk):
					bookmark = addr + lookback
					matches = 1
					shlice = 2
				else:
					matches = 0
					shlice = 0

			ii += 1

		# write the file with all address candidates
		if not os.path.exists("snek"): # make sure output folder exists
			os.mkdir("snek",0o666)
		newfile = open("snek/matches_list.txt",'w', encoding = 'utf-8')
		newfile.write(newstring)
		newfile.close()


	except IOError:
		print("ERROR: could not open rom/exe3black.gba")
		quit()

#	try:
#		with open(newrom, 'rb') as file:
#			exe3 = file.read()
#		# file is closed now
#		ii = 0
#		# the order of this function is totally wrong
#		for value in values:
#			#print(hex(offsets[ii]))
#			for place in range(0, len(exe3) - 4 + 1, 2):
#			    chunk = exe3[place:place+4]
#			    for spot in range(0, len(value) - 4 + 1, 2):
#			    	valchunk = value[spot:spot+4]
#			    	if main_match(valchunk, chunk):
#			        	print(i)
#			#print(value)
#			ii += 1
#	except IOError:
#		print("ERROR: could not open rom/exe3black.gba")
#		quit()


print("finished")