


$SMtap_box_x  = 360
$SMtap_box_y =  175
Local $arr_Skills_y[6] = [  275, 355,  423, 500, 575, 653 ]

Local $arr_UseSkills[6] = [ $eHS, $eDS, $eHM, $eFS, $eWC, $eSC ];

Local $SMtap_click_delay = 40

;; full menu mode
func AllSkillOpen()


	$g_autoing = True
	ToolTip('Up Hero  ontime start "', 0,0)

	; open hero menu
	OpenMenu($eSwordM)
	Sleep(100)

	MenuScrollUpFull();
	MenuScrollUpFull();

	Sleep(500)
	; check already done
	Local $aCoord = PixelSearch( 376, 958, 377, 965, 0x89f4fc, 5, 1)
	If Not @error Then
		;ConsoleWrite (" 	>> H btn : disabled " & $aCoord[0] & "," & $aCoord[1] & @CRLF )
		BottomMenuExitFull()
		Return False
	EndIf


	; activate SM box
	activate_SM()

	Sleep(400)
	; for ( get sk index )
	; 	activate  box  ( sk index)
	; 	up max lv

	For $iSk In $arr_UseSkills
		activateSk( $isk )
		maxUpSkill( $isk )
	Next

	BottomMenuExitFull()
EndFunc

Func activate_SM()
 	MouseClick("left", $SMtap_box_x, $SMtap_box_y, 1 ,3)
		Sleep($SMtap_click_delay)
EndFunc


Func activateSk( $i)
		;mouse click  i th skill box
 	MouseClick("left", $SMtap_box_x, $arr_Skills_y[$i], 1 ,4)
	Sleep($SMtap_click_delay)
EndFunc

Func maxUpSkill($i)
			; mouse click ith skill left : max up
	Local $SMtap_Max_x = 260
	MouseClick("left", $SMtap_Max_x, $arr_Skills_y[$i], 1 ,4)
	Sleep($SMtap_click_delay)
EndFunc



