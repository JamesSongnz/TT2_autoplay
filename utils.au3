

func Debug($str)
	ConsoleWrite($str)
EndFunc


Func InitVariable()
	$numTotalHShits = 0
	$numHShits = 0

	; time variables
	$DurationFairy = 60000		; back to default
EndFunc



; init All Timer
Func ResetTimer()
    $FairyTimeBase = TimerInit()
    $SkTimeBase = TimerInit()
    $FinishTimeBase = TimerInit()

EndFunc


Func OnTimeFairyCheck()

    ; check time elapsed fairy duration
    Local $FairyElapsed = TimerDiff( $FairyTimeBase)

	; the time of last part ,  fairy time shrink to 30s
	If Int(TimerDiff($FinishTimeBase)) > $DurationFinish Then $DurationFairy = $DurationFairy/2

    If $FairyElapsed > $DurationFairy Then
        $FairyTimeBase = TimerInit()        ; reset timebase
        Return True
    Else
        Return False
    EndIf

EndFunc

Func OnTimeCheckNextSks()

    ; check time elapsed fairy duration
    Local $SkElapsed = TimerDiff( $SkTimeBase)
	ConsoleWrite ( " -- ## SK Time Diff : " & $SkElapsed & @CRLF)

    If $SkElapsed > $DurationSkill Then
        Return True
    Else
        Return False
    EndIf

EndFunc


Func OnTimeFinish()

    ; check time elapsed fairy duration
    Local $FinishElapsed = TimerDiff( $FinishTimeBase)
	ConsoleWrite ( " -- @@@ Finish Time Diff : " & $FinishElapsed & @CRLF)

    If Int($FinishElapsed) > $DurationFinish Then
		ConsoleWrite ( " It's time for Finish Check ~		: " & @CRLF)
        Return True
    Else
        Return False
    EndIf

EndFunc


Func ResetSkTimer()
    $SkTimeBase = TimerInit()
EndFunc

