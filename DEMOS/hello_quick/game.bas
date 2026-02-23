$if web then
import Console from "lib\web\console.bas"
$endif

Option _Explicit

'$include: 'INCLUDES\BOOL.BI'

'$include: 'INCLUDES\SHAPES.BI'
'$include: 'INCLUDES\BITMAP.BI'
'$include: 'INCLUDES\BMFONT.BI'
'$include: 'INCLUDES\FPS.BI'
'$include: 'INCLUDES\KEYBOARD.BI'
'$include: 'INCLUDES\MOUSE.BI'
'$include: 'INCLUDES\TIMING.BI'
'$include: 'INCLUDES\VGA.BI'

const quot = chr$(34)
const TargetFPS = 60

const CornflowerBlue = &hFF6495ED

dim shared done

dim shared as TBMFont defaultFont
dim shared as TBMFontGlyph defaultFontGlyphs

dim shared imgCursor


' Entry point
init

do while not done
  _limit TargetFPS

  ExUpdate
  ExDraw
loop

' Cleanup

system



' implementation

'$include: 'INCLUDES\BITMAP.BM'
'$include: 'INCLUDES\BMFONT.BM'
'$include: 'INCLUDES\CONV.BM'
'$include: 'INCLUDES\STRINGS.BM'
'$include: 'INCLUDES\TIMING.BM'
'$include: 'INCLUDES\PANIC.BM'
'$include: 'INCLUDES\VGA.BM'

sub init
  initLogger
  initDeltaTime
  initFPSCounter
  
  Randomize Timer

  initBuffer
  initMouse
  hideMouse

  ' Load assets
  loadBMFont defaultFont, defaultFontGlyphs(), "assets\fonts\tahoma_bold_10.txt"

  imgCursor = loadImage("IMG\cursor.png")


  ' Init game state
  done = qbFalse
end sub


sub ExUpdate

end sub

sub ExDraw
  cls , CornflowerBlue

  printBMFont defaultFont, defaultFontGlyphs(), "Hello world!", 10, 10

  flush
end sub