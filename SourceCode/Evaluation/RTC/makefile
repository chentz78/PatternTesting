BT=buildAssignableTree

#FN = Folder name
#SIG= nickname
init:
	mkdir -p $(FN)
	mkdir -p $(FN)/ExecPatt $(FN)/ExecEC $(FN)/ExecPW $(FN)/ExecAC
	cp $(BT)/CC_*.mts $(FN)/
	cp -R $(BT)/Check*.rsc $(FN)/
	cp -R $(BT)/Static*.rsc $(FN)/
	cp -R $(BT)/Test*.rsc $(FN)/
	cd $(FN); ln -s ../../../TestDataGen/03.RascalTS/$(FN)/$(SIG)_Patt.rsc
	cd $(FN); ln -s ../../../TestDataGen/03.RascalTS/$(FN)/$(SIG)_EC.rsc
	cd $(FN); ln -s ../../../TestDataGen/03.RascalTS/$(FN)/$(SIG)_PW.rsc
	cd $(FN); ln -s ../../../TestDataGen/03.RascalTS/$(FN)/$(SIG)_AC.rsc
	
#Summarized thesis info
vi: mtDiff viBuild

mtDiff:
	cd Mutants; make tMutDiff
	
viBuild:

viMutTypesUsed:
	find Mutants/ -iname '*.rsc' | grep -o 'MU\_Check.*\_' | sort -u