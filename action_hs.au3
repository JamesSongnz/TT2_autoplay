


Func UseHS()


	;HS Sk btn coord :  38, 1165 ,  87, 1215
	$PixelCS  = PixelChecksum(38, 1165 ,  87, 1215 )
	Local $HSReadyCS = 1810838474

	if $PixelCS <> $HSReadyCS Then
		ConsoleWrite ("		##  HS not ready : skip " &@CRLF)
		Return
	EndIf

	; Only use HS when 5 sks are all enabled.
    ; check all sk btn are activated
    For  $i = $eDS to $eSC
        If IsActivatedSkBtn($i) = True Or IsDeactivatedSkBtn($i) = True Then
			ConsoleWrite( " 	##  UseHS : check sk enabled : " & $i & " is not !!" & @CRLF )
            Return False  ; not yet ready all
        EndIf
    Next

	$numTotalHShits += 1
	$numHShits += 1

	MouseClick("left", $aSksCoord[$eHS] , $Skill_btn_y, 1, 1 )
	ConsoleWrite(" 		## hits HS " & $numHShits & @CRLF )
EndFunc

Func HSResetCount()
	$numHShits = 0
EndFunc
