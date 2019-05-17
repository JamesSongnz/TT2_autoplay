Local $arr_Heros_y[9] = [ 175, 245, 325, 400, 475, 550, 627, 700 ,777 ]
Local $Htap_box_x  = 370

Local $arr_Heros_pixel_y[9] = [ 250, 360, 480, 590, 705, 820, 930, 1045 ,1155 ]

	; 275
Func SpamHeroLvUp ($i)

	; check this row is enabled.  box pixel x  = 512,
	Local $aCoord = PixelSearch( 512 , $arr_Heros_pixel_y[$i] , 520, $arr_Heros_pixel_y[$i] + 25 ,  0x959595, 5   )
	If Not @error Then
		;ConsoleWrite (" 	>> H btn : disabled " & $aCoord[0] & "," & $aCoord[1] & @CRLF )
		Return False
	EndIf

	; if enabled .. the click
	;HeroLvUp($i)
	; more speed
	MouseClick("left", $Htap_box_x, $arr_Heros_y[$i], 1, 2) ;
	MouseClick("left", $Htap_box_x, $arr_Heros_y[$i], 1, 2) ;

	Return True
EndFunc

Func HeroLvUp ($i)

	For $j = 1 To 2
		MouseClick("left", $Htap_box_x, $arr_Heros_y[$i], 1, 2) ;
		Sleep(50)
	Next


EndFunc


Local $Htap_bar_x = 200
Local $Htap_lowst_h_y = 780  ;  => 80
Local $Htap_towards_swipe_y = 100

func ScrollHeroFullUp()
	Local $init_pos_x = $Htap_bar_x, $init_pos_y = $Htap_lowst_h_y, $end_pos_y = $Htap_towards_swipe_y
	;MouseClickDrag("left", 239, 750, 239, 470 ,10)
	MouseMove($init_pos_x,$init_pos_y,1)
	MouseDown($MOUSE_CLICK_LEFT)
		Sleep(200)
	MouseMove($init_pos_x,$init_pos_y - 20,7)
	MouseMove($init_pos_x,$end_pos_y + 20 ,5)
	MouseMove($init_pos_x,$end_pos_y,7)

	;MouseMove($init_pos_x,$end_pos_y ,9)
		Sleep(500)
	MouseUp($MOUSE_CLICK_LEFT)
EndFunc

func ScrollHeroBottom()
	ScrollHeroFullUp()
	;ScrollHeroFullUp()
EndFunc
