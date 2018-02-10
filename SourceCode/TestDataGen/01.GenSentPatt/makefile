RF=rascal.out
OF=out

genLGENRascal:
	grep -oP '\<[A-Za-z]+\>' $(RF) | sort -u
	./repSingFile.sh $(RF) repRascalR.lua $(OF)/rascal.sent
	grep -oP '\<[A-Za-z]+\>' $(OF)/rascal.sent | sort -u

chkSent:
	./checkRascalMod.sh $(OF)/rascal.sent $(OF)