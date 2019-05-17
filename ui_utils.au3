
; check UI status



Func CheckTapOpen()

    ; check up right x icon
    Local $left = 655, $top = 55,   $right =687 , $bottom = 76
	Local $TapOpenIconCheckSum = 122565676;


    Local $pixelCheck =0
    $pixelCheck = PixelCheckSum( $left, $top, $right, $bottom)
	ConsoleWrite(  " check tap : " & $pixelCheck & @CRLF)

    If $TapOpenIconCheckSum <> $pixelCheck Then
        Return False
    Else
        Return True
    EndIf

EndFunc

Func IsEnabledBtn($i)
	If IsActivatedSkBtn($i) <> True And IsDeactivatedSkBtn($i) <> True Then Return True
	Return False

EndFunc


; how to check activate :  center area of btn  checksum
Func IsActivatedSkBtn($i)

    Local $btnCheckSum = GetSkBtnCheckSum($i)
	;ConsoleWrite( "  > CheckSum: " & $i & " : " & $btnCheckSum &  " <=>  ActCS : " & $csSkBtnActivated[$i] & @CRLF )

    If $btnCheckSum <> $csSkBtnActivated[$i] Then
        Return False
    EndIf
    Return True
EndFunc

Func IsDeactivatedSkBtn($i)

    Local $btnCheckSum = GetSkBtnCheckSum($i)
	;ConsoleWrite( "  > CheckSum: " & $i & " : " & $btnCheckSum &  " <=>  ActCS : " & $csSkBtnActivated[$i] & @CRLF )

    If $btnCheckSum <> $csSkBtnDeactivated[$i] Then
        Return False
    EndIf
    Return True
EndFunc

; check m bar  coord
Func IsEnoughMana()

    Local $mbar_x = 100 , $mbar_y = 1079, $mbar_width = 328


    Local $coord = PixelSearch( $mbar_x, $mbar_y, $mbar_x + $mbar_width, $mbar_y+1, 0xffffff ) ; mana wihte end bar


    If Not @error Then
		ConsoleWrite ( "	## > -- Mana check : " & $coord[0] & " ,  enough is " & $enough_m_x & @CRLF )
		; check m value
         If $coord[0] > $enough_m_x Then
            Return True
         EndIf
    EndIf

    Return False
EndFunc


func GetSkBtnCheckSum($i)
	return MyGetPixelCS( $aSksPixelCoord[ $i ] , $Skill_btn_pixel_y , $skill_btn_pixel_w, $skill_btn_pixel_h)
EndFunc

Func PrintGetPixelCheckSum( $center_x, $center_y, $w, $h )
    Local $pixelCheck = PixelCheckSum( $center_x -($w/2), $center_y - ($h/2) , $center_x +($w/2), $center_y + ($h/2) )
    ConsoleWrite( " Pixel Check Sum : " & $pixelCheck & ": Area x:" & $center_x &  " y:" & $center_y & "  w:" & $w & " h:" & $h )
EndFunc

; use center position & total width/ hight
Func MyGetPixelCS( $center_x, $center_y, $w, $h )
	$center_x  = $Scr_Win_x + $center_x
	$center_y  = $Scr_Win_y + $center_y
	;Local $pixelCheck = PixelCheckSum($center_x -($w/2), $center_y - ($h/2), $center_x +($w/2), $center_y + ($h/2) )
	Local $pixelCheck = PixelCheckSum($center_x , $center_y , $center_x +($w), $center_y + ($h) )

    ;ConsoleWrite( "My Pixel Check Sum : " & $pixelCheck & ": Area x:" & $center_x &  " y:" & $center_y & "  w:" & $w & " h:" & $h)


	Return $pixelCheck

EndFunc