#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>



Opt("MouseCoordMode", 1)
Opt( "PixelCoordMode", 1)

Global $g_bPaused = False
Global $g_autoing = False

Global $screen_pairy_x = 200, $screen_pairy_y = 210


#include "Mytypes_msi.au3"
#include "libs.au3"

; Assgins the HotKey to our custom exit function
HotKeySet("{ESC}", "OnExit")
HotKeySet("{F1}", "AutoLvupStart")
HotKeySet("{F2}", "AutoLvupStop")
HotKeySet("{F5}", "UpSwordLv")
HotKeySet("{F7}", "UpHeroLv")
HotKeySet("{F9}", "UpHeroLvAll")
HotKeySet("{PAUSE}", "TogglePause")


HotKeySet("{F4}", "testFunction")

WinActivate("[CLASS:LDPlayerMainFrame]")
WinMove("LDPlayer", "", 0,0 )

func testFunction()

	BottomMenuExit()
	;
	#cs


$g_autoing = True
	Local $nTimes = 6, $delay = 15
	For $i = $hero_m_lv_btn1_y To $hero_m_lv_btn4_y Step 45
		MouseClick("left", $sword_m_lv_btn_x, $i , $nTimes, $delay)
		if $g_autoing <> True Then Return False

	;MouseClick("left", $hero_m_lv_btn_x, $hero_m_lv_btn2_y, 3, 1)
	;MouseClick("left", $hero_m_lv_btn_x, $hero_m_lv_btn3_y, 3, 1)
	Next

	#ce
EndFunc


While (1)
	Sleep(5000)
WEnd

func AutoLvup()

	While (1)
		ToolTip('Auto Lv Up ing... "', 0,0)
		Sleep(1000)
		UpSwordLv()

		Sleep(200)
		UseSkill()




		For $i = 0 To 5
			if $g_autoing  <> True Then Return
			ScreenClicks_highlv()		; takes 4sec
			ToolTip('Auto Lv Up ing :  ' & $i , 0,0)
		Next


		Sleep(1000)
		UpHeroLv()

		For $i = 0 To 5
			if $g_autoing  <> True Then Return
			ScreenClicks_highlv()		; takes 4sec
			ToolTip('Auto Lv Up ing :  ' & $i , 0,0)
		Next

		; remove rate window
		MouseClick("left", 390, 124 )


	WEnd
EndFunc


Func AutoLvupStart()
	$g_autoing = True
	ToolTip('Auto Lv Up Start ', 0,0)
	AutoLvup()
EndFunc

Func AutoLvupStop()
	$g_autoing = False
	ToolTip('Auto Lv Up  End ',0,0)
EndFunc

Func UseSkill()
		BottomMenuExit()
	Local $skill_fire_x = 260, $skill_btn_y = 725
	Local $skill_warcry_x = 340
			; skill use fire
		MouseClick("left", $skill_warcry_x, $skill_btn_y )
		; move screen center
		MouseClick("left", $screen_click_x, $screen_click_y, 2 ,1)
EndFunc

Func UpSwordLv()
	ToolTip('Sword Lv UP "', 0,0)
	TapStop()
	BottomMenuExit()
	;Send("{F6}")
	OpenMenu($eSwordM)


	Sleep(300)
	;; scroll up
	MenuScrollUp2()

	; click up
	MouseClick("left", $hero_m_lv_btn_x, $sword_m_lv_btn_y )

	; close menu
	BottomMenuExit()

	; move screen center
	MouseClick("left", $screen_click_x, $screen_click_y, 1 ,1)
	TapStart()
EndFunc







Func UpHeroLvAll()
	$g_autoing = True
	ToolTip('Up Hero All start "', 0,0)
	BottomMenuExit()

	; open hero menu
	OpenMenu($eHeroM)

	For $i =  1 To 3 Step 1
		$ret  = MenuScrollUp2()
		if $ret <> True  Then ExitLoop

	Next


	ScrollTopAlign()

	For $i = 9 To 1 Step -1
		$ret = HeroLvUpOnScr(0,0)
		if $ret <> True  Then ExitLoop
	Next

MenuScrollUp2()
MenuScrollUp2()
MenuScrollUp2()

	BottomMenuExit()

	; move screen center
	MouseClick("left", $screen_click_x, $screen_click_y)
	TapStart()
	ToolTip('Up Hero All End "', 0,0)

EndFunc


Func UpHeroLv()
	$g_autoing = True
	ToolTip('Up Hero  ontime start "', 0,0)

	TapStop()
	BottomMenuExit()

	; open hero menu
	OpenMenu($eHeroM)
	Sleep(100)

	MenuScrollUp2()
	ScrollTopAlign()

	;; high H  twice up
	HeroLvUpOnScrFast(4,4)
	For $i = 1 To 4 Step 1
		HeroLvUpOnScrFast(4,4)
		;; scrooll
		Sleep(100)
		ScrollHeroMDown()
		Sleep(100)
	Next
	; last lv up
	HeroLvUpOnScrFast(4,4)

	;; up to top
	MenuScrollUp2()
	MenuScrollUp2()

	; close menu
	BottomMenuExit()

		; move screen center
	MouseClick("left", $screen_click_x, $screen_click_y)
	TapStart()
EndFunc



Func OnExit()
	Exit
EndFunc

Func TogglePause()
	$g_bPaused = Not $g_bPaused
	While $g_bPaused
		Sleep(1000)
		ToolTip('Script is "Paused"', 0,0)
	WEnd
	ToolTip("")
EndFunc

