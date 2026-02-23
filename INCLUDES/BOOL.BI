$IncludeOnce

' $if WEB then

Const qbFalse = 0
Const qbTrue = -1

' $else

'   $if BoolConsts = undefined then
'     $let BoolConsts = defined
' Const False% = 0
' Const True% = Not False
'   $endif
' $endif
