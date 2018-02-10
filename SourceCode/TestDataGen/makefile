PROCNUM=4
SENTNUM=70
DT=`date +'%Y%m%d'`

genConcrete:
	lua genSentPatts.lua pConcrete.txt 'Concrete' $(PROCNUM) $(SENTNUM)
	mkdir -p out
	mv -f sen_* out/
	./repFiles.sh out/sen_NTSymbols.txt
	
genPattern:
	cd ../PatternExtraction; make bUniquePatt &> UniquePatternsRTC.txt
	cd ../PatternExtraction; make pattKind
	cp ../PatternExtraction/UniquePatternsRTC.txt .
	cp ../PatternExtraction/pDescendant.txt .
	cp ../PatternExtraction/pConcrete.txt .
	cp ../PatternExtraction/pCallOrTree.txt .
	
clean:
	rm -rf out/* sen_* *.out /tmp/lua*
	
mvDate:
	mv -f out $(DT)
	
checkTags:
	grep --color -Pnr --include *.rep '\<[A-Za-z].*\>' *
	
pack:
	rm -f exec.7z
	7z a -mx=3 exec.7z *.out *.log