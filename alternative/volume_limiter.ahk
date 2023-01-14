#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; Description: This script puts a limit on volume up within windows using the AutoHotKey tool.

; Define the volume limit between 1 to 99.
volume_limit=20

;   limiter status
limit_state=0
!Volume_Up::
    If(limit_state=1)
    {
        limit_state=0
        Return
    }Else{
        limit_state=1
        Return
    }
Return

; Restrict volume VOLUME_UP
Volume_Up::
    ; Get system volume
    SoundGet, master_volume

    If (limit_state=1){
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
    }Else{
        SoundSet +2
    }
Return

;End