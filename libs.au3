

Func OpenMenu($menu)

	Select
		Case $menu = $eSwordM
			MouseClick("left", $sword_m_x, $bottom_m_y)

		Case $menu = $eHeroM
			MouseClick("left", $hero_m_x, $bottom_m_y)
	EndSelect
EndFunc


Func BottomMenuExit()
	MouseClick("left", $menu_exit_x, $menu_exit_y, 1, 5)
EndFunc


Func HeroLvUpOnScrFast($nTimes, $delay)
	Dim $g_autoing
	; lv up up
	For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
		MouseClick("left", $sword_m_lv_btn_x, $i , 4, 3)
		if $g_autoing <> True Then Return False
	Next
	Return True
EndFunc

Func HeroLvUpOnScr($nTimes, $delay)
	Dim $g_autoing
	; lv up up
	For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
		MouseClick("left", $sword_m_lv_btn_x, $i , 4, 3)
		if $g_autoing <> True Then Return False
	Next

	Sleep(200)

	For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
		MouseClick("left", $sword_m_lv_btn_x, $i , 4, 3)
		if $g_autoing <> True Then Return False

	;MouseClick("left", $hero_m_lv_btn_x, $hero_m_lv_btn2_y, 3, 1)
	;MouseClick("left", $hero_m_lv_btn_x, $hero_m_lv_btn3_y, 3, 1)
	Next

	For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
		MouseClick("left", $sword_m_lv_btn_x, $i , 4, 3)
		if $g_autoing <> True Then Return False
	Next

	Sleep(200)

	;; scrooll
	Sleep(100)
	ScrollHeroMDown()
	Sleep(100)

	Return True
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


Func ScreenClicks_highlv()
		; click pet
		MouseClick("left", $screen_click_x, $screen_click_y, 2 ,10)
		Sleep(1000)

		; click pairy
				; move  - pairy
		MouseClick("left", 50, $screen_pairy_y-50, 1 ,1)
		Sleep(1000)
		MouseClick("left", $screen_pairy_x+100, $screen_pairy_y, 1 ,1)
		Sleep(1000)

EndFunc

Func ScreenClicks()
		; click pet
		MouseClick("left", $screen_click_x, $screen_click_y, 2 ,10)

		; click pairy
				; move  - pairy
		MouseClick("left", $screen_pairy_x, $screen_pairy_y, 1 ,1)
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