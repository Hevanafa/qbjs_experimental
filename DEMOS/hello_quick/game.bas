$if web then
import Console from "lib\web\console.bas"
$endif

Option _Explicit

'$include: 'INCLUDES\BOOL.BI'

'$include: 'INCLUDES\SHAPES.BI'
'$include: 'INCLUDES\BITMAP.BI'
'$include: 'INCLUDES\BMFONT.BI'
'$include: 'INCLUDES\FPS.BI'
'$include: 'INCLUDES\MOUSE.BI'
'$include: 'INCLUDES\TIMING.BI'
'$include: 'INCLUDES\VGA.BI'

const quot = chr$(34)
const TargetFPS = 60

const SC_ESCAPE = &h01

const CornflowerBlue = &hFF6495ED

dim shared done

' Asset variables

dim shared as TBMFont defaultFont
dim shared as TBMFontGlyph defaultFontGlyphs(32 to 126)

dim shared imgCursor

' Game state variables
dim shared lastEsc


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
'$include: 'INCLUDES\FPS.BM'
'$include: 'INCLUDES\LOGGER.BM'
'$include: 'INCLUDES\KEYBOARD.BM'
'$include: 'INCLUDES\MOUSE.BM'
'$include: 'INCLUDES\QBJS.BM'
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
  If lastEsc <> isKeyDown(SC_ESCAPE) Then
    lastEsc = isKeyDown(SC_ESCAPE)

    if lastEsc then done = qbTrue
  end if
end sub

sub ExDraw
  cls , CornflowerBlue

  printBMFont defaultFont, defaultFontGlyphs(), "Hello world!", 10, 10

  flush
end sub