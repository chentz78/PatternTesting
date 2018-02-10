
#FN
def:
	./mkTS.sh TRS_$(FN)/PatternPPC.ts $(FN)_Patt SS_$(FN).lua $(FN)
	./mkTS.sh TRS_$(FN)/PatternECPC.ts $(FN)_EC SS_$(FN).lua $(FN)
	./mkTS.sh TRS_$(FN)/PatternPWPC.ts $(FN)_PW SS_$(FN).lua $(FN)
	./mkTS.sh TRS_$(FN)/PatternAC.ts $(FN)_AC SS_$(FN).lua $(FN)
	mkdir -p RTS_$(FN)
	mv *.rsc RTS_$(FN)/
	rm -rf *.ts
	
build:
	make FN=build def
	
chkDecl:
	make FN=chkDecl def
	
extract:
	make FN=extract def
	
chkFunc:
	make FN=chkFunc def

chkStmt:
	make FN=chkStmt def
	
chkMod:
	make FN=chkMod def
	
clean:
	rm -rf TR_* TS_* *.rsc
	
initTRS:
	cp -r ../../TestRequirementGeneration/buildAssignableTree TRS_build
	cp -r ../../TestRequirementGeneration/checkDeclaration TRS_chkDecl