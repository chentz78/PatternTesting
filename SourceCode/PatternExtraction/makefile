SHELL=/bin/bash
DT=`date +%Y%m%d`
OUT=out_$(DT)

build: modStats uniquePatt pattKind allPatt

initD:
	mkdir -p $(OUT)/
	
#Basic
bStats:
	runRascal.sh parseCheckTypes.rsc 'mSumary();'

bKind:
	runRascal.sh parseCheckTypes.rsc 'mExtractPattStructure();'
	
bAllPatt:
	runRascal.sh parseCheckTypes.rsc 'allPatterns();'
	
bUniquePatt:
	runRascal.sh parseCheckTypes.rsc 'uniquePattList();'
	
extractPatt: initD
	runRascal.sh parseCheckTypes.rsc &> $(OUT)/CheckTypes.log
	
listFuncPatt: initD
	runRascal.sh parseCheckTypes.rsc 'mFuncList(false);' | grep -P '[a-zA-Z]+,[0-9]+' | sort -t ',' -k 2 -n -r &> $(OUT)/funcList.log
	cat $(OUT)/funcList.log
	cat $(OUT)/funcList.log | datamash -t , count 1 sum 2 sum 3

#Get basic stats about functions and patterns for the RTC
modStats: initD
	@echo "Git Hash:"; cd ~/L/rascal-build/usedOnThesis.rascal/; gitLog.sh -1
	runRascal.sh parseCheckTypes.rsc 'mSumary();' | tee $(OUT)/RTCStats.txt

allPatt: initD
	runRascal.sh parseCheckTypes.rsc 'allPatterns();' &> $(OUT)/allPatterns.txt
	
#Same as bUniquePatt but generate a file
uniquePatt: initD
	runRascal.sh parseCheckTypes.rsc 'uniquePattList();' &> $(OUT)/UniquePatternsRTC.txt
	
pattKind: initD
	runRascal.sh parseCheckTypes.rsc 'mExtractPattStructure();' &> $(OUT)/pattKind.txt
	grep '^descendant\%' $(OUT)/pattKind.txt &> $(OUT)/pDescendant.txt
	grep '^concrete\%' $(OUT)/pattKind.txt &> $(OUT)/pConcrete.txt
	grep '^callOrTree\%' $(OUT)/pattKind.txt &> $(OUT)/pCallOrTree.txt
	wc -l $(OUT)/p[CD]*.txt
	grep '^Count' $(OUT)/pattKind.txt
	
# Get list of concrete to the case study
pattExConcrete: allPatt
	grep -P '^concrete' $(OUT)/allPatterns.txt | gsed 's@concrete\%@@g' > tmp_conc.txt
	./listRTCFuncs.sh tmp_conc.txt file $(OUT)
	rm -rf tmp_conc.txt

cleanAll:
	rm -rf out_*