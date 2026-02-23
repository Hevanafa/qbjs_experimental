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

const K_ESC = 27

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

showMouse
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

sub drawMouse
  spr imgCursor, mouseX, mouseY
end sub


sub init
  initLogger
  initDeltaTime
  initFPSCounter
  
  Randomize Timer

  initBuffer
  startScaledMode
  initMouse
  hideMouse

  ' Load assets
  loadBMFont defaultFont, defaultFontGlyphs(), "assets\fonts\tahoma_bold_10.txt"

  imgCursor = loadImage("assets\images\cursor.png")

  ' Init game state
  done = qbFalse
end sub


sub ExUpdate
  updateDeltaTime
  incrementFPS

  updateMouse

  If lastEsc <> isKeyDown(K_ESC) Then
    lastEsc = isKeyDown(K_ESC)

    if lastEsc then done = qbTrue
  end if

  ' Your update code here
end sub

sub ExDraw
  cls , CornflowerBlue

  spr defaultFont.imgHandle, 10, 10

  printBMFont "Hello world!", 10, 10, defaultFont, defaultFontGlyphs()

  drawMouse
  drawFPS

  flush
end sub