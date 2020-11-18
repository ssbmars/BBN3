@archive 78EA78
@size 27


script 19 mmbn3 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	Are you in the right
	headspace to receive
	information that
	"""
	keyWait
	clearMsg
	"""
	could possibly hurt
	you?
	"""
	keyWait
	clearMsg

	mugshotShow
		mugshot = Sunayama
	"""
	. . .
	"""
	keyWait
	clearMsg
	"""
	Yes.
	"""
	keyWait
	end
}

