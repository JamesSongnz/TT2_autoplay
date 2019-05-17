

Local $Htap_box_x  = 370






Func AllHeroLvUp()

	$g_autoing = True
	ToolTip('Up Hero All start "', 0,0)

	; open hero menu
	OpenMenu($eHeroM)


	; check already done
	Local $aCoord = PixelSearch( 512 , 1158 , 520, 1180 ,  0x959595, 5   )
	If Not @error Then
		;ConsoleWrite (" 	>> H btn : disabled " & $aCoord[0] & "," & $aCoord[1] & @CRLF )
		BottomMenuExitFull()
		Return False
	EndIf

	;; activate all hero
	HeroUp1Scr();
	ScrollHeroFullUp()

	HeroUp1Scr();
	ScrollHeroFullUp()

	HeroUp1Scr();
	ScrollHeroFullUp()

	HeroUp1Scr();

	;; last heros
	ScrollHeroBottom()
	; 745 , 680 , 610
	MouseClick("left", $Htap_box_x, 820, 1, 10) ;
	MouseClick("left", $Htap_box_x, 750, 1, 10) ;
	MouseClick("left", $Htap_box_x, 675, 1, 10) ;
;	MouseClick("left", $Htap_box_x, 560, 1, 10) ;


	;; towards Top
	MenuScrollUpFull();
	MenuScrollUpFull();
	MenuScrollUpFull();
	MenuScrollUpFull();
	MenuScrollUpFull();;
;	MenuScrollUpFull();

	;; activate ascendet hero again
	HeroUp1Scr();
	ScrollHeroFullUp()

		HeroUp1Scr();
	ScrollHeroFullUp()

		HeroUp1Scr();

	;; towards up
	MenuScrollUpFull();
	MenuScrollUpFull();
	MenuScrollUpFull();
	;; exit

	; close tap
	BottomMenuExitFull()


EndFunc


func HeroUp1Scr()
	For $i=0 To 8
		For $j = 1 To 2
		MouseClick("left", $Htap_box_x, $arr_Heros_y[$i], 1, 3) ;
		Sleep(70)
		Next
		;HeroLvUp($i );
		;if $g_autoing <> True Then ExitLoop
	Next
EndFunc




#comments-start
Func AllHeroLvUp()
	$g_autoing = True
	ToolTip('Up Hero All start "', 0,0)

	; open hero menu
	OpenMenu($eHeroM)

	For $i =  1 To 3 Step 1
		$ret  = MenuScrollUp2()
		if $ret <> True  Then ExitLoop

	Next


	ScrollTopAlign()

	For $i = 10 To 1 Step -1
		$ret = HeroLvUpOnScr_main()
		if $ret <> True  Then ExitLoop
		ScrollDownOnHero()
	Next

MenuScrollUp2()
MenuScrollUp2()
MenuScrollUp2()
MenuScrollUp2()
MenuScrollUp2()
MenuScrollUp2()


;; lv up ascendent  h
	ScrollTopAlign()

	For $i = 1 To 3
		$ret = HeroLvUpOnScr_ascendent()

		if $ret <> True  Then ExitLoop
		ScrollDownOnHero()
	Next

MenuScrollUp2()
MenuScrollUp2()
BottomMenuExit()

	; move screen center
	MouseClick("left", $screen_click_x, $screen_click_y)
;	TapStart()
	ToolTip('Up Hero All End "', 0,0)

EndFunc
#comments-end
