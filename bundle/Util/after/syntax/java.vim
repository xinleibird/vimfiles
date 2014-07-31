" Highlight method names
syn match javaParen "(" contains=javaParen
syn match javaMethodInvoke "\w\+\s*(\@=" contains=javaParen
syn match javaAngle "<\w*>"
syn match javaMethodGenericInvoke "\w\+\s*<\w*>(\@=" contains=javaAngle
hi def link javaMethodInvoke Constant
hi def link javaMethodGenericInvoke Constant

" new object
syn match javaMethodDefine "\(\(\s*\(new\)\s*\)\@<=\)\w\+" contains=javaAngle
" define method
syn match javaMethodDefine "\(\(\s*\(void\|[A-Z]\+[a-zA-Z_<>]*\)\s*\)\@<=\s*[a-z]\w*\s*\)(\@=" contains=javaAngle
" constructor
syn match javaMethodDefine "\(\(^\s*\(public\|private\)\s*\)\@<=\s*[A-Z]\w*\s*\)(\@=" contains=javaAngle
hi def link javaMethodDefine Function

syn match javaClassDefine "\(\s*\(class\|interface\)\s*\)\@<=\w\+"
hi def link javaClassDefine Type


syn match javaCustomBraces "[\{\}\(\)\[\]]"
syn match javaCustomBraces "[\(\)]"
syn match javaCustomBraces "[\[\]]"
hi def link javaCustomBraces Statement
syn match   javaCustomNegative "\<[-]\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
hi def link javaCustomNegative Number
