$IncludeOnce

Type TCheckboxState
  checked As Integer ' boolean
End Type

Type TSliderState
  value As Integer
End Type

Type TNineSliceMargins
  As Integer top, right, bottom, left
End Type

type TInputBoxState
  text as string
  cursorPos as integer
  maxLength as integer
  isFocused as integer ' boolean  (is this input active?)
  startOffset as integer
end type

' Additional mouse variables
dim shared as TRect mouseZone
dim shared as integer lastMouseButton
dim shared as integer mouseJustPressed, mouseJustReleased  ' boolean

' activeWidget is the "memory" of what the user clicked on
' activeWidget must survive across frames
Dim Shared As Integer hotWidget, activeWidget, nextWidgetID

' Tooltip stuff
Dim Shared As Double tooltipShowTick
Dim Shared As String tooltipText
Dim Shared As Integer tooltipX, tooltipY
Dim Shared As Integer lastMouseX, lastMouseY

' Input box stuff
dim shared as integer focusedInputID  ' -1 = none
dim shared as integer isInputCursorShown  ' boolean
dim shared as double inputCursorBlinkNextTick

' https://lospec.com/palette-list/ice-cream-gb
Const IceCreamWhite = &HFFFFF6D3
Const IceCreamOrange = &HFFF9A875
Const IceCreamRed = &HFFEB6B6F
Const IceCreamMaroon = &HFF7C3F58
