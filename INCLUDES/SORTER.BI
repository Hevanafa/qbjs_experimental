' Package Sorter Minigame

' Packages enum
const PackageNone = 0
const PackageNonPerishable = 1
const PackagePerishable = 2
const PackageToxic = 3

' const PackageSorterDuration = 30.0
const PackageSorterDuration = 15.0
const TimeUpText = "Time's Up!"

dim shared as integer sorterHasStarted  ' boolean
dim shared as integer sorterLine(0 to 19)  ' Use Packages enum
dim shared as integer isSorterEndGame  ' boolean

dim shared as long sorterScore, sorterBestScore
dim shared as integer sorterCorrect, sorterWrong
dim shared as double sorterAccuracy

' for display only
dim shared as long sorterScoreStart, sorterScoreEnd
dim shared as TLerpTimer sorterScoreLerpTimer

' for display only
dim shared as double sorterAccuracyStart, sorterAccuracyEnd
dim shared as TLerpTimer sorterAccuracyLerpTimer

dim shared as double sorterGameEndTick, sorterFlinchEndTick
dim shared as double lastCorrectSorterThrowTick

dim shared as double sorterYStart, sorterYEnd
dim shared as TLerpTimer sorterYLerpTimer

dim shared as long lastThrownSorterItem
dim shared as TPoint sorterThrowStartPoint, sorterThrowEndPoint
dim shared as TLerpTimer sorterThrowLerpTimer

dim shared as integer sorterCombo
dim shared as double sorterComboEndTick

dim shared as integer isSorterResultScreen ' boolean
dim shared as integer sorterRating
dim shared as double sorterTimeUpScreenEndTick
dim shared as integer lastSorterEarning
