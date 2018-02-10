SHELL=/bin/bash
DT=`date +%Y%m%d`
PNUM=163
TPATT=`calc.lua "$(PNUM)*2"`
#TPATT=10

build: genPattEC genPW genAC

calcPattEC:
	@echo "TR Size for PCC"
	@echo "$(PNUM)"
	@echo "TR Size for PECC"
	@echo "$(TPATT)"
  
genPattEC: calcPattEC
	lua Pattern.PattAndEC.lua $(PNUM)
	@echo "TR Sample for PCC:"
	head -n10 PatternPPC.ts
	@echo "TR Sample for EC:"
	head -n10 PatternECPC.ts
	
calcPW:
	@echo "TR Size for PWCC"
	./calcTRSize.sh $(PNUM) 2
	
genPW: calcPW genPWLua
	
genPWIPO: calcPW
	@echo "Using IPO..."
	./genACTSConfig.sh $(TPATT) CheckTypes
	./acts.sh CheckTypes.txt
	mv output.txt IPOTR_PS$(TPATT)_$(DT).txt 
	
genPWLua:
	lua Pattern.PWPC.lua $(PNUM)
	@echo "TR Sample for PW:"
	head -n10 PatternPWPC.ts

genPWComp: genPWIPO genPWLua
	@echo "Comparing the results from IPO and Lua"
	grep '^[^\#a-z]' IPOTR_PS$(TPATT)_$(DT).txt | diff -y - PatternPWPC.ts | more
	
calcAC:
	@echo "TR Size for ACCC"
	./calcTRSize.sh $(PNUM) $(PNUM)
	
genAC: calcAC
	lua Pattern.ACPC.lua $(PNUM)

clean:
	rm -f *.ts *.xml *.txt
	
checkF:
	cat PatternPPC.ts | wc -l
	cat PatternECPC.ts | wc -l
	cat PatternPWPC.ts | wc -l
	cat PatternAC.ts | wc -l
	
#Build for the thesis

fBuild:
	make PNUM=5 build
	mkdir -p buildAssignableTree
	mv *.ts buildAssignableTree
	make clean
	
fchkDecl:
	make PNUM=8 build
	mkdir -p checkDeclaration
	mv *.ts checkDeclaration
	make clean