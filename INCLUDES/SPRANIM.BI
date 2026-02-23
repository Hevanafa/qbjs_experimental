$IncludeOnce

' Sprite image format:
' A horizontal strip of sprites
type TSpriteAnim
  as long imgHandle
  ' use SprFlip enum in BITMAP.BI
  as integer flip
  ' frameIdx starts from 0
  as integer frameIdx, frameCount
  as integer frameWidth, frameHeight
  as double frameEndTick, interval
  as integer isLooping  ' boolean
end type
