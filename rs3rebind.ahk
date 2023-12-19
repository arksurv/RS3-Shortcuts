#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#MaxMem 4095
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

mouseLocked := false
spaceDown := false

#If WinActive("RuneScape")
XButton1::Space
XButton2::1
Joy1::Click

#If WinActive("RuneScape") And GetKeyState("NumLock", "T")
*Space::
if (!spaceDown) {
spaceDown := true
MouseClick, L,,, 1,, D
}
return

*Space up::
MouseClick, L,,, 1,, U
spaceDown := false
return

MButton::2

NumpadEnter::
if (mouseLocked) {
	mouseLocked := false
	BlockInput, MouseMoveOff
} else {
	mouseLocked := true
	BlockInput, MouseMove
}
return

#If
NumpadEnter::
mouseLocked := false
BlockInput, MouseMoveOff
return