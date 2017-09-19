if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

syntax match pplcNumber "\v%>6c<([0-9]+\.?[0-9])>"
highlight link pplcType Number

syntax match pplcVariable "\v\%.{-}\%"
highlight link pplcVariable Keyword

syntax keyword pplcKeyword THEN IF ELSE GOTO GOSUB
syntax match pplcKeyword "\v\.AND\."
syntax match pplcKeyword "\v\.OR\."
syntax match pplcKeyword "\v\.NE\."
syntax match pplcKeyword "\v\.EQ\."
syntax match pplcKeyword "\v\.LE\."
syntax match pplcKeyword "\v\.LT\."
syntax match pplcKeyword "\v\.GE\."
syntax match pplcKeyword "\v\.GT\."
syntax match pplcKeyword "\vRETURN"

highlight link pplcKeyword Conditional

syntax match pplcFunction "\vTABLE\ze\("
syntax match pplcFunction "\vSET\ze\("
syntax match pplcFunction "\vDBSWIT\ze\("
syntax match pplcFunction "\vDEFINE\ze\("
syntax match pplcFunction "\vLOCAL\ze\("
syntax match pplcFunction "\vLOOP\ze\("
syntax match pplcFunction "\vMAX\ze\("
syntax match pplcFunction "\vSAMPLE\ze\("
highlight link pplcFunction Function

syntax match pplcType "FAILED"
syntax match pplcType "\v<OFF>"
syntax match pplcType "\v<ON>"
syntax match pplcType "PRFON"
highlight link pplcType Type


syntax match pplcIdentifier "\v\$\w+"
highlight link pplcIdentifier Identifier

"syntax match pplcPoint "\v\".{-}\""
"highlight link pplcType String

syntax match pplcComment "\v^[0-9]{5}\tC.*$"
highlight link pplcComment Comment

let b:current_syntax="pplc"
