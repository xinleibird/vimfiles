" Highlight method names
syn match javaParen "(" contains=javaParen
syn match javaMethodInvoke "\(\(\.\)\@<=[a-z_]\+\w*\)(\@=" contains=javaParen
syn match javaMethodInvoke "^\s*[a-z_]\+\w*\s*(\@=" contains=javaParen
syn match javaAngle "<\w*>"
syn match javaMethodGenericInvoke "\w\+\s*<\w*>(\@=" contains=javaAngle
hi def link javaMethodInvoke Constant
hi def link javaMethodGenericInvoke Constant

" new object
syn match javaMethodDefine "\(\(\s*\(new\)\s*\)\@<=\)\w\+" contains=javaAngle
" define method
syn match javaMethodDefine "\(\(\s*\(void\|boolean\|byte\|char\|int\|long\|float\|double\|[A-Z_]\+[a-zA-Z_<>]*\)\s*\)\@<=\s*[a-z]\w*\s*\)(\@=" contains=javaAngle
" constructor
syn match javaMethodDefine "\(\(^\s*\(public\|private\|default\|\|protected\|synchronized\)\s*\)\@<=\s*[A-Z_]\w*\s*\)(\@=" contains=javaAngle
hi def link javaMethodDefine Function

" define class enum interface
syn match javaClassDefine "\(\s*\(class\|enum\|interface\)\s*\)\@<=[A-Z_]\+\w*"
hi def link javaClassDefine Type

" define enum member
syn match javaEnumMumber "\s*[A-Z_]\+\s*(\+\s*.*\s*)\+\s*\(,\|;\)"
hi def link javaEnumMumber Normal

syn match javaLambda "\s*->\s*"
hi def link javaLambda Normal

syn match javaCustomBraces "[\{\}\(\)\[\]]"
hi def link javaCustomBraces Statement
syn match   javaCustomNegative "\<[-]\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
hi def link javaCustomNegative Number
