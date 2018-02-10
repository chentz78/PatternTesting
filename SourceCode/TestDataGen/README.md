# Notes About the Test Data Generation

## General Info
* To simplify the process we going to use only the ***concrete*** pattern types.

## The Problem
Generate sentences for the pattern set. Give a pattern the problem is generate a sentence for this pattern.

### Example : Function `checkModule`

**Function declaration 7398**:

Sig:

```
lang::rascal::\syntax::Rascal::Module md:(Module)`<Header header> <Body body>`, Configuration c, bool forceCheck = false, bool verbose = false
```

Patts.:

**No  patterns**

**Function declaration 7453**:

Sig:

```
lang::rascal::\syntax::Rascal::Module md:(Module)`<Header header> <Body body>`, loc moduleLoc, Configuration c, bool forceCheck = false, bool verbose = false
```

Patts.:

```
concrete%{"checkModule"}%Declaration%{"UserType","Visibility","Tags","Type"}%{" ","alias",";","="}%{"external"}%p100
concrete%{"checkModule"}%Declaration%{"Name","Visibility","Kind","Tags","Type"}%{" ","tag",";","on"}%{"external"}%p101
concrete%{"checkModule"}%Declaration%{"UserType","Visibility","Tags"}%{" ","data",";"}%{"external"}%p102
concrete%{"checkModule"}%Declaration%{"UserType","CommonKeywordParameters","Visibility","Tags"}%{" ","data",";"}%{"external"}%p103
concrete%{"checkModule"}%Declaration%{"CommonKeywordParameters","Visibility","Tags","Variant","UserType"}%{" ","data",";","="}%{"external"}%p104
concrete%{"checkModule"}%Declaration%{"FunctionDeclaration"}%{}%{"external"}%p105
concrete%{"checkModule"}%Import%{"ImportedModule"}%{"extend",";"}%{"external"}%p91
concrete%{"checkModule"}%Import%{"ImportedModule"}%{"import",";"}%{"external"}%p92
concrete%{"checkModule"}%Import%{"ImportedModule"}%{"extend",";"}%{"external"}%p93
concrete%{"checkModule"}%Body%{"Toplevel"}%{}%{"external"}%p96
concrete%{"checkModule"}%Toplevel%{"Declaration"}%{}%{"external"}%p97
concrete%{"checkModule"}%Declaration%{"Visibility","Tags","Type","Variable"}%{" ",";"}%{"external"}%p98
concrete%{"checkModule"}%Declaration%{"Name","Visibility","Tags","Type"}%{"anno",";"," ","@"}%{"external"}%p99
```

Line 7600 on CheckTypes (External patt) p91 : 
``{ < getNameOfImportedModule(im) , (Import)`extend <ImportedModule _>;` := importItem > |``

Line 7602 on CheckTypes (External patt) p92, p93 : 
``(Import)`import <ImportedModule im>;` := importItem || (Import)`extend <ImportedModule im>;` := importItem };``

Line 7698 on CheckTypes (External patt) p96 : 
``if ((Body)`<Toplevel* tls>` := moduleTrees[itemName].body) {``

Line 7700 on CheckTypes (External patt) p97 : 
``for ((Toplevel)`<Declaration decl>` <- tls) {``



### Example : Function `buildAssignableTree`

**Function declaration 5199**:

Sig:

```
Assignable assn:
 (Assignable)`<Assignable ar> [ <Expression sub> ]`,
bool top, Configuration c
```

Patts.:

```
concrete%buildAssignableTree%5221%"(Expression)`<DecimalIntegerLiteral dil>`"
variableBecomes%buildAssignableTree%5235%"avar:variableNode(vname)"
```

Line 5221 on CheckTypes (External patt): 

``if ((Expression)`<DecimalIntegerLiteral dil>` := sub) {``

**Function declaration 5260**:

Sig: 

```
Assignable assn:
 (Assignable)`<Assignable ar> [ <OptionalExpression optFirst> .. <OptionalExpression optLast> ]`, 
bool top, Configuration c
```

Patts.:

```
concrete%buildAssignableTree%5266%"(OptionalExpression)`<Expression eFirst>`"
concrete%buildAssignableTree%5269%"(OptionalExpression)`<Expression eLast>`"
```

Line 5266 on CheckTypes (External patt): 

``if ((OptionalExpression)`<Expression eFirst>` := optFirst)``

Line 5269 on CheckTypes (External patt): 

``if ((OptionalExpression)`<Expression eLast>` := optLast)``

**Function declaration 5296**:

Sig:

```
Assignable assn:
 (Assignable)`<Assignable ar> [ <OptionalExpression optFirst>, <Expression second> .. <OptionalExpression optLast> ]`,
bool top, Configuration c
```

Patts.:

```
concrete%buildAssignableTree%5300%"(OptionalExpression)`<Expression eFirst>`"
concrete%buildAssignableTree%5306%"(OptionalExpression)`<Expression eLast>`"
```

Line 5300 on CheckTypes (External patt): 

``if ((OptionalExpression)`<Expression eFirst>` := optFirst)``

Line 5306 on CheckTypes (External patt): 

``if ((OptionalExpression)`<Expression eLast>` := optLast)``

### Example : Function `calculatePatternType`

**Function declaration 3172**:

Sig:

```
Pattern pat, Configuration c, Symbol subjects...
```

Patts.:

**Without concrete patterns!**

##### The Final Goal

### Example : `Declaration`
For the Rascal grammar and using the `Declaration` as example. The definition is

```
syntax Declaration
	= variable    : Tags tags Visibility visibility Type type {Variable ","}+ variables ";" 
	| annotation  : Tags tags Visibility visibility "anno" Type annoType Type onType "@" Name name ";" 
	| \alias       : Tags tags Visibility visibility "alias" UserType user "=" Type base ";" 
	| \tag         : Tags tags Visibility visibility "tag" Kind kind Name name "on" {Type ","}+ types ";" 
	| dataAbstract: Tags tags Visibility visibility "data" UserType user CommonKeywordParameters commonKeywordParameters ";" 
	| @Foldable \data : Tags tags Visibility visibility "data" UserType user CommonKeywordParameters commonKeywordParameters"=" {Variant "|"}+ variants ";"
	| function       : FunctionDeclaration functionDeclaration 
	;
```

Some patterns that use the `Declaration` rule:

```
p98%(Declaration)`<Tags _> <Visibility _> <Type _> <{Variable ","}+ _> ;`
p99%(Declaration)`<Tags _> <Visibility _> anno <Type _> <Type _>@<Name _>;`
p100%(Declaration)`<Tags _> <Visibility _> alias <UserType _> = <Type _> ;`
p101%(Declaration)`<Tags _> <Visibility _> tag <Kind _> <Name _> on <{Type ","}+ _> ;`
p102%(Declaration)`<Tags _> <Visibility _> data <UserType _> ;`
p103%(Declaration)`<Tags _> <Visibility _> data <UserType _> <CommonKeywordParameters _>;`
p104%(Declaration)`<Tags _> <Visibility _> data <UserType _> <CommonKeywordParameters commonKeywordParameters> = <{Variant "|"}+ _> ;`
p105%(Declaration)`<FunctionDeclaration _>`
```

On these examples we will only work with *concrete* patterns. For a simple pattern, the `p102` for example:

	(Declaration)`<Tags _> <Visibility _> data <UserType _> ;`
	
The sentences below are examples of matches:

```
private data abc1;
data abc1;
```
	
A more complex case is the pattern `p101`:

	(Declaration)`<Tags _> <Visibility _> tag <Kind _> <Name _> on <{Type ","}+ _> ;`
	
The sentences below are examples of matches:

```
private tag function abc1 on int;
tag function abc1 on string;
```

## The Process

### The Abstract Process Definition
Abstract process using the test data generation and using the test data set to test the metaprogram.

1. Generate sentences for each nonterminal symbol over the pattern variables. Test Data Generation. **Done**
1. Construct each pattern sentence match using the sentence over symbols. **In Progress**
1. Generate a sub-sentence from the start symbol until the pattern top NT symbol.
1. Construct the final sentence that matches with the pattern.

### The Process Example

#### 1. Generate the sentences for each nonterminal (NT)

For the pattern `p102`, we have the following symbols:

* `Tags` : `@ <NAME>`
* `Visibility` :` `,`private`, `public`
* `UserType` : `<NAME>`, `<NAME>  [ ( value )  ]`

#### 2. Replace the Lexical Symbols by Instances

For each sample generated on the previous step we can have unresolved lexical symbols. For example:

* `Tags` : `@ <NAME>` replaced by `@ N54`
* `Visibility` :` `,`private`, `public` no replaces
* `UserType` : `<NAME>`, `<NAME>  [ ( value )  ]` replaced by `N32`, `N45  [ ( value )  ]`

The substitution is done using the following programs:

* `repFiles.sh`: Execute the the replace routine for each file;
* `replace.lua`: Do the replace for a file;
* `repRascalR.lua`: Replace rules define for each symbol declared;
* `make checkTags`: Check if there is any unreplaced symbol on the results files.

#### 3. Construct the Pattern Match

For each pattern the match is constructed by the use of the others symbols sentences. For example, on the case of the pattern `p102`:

	(Declaration)`<Tags _> <Visibility _> data <UserType _> ;`
	
First, we need to simplify the pattern to use the replacement process. So, for the pattern `p102` it should be
	
	(Declaration)`<Tags _> <Visibility _> data <UserType _> ;`
	(Declaration)`<Tags> <Visibility> data <UserType> ;`
	
and for the pattern `p101` it should be

	(Declaration)`<Tags _> <Visibility _> tag <Kind _> <Name _> on <{Type ","}+ _> ;`
	(Declaration)`<Tags> <Visibility> tag <Kind> <Name> on <Type> ;`
	
After that, we replace the `Tags` symbol.

	(Declaration)`@N54 <Visibility _> data <UserType _> ;`
	(Declaration)`@N54 private data <UserType _> ;`
	(Declaration)`@N54 private data N32 ;`
	
At the end the result sentence should match with the original pattern. On the pattern `p102` case in Rascal language.

~~~java
if ( (Declaration)`<Tags _> <Visibility _> data <UserType _> ;` := "@N54 private data N32 ;") {
  println("p102:OK");
}
~~~

This step is done using the following programs:

* `simplifyPatterns.lua` : A lua implementation to simplify the variables declarations to just symbols;