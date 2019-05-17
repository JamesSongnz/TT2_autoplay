

Local $Htap_box_x  = 370
Local $num_Hero_up  = 6

Func HT_LvUp_playing()


	;Debug( " start LvUp playing ")

	Local $upCnt  = 0

	; open hero menu
	OpenMenu($eHeroM)

	;; to Top
	ScrollToTop()

	; for 2 nd  to n th  click *2
	For $i=1 To $num_Hero_up
		$ret  = SpamHeroLvUp($i );
		If $ret = True Then $upCnt += 1

	Next



	BottomMenuExitFull()

	If $upCnt < 3 Then Sleep(500)

	EndFunc


Func ScrollToTop()

	Local $TopButtonSC = 4014433329
	Local $Checksum  = PixelChecksum( 520, 154,  527, 167 )
	;ConsoleWrite ( " Top " & $Checksum &@CRLF )

	if $Checksum <> $TopButtonSC Then
		MenuScrollUpFull()
		Sleep(100)
	EndIf
EndFunc

