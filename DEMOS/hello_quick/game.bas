

'$include: 'INCLUDES\BOOL.BI'

const TargetFPS = 60

dim shared done


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

sub init
  done = qbFalse
end sub