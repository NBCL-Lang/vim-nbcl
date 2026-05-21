if exists("b:current_syntax")
  finish
endif

" Comments
syntax region nbclCommentBlock start=/#-/ end=/-#/
syntax match nbclCommentLine /#[^-].*$\|#$/

" Keywords
syntax keyword nbclControl if else while for in return match
syntax keyword nbclKeyword fn component import as let const set any
syntax keyword nbclNull null

" Types
syntax keyword nbclType String Int Float Bool List Map Node Lambda Any

" Literals
syntax keyword nbclBoolean true false
syntax match nbclConstant  /\<[A-Z][A-Z0-9_]*\>/
syntax match nbclFloat     /-\?\<\d\+\.\d\+\>/
syntax match nbclInteger   /-\?\<\d\+\>/

" Strings
syntax match nbclEscape  /\\[ntr\\"'u]\|\\u[0-9a-fA-F]\{4}/ contained
syntax region nbclString start=/"/ end=/"/ skip=/\\"/ contains=nbclEscape
syntax region nbclString start=/'/ end=/'/ skip=/\\'/ contains=nbclEscape

" Operators
syntax match nbclOperator /=>\|==\|!=\|<=\|>=\|\.\.\.\?=\?\|?\./ 
syntax match nbclOperator /[<>!+\-*\/%]/
syntax match nbclOperator /&&\|||/
syntax match nbclOperator /\(||\)\@<!|\(|\)\@!/

" Functions
syntax match nbclFunction /\<fn\s\+\zs[a-z][a-zA-Z0-9_]*/
syntax match nbclFunction /\<[a-z_][a-zA-Z0-9_]*\ze\s*(/

" Keys
syntax match nbclPropKey /^\s*\zs[a-z_][a-zA-Z0-9_]*\ze\s*=/
syntax match nbclMapKey  /\<[a-z_][a-zA-Z0-9_]*\ze\s*:/

" Components / nodes
syntax match nbclComponent /\<component\s\+\zs[A-Z][a-zA-Z0-9]*/
syntax match nbclNode      /\<[A-Z][a-zA-Z0-9]*\>/

" Highlight links
highlight default link nbclCommentBlock Comment
highlight default link nbclCommentLine  Comment
highlight default link nbclControl      Keyword
highlight default link nbclKeyword      Keyword
highlight default link nbclNull         Keyword
highlight default link nbclType         Type
highlight default link nbclBoolean      Boolean
highlight default link nbclConstant     Constant
highlight default link nbclFloat        Float
highlight default link nbclInteger      Number
highlight default link nbclString       String
highlight default link nbclEscape       SpecialChar
highlight default link nbclOperator     Operator
highlight default link nbclFunction     Function
highlight default link nbclPropKey      Identifier
highlight default link nbclMapKey       Identifier
highlight default link nbclComponent    Structure
highlight default link nbclNode         Tag

let b:current_syntax = "nbcl"
