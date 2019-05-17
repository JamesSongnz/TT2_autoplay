#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>


; set  option
Opt("MouseCoordMode", 2)
Opt( "PixelCoordMode", 2)

Global $g_bPaused = False
Global $g_autoing = False


#include "Mytypes.au3"
#include "libs_main.au3"
#include "utils.au3"
#include "ui_utils.au3"
#include "herotap_common.au3"
#include "herotap_allup.au3"
#include "openskilltap.au3"
#include "HeroTap_lvup.au3"
#include "action_hs.au3"
#include "action_sks.au3"
#include "action_scr.au3"
#include "action_main.au3"

; TODO :
; 1,  faster  all lv up
;
; run mode setting :   HSBossMM , HSsiphon
;  fairy collect btn check
;2\. renew sks :
	; Loop
	;   activate SC  wait ->  SC first
	; wait 300  -> DS, FS, WC
	; wait 120 -> HM
	; check sks -> always run SC
; tap while waiting until SC activated

; Assgins the HotKey to our custom exit function
HotKeySet("{ESC}", "OnExit")
HotKeySet("{F1}", "AutoLvupStart")
HotKeySet("{F2}", "AutoLvupStop")
HotKeySet("{F3}", "Use5Sks")
HotKeySet("{F7}", "middleGoing")

HotKeySet("{F8}", "AllSkillOpen")
HotKeySet("{F9}", "AllHeroLvUp")
HotKeySet("{F10}", "SetFinishTime")
HotKeySet("{PAUSE}", "TogglePause")

;HotKeySet("{F4}", "CheckFairies")

;HotKeySet("{F4}", "CheckNextUseSks")
HotKeySet("{F4}", "testFunction")



; title : us  , class : Qt5QWindowIcon
WinActivate("[CLASS:Qt5QWindowIcon]")
WinMove("nz", "", 0,0 )
; us -2,2 , 481, 882)
;us win size is /...
; default size : , 481, 886 <=  does not work !!!


;Global $hWnd = WinGetHandle("nz")
;$checksum = PixelChecksum(20, 175, 250, 250, 1, $hWnd)
;consolewrite ($hWnd & " Error:" & @error&@TAB&"Checksum is " &  $checksum & @CRLF)


Global $screen_pairy_x = 325, $screen_pairy_y = 630
func testFunction()


	Local $SCLvCS = PixelChecksum( 144, 953, 167, 968   )
	ConsoleWrite(" lv 25 " & $SCLvCS )
;~ FairyCollect()
;~
;~ CheckTapOpen()

;~     ; Wait 10 seconds for the Notepad window to appear.
;~     Local $hWnd = WinWait("nz", "", 10)

;~     ; Retrieve the client area of the Notepad window using the handle returned by WinWait.
;~     Local $aClientSize = WinGetClientSize($hWnd)
;~ 	ConsoleWrite( " Client Size " & "Width: " & $aClientSize[0] & @CRLF & "Height: " & $aClientSize[1])

;WinMove("us", "", Default, Default, 200, 200)
;~ UseHS();

;~ For  $i = $eHS to $eSC
;~ 	Local $pixelCheck = GetSkBtnCheckSum($i)
;~     ConsoleWrite( "My Pixel Check Sum : " & $pixelCheck & ": Area x:" &$aSksPixelCoord[ $i ] &  " y:" & $Skill_btn_pixel_y & @CRLF)
;~ Next

;~ 	$BossBoxCS = PixelChecksum( 570, 88 , 600 , 125)
;~ 	ConsoleWrite ( "HS CS  :" & $BossBoxCS  & @CRLF)
;~             If OnTimeFinish() == True Then
;~                 If CheckFinish() == True Then
;~ 					ConsoleWrite(" Finished ~!!!! ")
;~ 				EndIf
;~             EndIf

 ;           If OnTimeCheckNextSks() = True Then
 ;               CheckNextUseSks()
 ;           EndIf

#comments-start
ScrollToTop()

;MenuScrollUpFull()
ConsoleWrite ( " Tapp Open check :  result " & CheckTapOpen() & @CRLF )

; mamn check
IsEnoughMana()

	; scr center
	;Local $pixelCheck = PixelCheckSum(217 , 277 , 250, 300 )
	; SC btn
	Local $pixelCheck = PixelCheckSum(629 , 1185 , 687, 1211 )

	;Local $pixelCheck = PixelCheckSum(238, 490, 291, 530+130)
    ConsoleWrite( "My Pixel Check Sum : " & $pixelCheck  & @CRLF)

	Local $iColor = PixelGetColor(557, 104)
	   ConsoleWrite( "Color  : " & Hex($iColor,6)  & @CRLF)
	; 557 104  = EF6210



    ; check all sk btn are activated

For  $i = $eHS to $eSC
        If IsActivatedSkBtn($i) <> True Then
            ConsoleWrite( " i :" & $i & @CRLF )
        EndIf
Next

#comments-end
     ;   While (1)
     ;       HSSpamming()
     ;   WEnd
EndFunc

Func SetFinishTime()
	ConsoleWrite(" <<<< Set finish Time ! " &@CRLF)
		 $DurationFinish -=  10000 ;  10min 11*60*1000
		$DurationForceFinish  -=  60000 ; 2min
EndFunc



While (1)
	Sleep(5000)
WEnd


Func middleGoing()
        Use5Sks();

        ; set timer
        ResetTimer()

        While (1)

			BossStateCheck()  	; boss fight box
			FairyCollect() 		; fairy collect  btn check

			ToolTip('Up Hero  ontime start ' & Int(TimerDiff($FinishTimeBase)/1000), 0,0)
            HSSpamming()

            If OnTimeCheckNextSks() = True Then
                CheckNextUseSks()
            EndIf

            ; check  time  for Fairy , NextUseSk, Finish decision
            If OnTimeFairyCheck() == True Then ; 1min
                CheckFairies()
            EndIf

            If OnTimeFinish() == True Then
                If CheckFinish() == True Then ExitLoop
			EndIf

			Sleep(100)
        WEnd

EndFunc





Func AutoLvupStart()

	$g_autoing = True
	Local $nPrestiges  = 0
	ToolTip('Auto Lv Up Start ', 0,0)
    Do
		InitVariable()
        OpenInitialTaps()

		middleGoing()

	$nPrestiges = $nPrestiges +1
	ConsoleWrite(" Finished ~!!!! " & $nPrestiges & "th , total HS hits "  & $numTotalHShits & @CRLF)
     Until 0		; infinite loop

EndFunc



Func AutoLvupStop()
	$g_autoing = False
	ToolTip('Auto Lv Up  End ',0,0)
EndFunc

Func UseSkills()
		BottomMenuExit()
	Local $skill_fire_x = 260, $skill_btn_y = 725
	; 115, 185, 260, 335, 405
	Local $skill_warcry_x = 340
			; skill use fire
		MouseClick("left", 115 , $skill_btn_y )
		MouseClick("left", 185, $skill_btn_y )
		MouseClick("left", $skill_fire_x, $skill_btn_y )
		MouseClick("left", $skill_warcry_x, $skill_btn_y )
		MouseClick("left", 405, $skill_btn_y )
		MouseClick("left", 405, $skill_btn_y ) ;;twice .. confirm
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








Func UpHeroLv_main()
	; HS
	TapStop()

	$g_autoing = True
	ToolTip('Up Hero  ontime start "', 0,0)

	BottomMenuExit()

	; open hero menu
	OpenMenu($eHeroM)
	Sleep(100)

	MenuScrollUp2()
	ScrollTopAlign()

	;; high H  twice up
	HeroLvUpOnScr_ascendent()
	ScrollDownOnHero()
	;; high H  twice up
	HeroLvUpOnScr_ascendent()

	;; up to top
	MenuScrollUp2()
	MenuScrollUp2()

	; close menu

	BottomMenuExit()
		; move screen center
	MouseClick("left", $screen_click_x, $screen_click_y)
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

