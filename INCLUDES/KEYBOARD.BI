$IncludeOnce

' Key constants
' Refer to this list: https://qb64phoenix.com/qb64wiki/index.php/KEYDOWN
Const K_ESC = 27
const K_BACKSPACE = 8

Const K_A = 97
const K_C = 99
Const K_D = 100
const K_E = 101
Const K_F = 102
const K_I = 105
const K_J = 106
const K_K = 107
const K_L = 108
const K_M = 109
const K_P = 112
const K_Q = 113
Const K_R = 114
Const K_S = 115
Const K_W = 119
const K_X = 120
Const K_Z = 122
const K_TILDE = 96

const K_A_UPPER = 65
const K_D_UPPER = 68
const K_E_UPPER = 69
const K_I_UPPER = 73
const K_J_UPPER = 74
const K_K_UPPER = 75
const K_L_UPPER = 76
const K_S_UPPER = 83
const K_W_UPPER = 87
const K_X_UPPER = 88
const K_Z_UPPER = 90

const K_TAB = 9
const K_ENTER = 13
Const K_UP = 18432
Const K_DOWN = 20480
Const K_LEFT = 19200
Const K_RIGHT = 19712
Const K_SPACEBAR = 32
Const K_LCTRL = 100306
const K_RSHIFT = 100303

const K_F2 = 15360
const K_F11 = 34048

const K_D1 = 49
const K_D2 = 50
const K_D3 = 51

' Key booleans
dim Shared As Integer lastEsc, lastF2, lastF11
dim shared as integer lastE, lastF
dim shared as integer lastEnter, lastSpacebar

dim shared as integer lastUp, lastRight, lastDown, lastLeft  ' boolean
dim shared as integer lastBackspace  ' boolean
dim shared as integer lastD1, lastD2, lastD3  ' boolean