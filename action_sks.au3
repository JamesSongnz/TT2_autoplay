

; action use sks
Func Use5Sks()

    ; check tap open  then close
    If CheckTapOpen() == True Then
    	BottomMenuExitFull()
    EndIf

    ; 2 times
    For $i=0 To 9
    			; skill use fire
    		MouseClick("left", $aSksCoord[$eSC], $Skill_btn_y )
    		MouseClick("left", $aSksCoord[$eWC], $Skill_btn_y )
    		MouseClick("left", $aSksCoord[$eFS], $Skill_btn_y )
    		MouseClick("left", $aSksCoord[$eDS], $Skill_btn_y )
    		MouseClick("left", $aSksCoord[$eHM], $Skill_btn_y )

			; move mouse point not to cover btn
			MouseMove( $aSksCoord[$eHM] , $Skill_btn_y + 100)
			Sleep(2000)

			; check all 5sks are enabled.
			If IsAll5SksEnabled() = True Then  ExitLoop

    Next


EndFunc

	; check 5 sks are all enabled.
Func IsAll5SksEnabled()

    For  $i = $eDS to $eSC
        If IsActivatedSkBtn($i) = True Or IsDeactivatedSkBtn($i) = True Then
			ConsoleWrite( " 	>>  5Sks are not Enabled for all. : " & $i & " is not ready !!" & @CRLF )
            Return False  ; not yet ready all
        EndIf
    Next

	Return True
EndFunc
