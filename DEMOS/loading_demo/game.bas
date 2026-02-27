$if web then
import Console from "lib\web\console.bas"
' Anything above import lines are deleted

$if javascript then
// HTML5 canvas out-of-focus fix
window.setTimeout(() => {
  "use strict";

  const canvas = document.getElementById("gx-canvas")
  canvas.addEventListener("click", () => {
    canvas.tabIndex = 0
    canvas.focus()
  })
}, 1000)
$endif
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
const Black = &hFF000000

const GameStateLoading = 1
const GameStatePlaying = 2

' Asset variables

dim shared as TBMFont defaultFont
dim shared as TBMFontGlyph defaultFontGlyphs(32 to 126)

dim shared as long imgCursor, imgEmptyHeart, imgFilledHeart, imgHorseshoe

const totalAssetCount = 4
dim shared as integer assetCount
assetCount = 0

' Game state variables
dim shared lastEsc

dim shared done  ' boolean
dim shared as integer actualGameState



' Entry point
init

$if javascript
console.log("imgCursor (outside)", imgCursor);
$endif

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

Sub drawFPS
  dim s as string
  dim w as integer

  s = "FPS:" + Str$(lastFPS)
  w = measureBMFont(defaultFontGlyphs(), s)
  printBMFont defaultFont, defaultFontGlyphs(), s, vgaWidth - w - 4, 0
End Sub


sub loadDefaultFont
  loadBMFont defaultFont, defaultFontGlyphs(), "assets\fonts\tahoma_bold_10.txt"
end sub

sub printDefault(text as string, x as integer, y as integer)
  printBMFont defaultFont, defaultFontGlyphs(), text, x, y
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

  done = qbFalse

  ' Load assets
  loadDefaultFont

  beginLoadingState
end sub


sub beginPlayingState
  actualGameState = GameStatePlaying

  ' Init game state
end sub

sub beginLoadingState
  actualGameState = GameStateLoading
  
  ' imgCursor = _LoadImage("assets\images\cursor.png")
  ExDraw

$if javascript
  Promise.all([
    QB.func__LoadImage("assets\\images\\cursor.png").then(r => { imgCursor = r; assetCount++; sub_ExDraw() }),
    QB.func__LoadImage("assets\\images\\empty_heart.png").then(r => { imgEmptyHeart = r; assetCount++; sub_ExDraw() }),
    QB.func__LoadImage("assets\\images\\filled_heart.png").then(r => { imgFilledHeart = r; assetCount++; sub_ExDraw() }),
    QB.func__LoadImage("assets\\images\\horseshoe.png").then(r => { imgHorseshoe = r; assetCount++; sub_ExDraw() })
  ]).then(() => {
    // sub_beginPlayingState();
  })
$endif
end sub


sub ExUpdate
  updateDeltaTime
  incrementFPS

  updateMouse

  if actualGameState = GameStateLoading then
    ' if assetCount = totalAssetCount then beginPlayingState
    
    exit sub
  end if

  ' Default state: Playing

  If lastEsc <> isKeyDown(K_ESC) Then
    lastEsc = isKeyDown(K_ESC)

    if lastEsc then done = qbTrue
  end if

  ' Your update code here
end sub

sub ExDraw
  if actualGameState = GameStateLoading then
    cls , Black

    printDefault "Progress: " + assetCount + " / " + totalAssetCount, 10, 10

    flush
    exit sub
  end if

  cls , CornflowerBlue

  ' spr defaultFont.imgHandle, 10, 10

  printBMFont defaultFont, defaultFontGlyphs(), "Hello world!", 10, 10

  drawMouse
  drawFPS

  flush
end sub