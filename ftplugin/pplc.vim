if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif


echom "About to run pplc Comment line"
syntax match pplcComment "\v^[0-9]{5}\tC.*$"
highlight link pplcComment Comment

syntax match pplcVariable "\v\%.{-}\%"
highlight link pplcVariable Keyword

syntax keyword pplcKeyword THEN IF ELSE GOTO
syntax match pplcKeyword "\v\.AND\."
syntax match pplcKeyword "\v\.OR\."
syntax match pplcKeyword "\v\.NE\."
syntax match pplcKeyword "\v\.EQ\."
syntax match pplcKeyword "\v\.LE\."
syntax match pplcKeyword "\v\.LT\."
syntax match pplcKeyword "\v\.GE\."
syntax match pplcKeyword "\v\.GT\."

highlight link pplcKeyword Keyword

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
syntax match pplcType "OFF"
syntax match pplcType "PRFON"
highlight link pplcType Type

"syntax match pplcPoint "\v\".{-}\""
"highlight link pplcType String

"syntax match pplcNumber "\v[0-9]{-}\.?[0-9]{-}"
"highlight link pplcType Number

echom "Our syntax highlighting goes here as well."

let b:current_syntax="pplc"



