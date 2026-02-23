$IncludeOnce

type TBMFontGlyph
  as integer id, x, y
  as integer width, height, xoffset, yoffset, xadvance
  as integer lineHeight
  ' as integer page, chnl
end type

type TBMFont
  face as string * 16
  filename as string * 64
  lineHeight as integer
  imgHandle as long
end type
