clean:
	find . -name 'TC_?*' -type f -delete
	find . -name '?*_TC_?*' -type f -delete
	find . -name 'TS_?*' -type f -delete
	find . -name '?*_TS_?*' -type f -delete
	find . -name 'TR_?*' -type f -delete
	find . -name '?*_TR_?*' -type f -delete
	find . -name '?*_MU_?*' -type f -delete
	find . -name 'BKP_*' -type f -delete
	
cleanDirs:
#	find . -name 'Prod20*'  -delete
	rm -rf ProdCC20*
	rm -rf PattCC20*
	rm -rf ECPCCC20*
	rm -rf PWPCCC20*
	
cleanAll: clean cleanDirs

#CC Case
FSRC=mainCC.rsc
FMU=ModuleMutator.rsc
FTST=testPicoCalcCC.rsc
mLinksCC:
#Source Code
	ln -fs ../$(FSRC) Production/$(FSRC) 
	ln -fs ../$(FSRC) Pattern/$(FSRC)
	ln -fs ../$(FSRC) ECPC/$(FSRC)
	ln -fs ../$(FSRC) PWPC/$(FSRC)
#Mutation
	ln -fs ../$(FMU) Production/$(FMU) 
	ln -fs ../$(FMU) Pattern/$(FMU)
	ln -fs ../$(FMU) ECPC/$(FMU)
	ln -fs ../$(FMU) PWPC/$(FMU)
#Test Set
	ln -fs ../$(FTST) Production/$(FTST) 
	ln -fs ../$(FTST) Pattern/$(FTST)
	ln -fs ../$(FTST) ECPC/$(FTST)
	ln -fs ../$(FTST) PWPC/$(FTST)
	
#SLOC Case
FSRC=genericSLOC.rsc
FMU=ModuleMutator.rsc
FTST=testPicoSLOC.rsc
mLinksSLOC:
#Source Code
	ln -fs ../$(FSRC) Production/$(FSRC) 
	ln -fs ../$(FSRC) Pattern/$(FSRC)
	ln -fs ../$(FSRC) ECPC/$(FSRC)
	ln -fs ../$(FSRC) PWPC/$(FSRC)
#Mutation
	ln -fs ../$(FMU) Production/$(FMU) 
	ln -fs ../$(FMU) Pattern/$(FMU)
	ln -fs ../$(FMU) ECPC/$(FMU)
	ln -fs ../$(FMU) PWPC/$(FMU)
#Test Set
	ln -fs ../$(FTST) Production/$(FTST) 
	ln -fs ../$(FTST) Pattern/$(FTST)
	ln -fs ../$(FTST) ECPC/$(FTST)
	ln -fs ../$(FTST) PWPC/$(FTST)