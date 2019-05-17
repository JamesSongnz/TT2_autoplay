Local $menufull_exit_x = 453
Local $menufull_exit_y = 45

Func OpenMenu($menu)

	;BottomMenuExitFull()

	ConsoleWrite( " Open menu ")

	Local $cnt  = 0
	while $cnt < 10
	ConsoleWrite( " Open menu " & $menu )

	Select
		Case $menu = $eSwordM
			MouseMove($sword_m_x, $bottom_m_y,1)
			MouseDown("left")
				MouseUp("left")
				;MouseClick("left", $sword_m_x, $bottom_m_y,1, 3)

		Case $menu = $eHeroM
;~ 			MouseMove($hero_m_x, $bottom_m_y,1)
;~ 			;Sleep(100)
;~ 			MouseDown("left")
;~ 			MouseUp("left")
			MouseClick("left", $hero_m_x, $bottom_m_y, 1, 3)
	EndSelect

		ConsoleWrite( " 		> before sleep heck tap open  menu ")
		Sleep(1100)

		ConsoleWrite( " 		> check tap open  menu ")
		If CheckTapOpen() = True Then ExitLoop

		; check half tap
		Local $HalfTapBtn  = PixelChecksum(555, 749 , 593, 762)
		If $HalfTapBtn = 1601803446 Then MouseClick("left", 381, 507 , 1, 2 )

		$cnt += 1
	WEnd

EndFunc


Func BottomMenuExit()
	MouseClick("left", $menu_exit_x, $menu_exit_y, 1, 5)
EndFunc

Func BottomMenuExitFull()

	If CheckTapOpen() == True Then
		; exit menu
			MouseMove($menufull_exit_x, $menufull_exit_y, 1)
			MouseClick("left", $menufull_exit_x, $menufull_exit_y, 1, 5)
	EndIf
	; wait until disappear menu tap
	Sleep(200)
EndFunc



Func HeroLvUpOnScr1time($nTimes, $delay)
	Dim $g_autoing
	; lv up up
		For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
			MouseClick("left", $sword_m_lv_btn_x, $i , 2, 3)
			if $g_autoing <> True Then Return False
		Next
	Return True
EndFunc


Func HeroLvUpOnScr_main()
	return HeroLvUpOnScr_param(1, 3)

EndFunc


Func HeroLvUpOnScr_ascendent()
	return HeroLvUpOnScr_param(2, 5)
EndFunc

Func HeroLvUpOnScr_param($nTimes, $delay)
	Dim $g_autoing
	; lv up up

	For $cnt = 1 To $nTimes
		HeroLvUpOnScr1time(2, $delay)
	Next


	Return True
EndFunc

Func ScrollDownOnHero()

	;; scrooll
	Sleep(100)
	ScrollHeroMDown()
	Sleep(100)
EndFunc


func ScrollHeroMDown()
	Local $init_pos_x = 375, $init_pos_y = 750, $end_pos_y = 460
	;MouseClickDrag("left", 239, 750, 239, 470 ,10)
	MouseMove($init_pos_x,$init_pos_y)
	MouseDown($MOUSE_CLICK_LEFT)
		Sleep(200)
	MouseMove($init_pos_x,$init_pos_y - 20,7)
	MouseMove($init_pos_x,$end_pos_y + 20 ,5)
	MouseMove($init_pos_x,$end_pos_y,7)

	;MouseMove($init_pos_x,$end_pos_y ,9)
		Sleep(350)
	MouseUp($MOUSE_CLICK_LEFT)
EndFunc



func MenuScrollUp2()
	Local $init_pos_x = 190, $init_pos_y = 500

		MouseMove($init_pos_x, $init_pos_y)
		MouseDown($MOUSE_CLICK_LEFT)
		;Sleep(300)
		MouseMove($init_pos_x,$init_pos_y + 40,3)
		MouseMove($init_pos_x,$init_pos_y + 280,2)
		MouseMove($init_pos_x,$init_pos_y + 360,1)
		MouseUp($MOUSE_CLICK_LEFT)

		;MouseMove($init_pos_x,$init_pos_y + 400,1)
		MouseMove($init_pos_x,$init_pos_y + 600,1)
EndFunc


func MenuScrollUpFull()
	Local $init_pos_x = 190, $init_pos_y = 100

		MouseMove($init_pos_x, $init_pos_y,1)
		MouseDown($MOUSE_CLICK_LEFT)
		;Sleep(300)
		MouseMove($init_pos_x,$init_pos_y + 60,3)
		MouseMove($init_pos_x,$init_pos_y + 350,2)
		MouseMove($init_pos_x,$init_pos_y + 500,1)
		MouseUp($MOUSE_CLICK_LEFT)

		;MouseMove($init_pos_x,$init_pos_y + 400,1)
		MouseMove($init_pos_x,$init_pos_y + 1200,1)
		Sleep(450)
EndFunc


Func MenuScrollUp()
	Dim $g_autoing
	MouseMove(190, 640)
	MouseWheel($MOUSE_WHEEL_UP, 3);
	if $g_autoing  <> True Then Return False

	Sleep(300)
	MouseWheel($MOUSE_WHEEL_UP, 3);
	if $g_autoing  <> True Then Return False

	Sleep(300)
	MouseWheel($MOUSE_WHEEL_UP, 3);

	;MouseClickDrag("left", 190, 530, 190, 760, 3 )
	;MouseClickDrag("left", 190, 530, 190, 760, 3 )
	Return True
EndFunc

Func ScrollTopAlign()
	MouseClickDrag("left", 239, 580, 239, 530 ,10)
EndFunc


func ClicksForTime( $x, $y, $sec)
	Local $sleepms = 200
	Local $endtime = $sec* (1000/$sleepms)
	for $i=0 To $endtime Step 1
		MouseClick("left", $x, $y, 1 ,3)
		Sleep($sleepms)
	Next

EndFunc

Func ClicksMoveTime( $x1, $y1, $x2, $y2, $sec)
	Local $sleepms = 20
	Local $endcount = $sec* (300/$sleepms)
	Local $x = $x1, $y = $y1
	Local $xstep = ($x2 - $x1) / $endcount
	Local $ystep = ($y2 - $y1) / $endcount

	for $i=0 To $endcount Step 1
		MouseClick("left", $x, $y, 1 ,1)
		$x = $x + $xstep
		$y = $y + $ystep
		Sleep($sleepms)
	Next
EndFunc


Func ScreenClicks_main()
		; click pet
		ClicksForTime($screen_click_x, $screen_click_y, 1)
		if $g_autoing  <> True Then Return False

		; click pairy
				; move  - pairy 140, 330,    y : 240
		Local $screen_pairy_y =  240
		ClicksForTime( 140,  $screen_pairy_y, 1)
		if $g_autoing  <> True Then Return False

		ClicksForTime( 330,  $screen_pairy_y, 1)
		if $g_autoing  <> True Then Return False

		; round screen
		; 387, 185  -> nx, 422   -> 50, 422 -> 41, 172
		ClicksMoveTime( 387, 185, 387, 422, 1)
		ClicksMoveTime( 50, 422, 50, 172, 1)
		;ClicksMoveTime( 50, 172, 380, 185, 1)

		;; ship glow
		ClicksForTime( 40 , 180, 1)

		; click pet
		ClicksForTime($screen_click_x, $screen_click_y, 1)
EndFunc

Func ScreenClicks()
		; click pet
		MouseClick("left", $screen_click_x, $screen_click_y, 2 ,10)

		; click pairy
				; move  - pairy
	;	MouseClick("left", $screen_pairy_x, $screen_pairy_y, 1 ,1)
		Sleep(1000)

		;stop
		TapStop()
		BottomMenuExit()

		; remove window
		MouseClick("left", 144, 616, 3 ,1)

		; click pet - return
		MouseClick("left", $screen_click_x, $screen_click_y, 2 ,1)
		TapStart()
		Sleep(1000)
EndFunc



Func TapStart()
	Send("{F6}")
EndFunc

Func TapStop()
	Send("{F6}")
EndFunc