#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; Description: This script puts a limit on volume up within windows using the AutoHotKey tool.

Menu,Tray,Icon,Icon.png

;Define the volume limit between 1 to 99.

volume_limit=30

; Key to activate and deactivate the script, ALT + VOLUME_UP.

!Volume_Up:: Suspend, Toggle
return

; Restrict volume VOLUME_UP

Volume_Up::
    ; Get system volume
    SoundGet, master_volume

    If (master_volume=0){
        Send {Volume_Mute}
        SoundSet 2
    }Else If (master_volume<volume_limit-1){
        SoundSet +1
    }Else If (master_volume>volume_limit){
        SoundSet volume_limit
    }Else{
        Return
    }
Return

;End