" Constants
syntax keyword javaConstant this super null
highlight def link javaConstant Constant

" Boolean Values
syntax keyword javaBool true false
highlight def link javaBool Boolean

" Numbers
syntax match javaDecInt   '\v\c<\d%(\d|_*\d)*L=>'
highlight def link javaDecInt javaNumber
syntax match javaOctInt   '\v\c<0%(\o|_*\o)+L=>'
highlight def link javaOctInt javaNumber
syntax match javaHexInt   '\v\c<0X\x%(\x|_*\x)*L=>'
highlight def link javaHexInt javaNumber
syntax match javaBinInt   '\v\c<0B[01]%([01]|_*[01])*L=>'
highlight def link javaBinInt javaNumber
syntax match javaDecFloat '\v\c<\d%(\d|_*\d)*%(E[+-]=\d%(\d|_*\d)*[FD]=|[FD])>'
syntax match javaDecFloat '\v\c<\d%(\d|_*\d)*\.%(\d%(\d|_*\d)*)=%(E[+-]=\d%(\d|_*\d)*)=[FD]='
syntax match javaDecFloat '\v\c\.\d%(\d|_*\d)*%(E[+-]=\d%(\d|_*\d)*)=[FD]='
highlight def link javaDecFloat javaNumber
syntax match javaHexFloat '\v\c<0X\x%(\x|_*\x)*%(P[+-]=\d%(\d|_*\d)*[FD]=|[FD])>'
syntax match javaHexFloat '\v\c<0X\x%(\x|_*\x)*\.%(\x%(\x|_*\x)*)=%(P[+-]=\d%(\d|_*\d)*)=[FD]='
syntax match javaHexFloat '\v\c<0X\.\x%(\x|_*\x)*%(P[+-]=\d%(\d|_*\d)*)=[FD]='
highlight def link javaHexFloat javaNumber
highlight def link javaNumber Number

" Strings
syntax match  javaString '\v"%([^\\"]|\\.)*"'
syntax region javaString start='"""\s*$' end='"""'
highlight def link javaString String

" Characters
syntax match javaChar "'[^\\']'"
syntax match javaChar "'\\[btnfr\"'\\]'"
syntax match javaChar "\v'\\%(\o{1,3}|u\x{4})'"
highlight def link javaChar Character

" Statements
syntax keyword javaStatement return yield
syntax keyword javaStatement break continue
highlight def link javaStatement Statement

" Conditional Structures
syntax keyword javaConditional if else switch
highlight def link javaConditional Conditional

" Loop Structures
syntax keyword javaLoop for while do
highlight def link javaLoop Repeat

" Labels
syntax keyword javaLabel case default
highlight def link javaLabel Label

" Operators
syntax keyword javaOperator new instanceof skipwhite skipempty nextgroup=javaType,javaErrorClass,javaCommonClass,javaCollectionClass
syntax match   javaOperator '[+\-\~!\*/%<>=&\^|?:]'
highlight def link javaOperator Operator

" Exception Structures
syntax keyword javaException throw
syntax keyword javaException throws skipwhite skipempty nextgroup=javaType
syntax keyword javaException try catch finally
highlight def link javaException Exception

" Identifiers and Constants
syntax match javaFinal '\v<%(\u|[_\$])%(\u|\d|[_\$])*>'
highlight def link javaFinal Special
syntax match javaIdentifier '\v<%(\h|\$)%(\w|\$)*>'
highlight def link javaIdentifier Identifier

" Functions
syntax match javaFunction '\v<%(\h|\$)%(\w|\$)*>\ze\_s*\(\_.{-}\)'
highlight def link javaFunction Function

" Packages and Imports
syntax match javaPackagePath '\v<%(%(\w|\$)+\_s*\.\_s*)*%(\w|\$)+>' contained contains=javaIdentifier
syntax match  javaPackage '\v<package=>' skipwhite skipempty nextgroup=javaPackagePath
highlight def link javaPackage PreProc
syntax match javaImport '\v<import%(\_s+static)=>' skipwhite skipempty nextgroup=javaPackagePath
highlight def link javaImport Include

" Types
syntax keyword javaPrimitive void
syntax keyword javaPrimitive boolean
syntax keyword javaPrimitive char
syntax keyword javaPrimitive byte short int long
syntax keyword javaPrimitive float double
syntax keyword javaPrimitive var
highlight def link javaPrimitive Number
syntax match javaType '\v<\$*\u%(\w|\$)*>'
highlight def link javaType Number

" Description Keywords
syntax keyword javaDescription public protected private
syntax keyword javaDescription static transient final abstract
syntax keyword javaDescription volatile strictfp native
syntax keyword javaDescription synchronized
highlight def link javaDescription StorageClass

" Structures
syntax keyword javaStructure class interface enum record skipwhite skipempty nextgroup=javaType
syntax keyword javaStructure extends implements          skipwhite skipempty nextgroup=javaType
highlight def link javaStructure Structure

" Annotations
syntax match javaAnnotation '@\h\w*'
highlight def link javaAnnotation Comment

" Debug Keywords
syntax keyword javaDebug assert
highlight def link javaDebug Debug

" Reserved Unused Keywords
syntax keyword javaReserved goto const _
highlight def link javaReserved RedrawDebugRecompose



" Comments
syntax match  javaComment '//.*'                contains=javaTodo
syntax region javaComment start='/\*' end='\*/' contains=javaTodo
highlight def link javaComment Comment
syntax region javaDoc start='/\*\*' end='\*/'   contains=javaTodo,javaDocBlockTag,@javaDocHtmlTag
highlight def link javaDoc Comment

" Todos
syntax keyword javaTodo TODO FIXME contained
syntax keyword javaTodo NOTE       contained
syntax keyword javaTodo XXX NB     contained
highlight def link javaTodo TODO

" Keyword Block Tags
syntax region javaDocBlockTag start='{@\(code\|doc[Rr]oot\|inherit[Dd]oc\|link\|linkplain\|literal\|value\)' end='}' contained
syntax match  javaDocBlockTag '@\(exception\|param\|since\|throws\)' contained contains=javaDocBlockTagParam
syntax match  javaDocBlockTag '@\(author\|deprecated\|return\|serial\|serialData\|serialField\|version\)' contained
syntax region javaDocBlockTag contained matchgroup=javaDocBlockTag start='@see\s\+' matchgroup=NONE end='\_.'re=e-1 contains=javaDocSeeParam
highlight def link javaDocBlockTag Special
syntax match  javaDocBlockTagParam '\s\S\+' contained
highlight def link javaDocBlockTagParam Function
syntax match  javaDocSeeParam @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ contained extend
highlight def link javaDocSeeParam Function

" HTML Tags
syntax include @javaDocHtmlTag $VIMRUNTIME/syntax/html.vim
"unlet b:current_syntax
