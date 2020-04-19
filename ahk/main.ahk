#w::
WinGetTitle, Title, A
MsgBox, The active window is "%Title%".

#t::
MsgBox, boom
return
#r::
MsgBox, boom bam
return

#IfWinActive, main.ahk - Visual Studio Code
~^s::
MsgBox, caught
reload
return
