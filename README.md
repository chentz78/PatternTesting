# Project Structure


The folder `Data` contains the data used during the PhD thesis elaboration and it is used as reference to the text.

The folder `SourceCode` has all the code used to produce the thesis data and to replicate it when necessary. The detailed explanation about the replication process is presented in the Tutorial Section.

# Tutorial

## Important Information

* The base dir : `<BASE_DIR>`. It is the home dir used as reference to the `SourceCode`;
* Folder `bin` contains the bash scripts used to execute the evaluation process;


### Requirements

Software requirements:

* MacOS compatible machine, Version 11+;
* GNU Bash Version 4.4+;
* Java JDK, Version 8+;
* Rascal command line runtime Version 0.8.4;
* Rascal Source Code Version ;
* Lua Version 5.3+;
* Lua LPEG Version 0.12;
* LGen Version 1.3.2;

## 1-Pattern Extraction
Assuming you are at `<BASE_DIR>`;

1. `cd PatternExtraction`;
1. `make pattExConcrete`. Result folder is `out_<date>` and files inside for each function with the concrete pattern. The file name will be `f_<function>.lst`;

## 2-TestRequirementGeneration
Assuming you are at `<BASE_DIR>`;

1. `cd TestRequirementGeneration`;
1. `make`. In the same folder are produced a list of file with the extension `ts` that contains the requirement set for each criteria;

## 3-TestDataGen
Assuming you are at `<BASE_DIR>`;

1. `cd TestDataGen`;
1. `make`. The `03.RascalTS` folder has the Rascal executable test cases;

## 4-Execution the Evaluation Process
Assuming you are at `<BASE_DIR>`;

1. `cd Evaluation`;
1. `make`. Each case study example has a folder with the result of the execution. The execution of the RTC case takes around 48h to be executed in a Intel i7 machine with 8GB RAM; 