" Highlight method names
syn match javaCustomParen "(" contains=javaParen
syn match javaCustomFunc "\w\+\s*(\@=" contains=javaCustomParen
syn match javaCustomAngle "<\w*>"
syn match javaCustomGeneric "\w\+\s*<\w*>(\@=" contains=javaCustomAngle
hi link javaCustomFunc Function
hi link javaCustomGeneric Function
