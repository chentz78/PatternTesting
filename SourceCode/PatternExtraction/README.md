# Pattern Extraction Folder

## Pattern Extraction Process
1. Extract the pattern set from the metaprogram. RTC on our case. Cmd: `make extractPatt`
2. Resolve the patterns to discover the nonterminal which can derivate the pattern

## Annotation by Patterns Types

### Note 1
1. Pattern extraction
2. Patterns parsing: Discover the types and Grammar types

### CallOrTree
* CallOrTree type has external patterns. For example, the function `convertAndExpandThrowType` has `constructor` pattern.
* ~~Some CallORTree patterns are not detected by the extraction process. An example is `utc:\user(rn,pl)` on the function `convertAndExpandThrowType`~~. The pattern type is `variableBecomes`.

## RTC Stats
* 31/01/2017 - RTC
* Total functions: 342
* Total Patterns: 1197
* Func. With Patterns General: 166
* Func. Without Patterns: 176
* Func with pattern filtred: 50

* Patterns for filtred by functions:
 * Patterns: 373
 * Unique Patterns by function: 260
 * Patterns for filtred global:
 * Patterns: 373
 * Unique Patterns: 163

~~~
Base dir:/Users/chentz/L/srcCode/PatternExtraction
Version: 0.8.0.201603211706
rascal>mimport IO;
ok
rascal>import parseCheckTypes;
ok
rascal>mSumary();
Starting the meta-program analysis...
Module: |home:///L/rascal-build/rascal/src/org/rascalmpl/library/lang/rascal/types/CheckTypes.rsc|
Module Info: 203ea879c3fc4bbfd4e9bba293b19939 , $2016-09-21T13:11:26.000+00:00$
Compile time: 3347
Getting pattern stats...
Function Info: Total: 342, With Patterns: 166 and Wihtout: 176
Total Patterns: 1137, Filtered: 373, Unique: 163 and Unfiltered: 764
Stats time: 18819
ok
rascal>
~~~