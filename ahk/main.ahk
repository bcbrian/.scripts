#w::
WinGetTitle, Title, A
MsgBox, The active window is boom "%Title%".
return

~^s::
WinGetTitle, Title, A
FoundPos := InStr(Title, ".ahk")
If (FoundPos > 0)
MsgBox, caught
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