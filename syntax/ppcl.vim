if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

" Reminder: \v means 'very magic'. All non alphanumeric characters and _ have
" the special meaning.

syntax match ppclNumber "\v%>6c<([0-9]+\.?[0-9])>"
highlight link ppclType Number

syntax match ppclLineEnding conceal "¶"

syntax match ppclVariable "\v\%.{-}\%"
highlight link ppclVariable Keyword

syntax keyword ppclKeyword THEN IF ELSE GOTO GOSUB RETURN
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

" PPCL Commands
syntax match ppclFunction "\vACT\ze\("
syntax match ppclFunction "\vADAPTM\ze\("
syntax match ppclFunction "\vADAPTS\ze\("
syntax match ppclFunction "\vALARM\ze\("
syntax match ppclFunction "\vAUTO\ze\("
syntax match ppclFunction "\vDAY\ze\("
syntax match ppclFunction "\vDBSWIT\ze\("
syntax match ppclFunction "\vDC\ze\("
syntax match ppclFunction "\vDCR\ze\("
syntax match ppclFunction "\vDEACT\ze\("
syntax match ppclFunction "\vDEFINE\ze\("
syntax match ppclFunction "\vDISABL\ze\("
syntax match ppclFunction "\vDISALM\ze\("
syntax match ppclFunction "\vDISCOV\ze\("
syntax match ppclFunction "\vDPHONE\ze\("
syntax match ppclFunction "\vEMAUTO\ze\("
syntax match ppclFunction "\vEMFAST\ze\("
syntax match ppclFunction "\vEMOFF\ze\("
syntax match ppclFunction "\vEMON\ze\("
syntax match ppclFunction "\vEMSET\ze\("
syntax match ppclFunction "\vEMSLOW\ze\("
syntax match ppclFunction "\vENABLE\ze\("
syntax match ppclFunction "\vENALM\ze\("
syntax match ppclFunction "\vENCOV\ze\("
syntax match ppclFunction "\vEPHONE\ze\("
syntax match ppclFunction "\vFAST\ze\("
" syntax match ppclFunction "\vGOSUB\ze\("
" syntax match ppclFunction "\vGOTO\ze\("
syntax match ppclFunction "\vHLIMIT\ze\("
syntax match ppclFunction "\vHOLIDA\ze\("
" syntax match ppclFunction "\v" IF THEN ELSE\ze\("
syntax match ppclFunction "\vINITTO\ze\("
syntax match ppclFunction "\vLLIMIT\ze\("
syntax match ppclFunction "\vLOCAL\ze\("
syntax match ppclFunction "\vLOOP\ze\("
syntax match ppclFunction "\vMAX\ze\("
syntax match ppclFunction "\vMIN\ze\("
syntax match ppclFunction "\vNIGHT\ze\("
syntax match ppclFunction "\vNORMAL\ze\("
syntax match ppclFunction "\vOFF\ze\("
syntax match ppclFunction "\vOIP\ze\("
syntax match ppclFunction "\vON\ze\("
syntax match ppclFunction "\vONPWRT\ze\("
syntax match ppclFunction "\vPDL\ze\("
syntax match ppclFunction "\vPDLDAT\ze\("
syntax match ppclFunction "\vPDLDPG\ze\("
syntax match ppclFunction "\vPDLMTR\ze\("
syntax match ppclFunction "\vPDLSET\ze\("
syntax match ppclFunction "\vRELEAS\ze\("
" syntax match ppclFunction "\vRETURN\ze\("
syntax match ppclFunction "\vSAMPLE\ze\("
syntax match ppclFunction "\vSET\ze\("
syntax match ppclFunction "\vSLOW\ze\("
syntax match ppclFunction "\vSSTO\ze\("
syntax match ppclFunction "\vSSTOCO\ze\("
syntax match ppclFunction "\vSTATE\ze\("
syntax match ppclFunction "\vTABLE\ze\("
syntax match ppclFunction "\vTIMAVG\ze\("
syntax match ppclFunction "\vTOD\ze\("
syntax match ppclFunction "\vTODMOD\ze\("
syntax match ppclFunction "\vTODSET\ze\("
syntax match ppclFunction "\vWAIT\ze\("

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

syntax match ppclComment "\v^[0-9]+(\t| +)\zsC([¶]?$|(\t| +).*$)" contains=ppclLineEnding
highlight link ppclComment Comment


let b:current_syntax="ppcl"
