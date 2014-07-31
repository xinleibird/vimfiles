" Highlight method names
syn match javaParen "(" contains=javaParen
syn match javaMethodInvoke "\w\+\s*(\@=" contains=javaParen
syn match javaAngle "<\w*>"
syn match javaMethodGenericInvoke "\w\+\s*<\w*>(\@=" contains=javaAngle
hi def link javaMethodInvoke Constant
hi def link javaMethodGenericInvoke Constant

syn match javaMethodDefine "\(\(\(new\)\s*\)\@<=\)\w\+" contains=javaAngle
syn match javaMethodDefine "\w\+\(([^()]*)\s*\(throws\)\=\s*{$\)\@=" contains=javaAngle
hi def link javaMethodDefine Function

syn match javaClassDefine "\(\s*\(class\|interface\)\s*\)\@<=\w\+"
hi def link javaClassDefine Type


syn match javaCustomBraces "[\{\}\(\)\[\]]"
syn match javaCustomBraces "[\(\)]"
syn match javaCustomBraces "[\[\]]"
hi def link javaCustomBraces Statement
syn match   javaCustomNegative "\<[-]\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
hi def link javaCustomNegative Number
