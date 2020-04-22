; https://www.autohotkey.com/docs/FAQ.htm#hotkeys-hotstrings-and-remapping

#w::
SysGet, Mon1, Monitor, 1
; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; WinGetTitle, Title, A
; MsgBox, The active window is "%Title%".
WinGet, active_id, ID, A
; MsgBox, The active window's ID is "%active_id%".
Input, UserInput, T5 L1, {enter}.{esc}{tab}, 1,2,q,w
if (ErrorLevel = "Max")
{
    MsgBox, You entered "%UserInput%", which is the maximum length of text.
    return
}
if (ErrorLevel = "Timeout")
{
    MsgBox, You entered "%UserInput%" at which time the input timed out.
    return
}
if (ErrorLevel = "NewInput")
    return
If InStr(ErrorLevel, "EndKey:")
{
    MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
    return
}
; Otherwise, a match was found.
; MsgBox, The size "%UserInput%".
if (UserInput = "1")
{
  width := Mon1Right/4
  height := Mon1Bottom/4
}
  ; WinMove, ahk_id %active_id%, , , , Mon1Right/4, Mon1Bottom/4
else if (UserInput = "2")
{
  width := Mon1Right/2
  height := Mon1Bottom/4
}
  ; WinMove, ahk_id %active_id%, , , , Mon1Right/2, Mon1Bottom/4
else if (UserInput = "q")
{
  width := Mon1Right/4
  height := Mon1Bottom/2
}
  ; WinMove, ahk_id %active_id%, , , , Mon1Right/4, Mon1Bottom/2
else if (UserInput = "w")
{
  width := Mon1Right/2
  height := Mon1Bottom/2
}
  ; WinMove, ahk_id %active_id%, , , , Mon1Right/2, Mon1Bottom/2
; MsgBox, The size "%width%" "%height%".
; return
Input, UserInput, T5 L1, {enter}.{esc}{tab}, 1,2,3,q,w,e,a,s,d
if (ErrorLevel = "Max")
{
    MsgBox, You entered "%UserInput%", which is the maximum length of text.
    return
}
if (ErrorLevel = "Timeout")
{
    MsgBox, You entered "%UserInput%" at which time the input timed out.
    return
}
if (ErrorLevel = "NewInput")
    return
If InStr(ErrorLevel, "EndKey:")
{
    MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
    return
}
; Otherwise, a match was found.
if (UserInput = "1")
  WinMove, ahk_id %active_id%, , Mon1Left, Mon1Top, width, height
else if (UserInput = "2")
  WinMove, ahk_id %active_id%, , Mon1Right/4, Mon1Top, width, height
else if (UserInput = "3")
  WinMove, ahk_id %active_id%, , Mon1Right-width, Mon1Top, width, height
else if (UserInput = "q")
  WinMove, ahk_id %active_id%, , Mon1Left, Mon1Bottom/4, width, height
else if (UserInput = "w")
  WinMove, ahk_id %active_id%, , Mon1Right/4, Mon1Bottom/4, width, height
else if (UserInput = "e")
  WinMove, ahk_id %active_id%, , Mon1Right-width, Mon1Bottom/4, width, height
else if (UserInput = "a")
  WinMove, ahk_id %active_id%, , Mon1Left, Mon1Bottom-height, width, height
else if (UserInput = "s")
  WinMove, ahk_id %active_id%, , Mon1Right/4, Mon1Bottom-height, width, height
else if (UserInput = "d")
  WinMove, ahk_id %active_id%, , Mon1Right-width, Mon1Bottom-height, width, height
; MsgBox, You
return

~^s::
WinGetTitle, Title, A
FoundPos := InStr(Title, ".ahk")
If (FoundPos > 0)
; MsgBox, caught
reload
return

CapsLock::
Send {ESC}
return

;XANDER
#Space::
MsgBox, GUI

Gui, Color, EEAA99
Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
WinSet, TransColor, EEAA99
Gui -Caption  ; Or use Gui, GuiName:-Caption if it isn't the default window.

Gui, Add, Edit, Lowercase vXanderCommand
Gui, Show,, Simple Input Example
return  ; End of auto-execute section. The script is idle until the user does something.

GuiEscape:
GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
If (XanderCommand := "test")
MsgBox noooooooo.
return
MsgBox You entered "%XanderCommand%".
return