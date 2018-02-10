#Initial Configuration
#BN=Base Name
init:
	mkdir -p $(BD)/CC_Patt $(BD)/CC_EC $(BD)/CC_PW $(BD)/CC_ALL
	mkdir -p $(BD)/TDSets
	touch $(BD)/CC_ALL/CC.mts
	#Load Default Data
	echo "TestSet='testSet.rsc'" >> $(BD)/CC_ALL/CC.mts
	echo "TSetPrefix='Exec'" >> $(BD)/CC_ALL/CC.mts
	echo "ModUnderTest='main.rsc'" >> $(BD)/CC_ALL/CC.mts
	echo "ModFunc='main'" >> $(BD)/CC_ALL/CC.mts
	echo "TestCaseExt='ext'" >> $(BD)/CC_ALL/CC.mts
	echo "MuSetSize=15" >> $(BD)/CC_ALL/CC.mts
	#Copy default data
	cp $(BD)/CC_ALL/CC.mts $(BD)/CC_Patt/CC.mts
	cp $(BD)/CC_ALL/CC.mts $(BD)/CC_EC/CC.mts
	cp $(BD)/CC_ALL/CC.mts $(BD)/CC_PW/CC.mts

clean:
	cd Pico/; make clean
