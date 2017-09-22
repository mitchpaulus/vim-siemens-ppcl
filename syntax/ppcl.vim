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
syntax match pplcKeyword "\v\.XOR\."
syntax match pplcKeyword "\v\.ROOT\."
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
syntax match pplcFunction "\vEMOFF\ze\("
syntax match pplcFunction "\vONPWRT\ze\("
syntax match pplcFunction "\vRELEAS\ze\("
syntax match pplcFunction "\vTIMAVG\ze\("
syntax match pplcFunction "\vEMON\ze\("
" Arithmetic operators

let arithmeticFunctions = ["ATN", 
            \ "COM",
            \ "COS",
            \ "EXP",
            \ "LOG",
            \ "SIN",
            \ "SQRT",
            \ "TAN" ]

for arithmeticFunction in arithmeticFunctions
    execute 'syntax match pplcFunction "\v' . arithmeticFunction . '\ze\("'
endfor

"syntax match pplcFunction "\vCOS\ze\("
"syntax match pplcFunction "\vCOS\ze\("
highlight link pplcFunction Function

" At (@) priority indicators
syntax match pplcType "\v\@EMER"
syntax match pplcType "\v\@OPER"
syntax match pplcType "\v\@SMOKE"
syntax match pplcType "\v\@NONE"
syntax match pplcType "\v\@PDL"
"
" Point status indicators

let pointStatusIndicators = [
            \ "ALARM",
            \ "ALMACK",
            \ "AUTO",
            \ "DEAD",
            \ "LOW",
            \ "OK",
            \ "DAYMOD",
            \ "FAILED",
            \ "FAST",
            \ "HAND",
            \ "NGTMOD",
            \ "OFF",
            \ "ON",
            \ "PRFON",
            \ "SLOW"]

for pointStatusIndicator in pointStatusIndicators
    execute 'syntax match pplcType "\v<' . pointStatusIndicator . '>"'
endfor

"syntax match pplcType "ALARM"
"syntax match pplcType "ALMACK"
"syntax match pplcType "AUTO"
"syntax match pplcType "FAILED"
"syntax match pplcType "\v<OFF>"
"syntax match pplcType "\v<ON>"
"syntax match pplcType "PRFON"
highlight link pplcType Type


syntax match pplcIdentifier "\v\$\w+"
highlight link pplcIdentifier Identifier

"syntax match pplcPoint "\v\".{-}\""
"highlight link pplcType String

syntax match pplcComment "\v^[0-9]{5}\tC.*$"
highlight link pplcComment Comment

let b:current_syntax="pplc"
