if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

" Reminder: \v means 'very magic'. All non alphanumeric characters and _ have
" the special meaning.

syntax match ppclNumber "\v%>6c<([0-9]+\.?[0-9])>"
highlight link ppclType Number

syntax match ppclVariable "\v\%.{-}\%"
highlight link ppclVariable Keyword

syntax keyword ppclKeyword THEN IF ELSE GOTO GOSUB
syntax match ppclKeyword "\v\.AND\."
syntax match ppclKeyword "\v\.OR\."
syntax match ppclKeyword "\v\.NE\."
syntax match ppclKeyword "\v\.EQ\."
syntax match ppclKeyword "\v\.LE\."
syntax match ppclKeyword "\v\.LT\."
syntax match ppclKeyword "\v\.GE\."
syntax match ppclKeyword "\v\.GT\."
syntax match ppclKeyword "\v\.XOR\."
syntax match ppclKeyword "\v\.ROOT\."
syntax match ppclKeyword "\vRETURN"

highlight link ppclKeyword Conditional

syntax match ppclFunction "\vTABLE\ze\("
syntax match ppclFunction "\vSET\ze\("
syntax match ppclFunction "\vDBSWIT\ze\("
syntax match ppclFunction "\vDEFINE\ze\("
syntax match ppclFunction "\vLOCAL\ze\("
syntax match ppclFunction "\vLOOP\ze\("
syntax match ppclFunction "\vDAY\ze\("
syntax match ppclFunction "\vMAX\ze\("
syntax match ppclFunction "\vMIN\ze\("
syntax match ppclFunction "\vSAMPLE\ze\("
syntax match ppclFunction "\vEMOFF\ze\("
syntax match ppclFunction "\vONPWRT\ze\("
syntax match ppclFunction "\vRELEAS\ze\("
syntax match ppclFunction "\vTIMAVG\ze\("
syntax match ppclFunction "\vEMON\ze\("
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
    execute 'syntax match ppclFunction "\v' . arithmeticFunction . '\ze\("'
endfor

"syntax match ppclFunction "\vCOS\ze\("
"syntax match ppclFunction "\vCOS\ze\("
highlight link ppclFunction Function

" At (@) priority indicators
syntax match ppclType "\v\@EMER"
syntax match ppclType "\v\@OPER"
syntax match ppclType "\v\@SMOKE"
syntax match ppclType "\v\@NONE"
syntax match ppclType "\v\@PDL"
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
    execute 'syntax match ppclType "\v<' . pointStatusIndicator . '>"'
endfor

"syntax match ppclType "ALARM"
"syntax match ppclType "ALMACK"
"syntax match ppclType "AUTO"
"syntax match ppclType "FAILED"
"syntax match ppclType "\v<OFF>"
"syntax match ppclType "\v<ON>"
"syntax match ppclType "PRFON"
highlight link ppclType Type


syntax match ppclIdentifier "\v\$\w+"
highlight link ppclIdentifier Identifier

syntax match ppclPoint contains=ppclVariable "\v\".{-}\""
highlight link ppclPoint String

syntax match ppclComment "\v^[0-9]+(\t| +)\zsC([¶]?$|(\t| +).*$)"
highlight link ppclComment Comment


let b:current_syntax="ppcl"
