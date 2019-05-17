; This is main 

; action set timer


Func OpenInitialTaps()

    ; check tap open  then close
    If CheckTapOpen() == True Then
    	BottomMenuExitFull()
    EndIf

    AllSkillOpen()
    AllHeroLvUp()

EndFunc




func HSSpamming()
	ConsoleWrite ( "## HS Spamming " & @CRLF )
	; if DS, SC are not using ,, skip HS spam ; activated is ready. ( not using)
;	If IsActivatedSkBtn($eDS) = True Or IsActivatedSkBtn($eSC) = True Then

	If IsEnabledBtn($eSC) = True And IsEnabledBtn($eDS) = True And IsEnabledBtn($eWC) = True And IsEnabledBtn($eFS) = True Then

		UseHS();

		; activate FS buff
		Activate_SummonInferno();

		HT_LvUp_playing()

	Else
		; enabled ..  =  not activated or not deactivated..
		ConsoleWrite ( "  	## HS > Skill not ready  " & @CRLF )

		If $PlayMode =  $eHSSiphon then FairyCatch() ; click scr

		Return False  ; not yet ready all
	EndIf

EndFunc


func Activate_SummonInferno()
	Local $x = 162
	Local $y = 428
	For $j = 1 To 30
		MouseClick("left", $x, $y , 1, 10) ;
	Next
EndFunc



; Fairy get action
Func CheckFairies()

    Local $adVidBtn_x = 350, $adVidBtn_y = 690

 ;; loop n times (2)
	ToolTip(" It's Fairy time" , 0,0, "--")
    Local $count  = 0
    Do
     ; click scr  move to right
     FairyCatch();   ; 5 sec
     Sleep(300)

     ; check ad video b
     ;MouseClick("left", $adVidBtn_x, $adVidBtn_y ,2, 3)
	FairyCollect();
     $count = $count + 1
    Until $count = 2

EndFunc

Func FairyCollect()
		Local $f_collect_coord[2] = [453, 1040]

		;ConsoleWrite( " Fairy Collect check " & Hex(PixelGetColor($f_collect_coord[0], $f_collect_coord[1])) )
		If PixelGetColor($f_collect_coord[0], $f_collect_coord[1]) = 0xFFFFFF Then
		;		ConsoleWrite( "Found Fairy Collect check " & (PixelGetColor($f_collect_coord[0], $f_collect_coord[1])) )
			MouseClick("left", 353 , 693, 1, 2)		;; mouse coord is differ from pixel coord : btn fairy collect`
		EndIf

EndFunc


;Sk Activate action
Func CheckNextUseSks()
	ConsoleWrite ( " ** Check Next Sks ! " & @CRLF )

	If $PlayMode = $eHSBossMM Then
		HSBossMM_CheckNextUseSks()
	Else
		HSSiphon_CheckNextUseSks()
	EndIf


    ResetSkTimer();

EndFunc


Func HSBossMM_CheckNextUseSks()

    ; if eSC btn  is ongoing  ; neither deactivated and activated
    ; return notyet .  ; not reset timebase
    ; if eSC is deactivated ; less mana
    ; return notyet ; not resset timebase

    $btnCheckSum  = GetSkBtnCheckSum($eSC);
	;ConsoleWrite ( " 	> GetSkBtnCheckSum($eSC): " & $btnCheckSum & " ActivatedSC SC : " & $csSkBtnActivated[$eSC]  & @CRLF)

    If $btnCheckSum <> $csSkBtnActivated[$eSC] Then
        Return False
    EndIf

    ; check all sk btn are activated
 ;   For  $i = $eHS to $eSC
 ;       If IsActivatedSkBtn($i) <> True Then
    ;        Return False  ; not yet ready all
 ;       EndIf
 ;   Next
	ConsoleWrite ( "  	**> check sks ready " & @CRLF )
	If IsActivatedSkBtn($eDS) <> True Or IsActivatedSkBtn($eSC) <> True Then

		ConsoleWrite ( "  	**> Skill not ready yet " & @CRLF )
		Return False  ; not yet ready all
	EndIf

	ConsoleWrite ( " 	**> check mana  " & @CRLF)
    ; if eSC is activated ; ready but need to check enough mana
    ; check remained mana  is enough
    If IsEnoughMana() <> True Then
        Return False
    EndIf

	ConsoleWrite ( " 	**> Use Sks " & @CRLF)
    ; use 5 sks
    ;  reset timebase
    Use5Sks();
EndFunc


Func HSSiphon_CheckNextUseSks()
	; Loop
	;   activate SC  wait ->  SC first
	; wait 300  -> DS, FS, WC
	; wait 120 -> HM
	; check sks -> always run SC
		ConsoleWrite ( "  	* SP > check SC ready " & @CRLF )
	If IsActivatedSkBtn($eSC) = True Then
		MouseClick("left", $aSksCoord[$eSC], $Skill_btn_y )
	EndIf

	; if SC not enabled ,, ->  try next
	If IsEnabledBtn($eSC) <> True Then Return False

	    ; check remained mana  is  ok for DS, FS, WC
   ; If IsEnoughMana() = True Then
		If IsActivatedSkBtn($eWC) = True Then MouseClick("left", $aSksCoord[$eWC], $Skill_btn_y )
		If IsActivatedSkBtn($eFS) = True Then MouseClick("left", $aSksCoord[$eFS], $Skill_btn_y )
		If IsActivatedSkBtn($eDS) = True Then MouseClick("left", $aSksCoord[$eDS], $Skill_btn_y )
	;EndIf

	; wait activate HM
	If IsActivatedSkBtn($eHM) = True Then
		MouseClick("left", $aSksCoord[$eHM], $Skill_btn_y )
	EndIf

EndFunc


; start compare stage to prev stage
; save cur stage checksum
Global $csPrevStage
Global $stuckCount = 0
Func CheckFinish()

    Local $stage_x = 341, $stage_y = 75  ; ,383, 103 236, 83  $stage_w = 100, $stage_h = 20

    ; compare stage checksum
    Local $csCurStage = PixelCheckSum($stage_x , $stage_y , 383, 108  )

	ConsoleWrite(  "@@@ Check Finish  checksum: " & $csCurStage & @CRLF )

    If $csCurStage <> $csPrevStage Then
        ; still progressing

        $csPrevStage = $csCurStage
		HSResetCount()
        Return False
    EndIf

	; If time passed more than 13min then force Finish
	Local $FinishElapsed = Int(TimerDiff( $FinishTimeBase))
    If $FinishElapsed < $DurationForceFinish Then

		; same stage then start counting
		;$stuckCount += 1
		ConsoleWrite( " 	@@@ > Check finish : HS hit  on Same stage num : " & $numHShits & @CRLF )
		If $numHShits < $StuckOfHShits Then        ;; wait more spamming
		   Return False
		EndIf

	Else
		ConsoleWrite(" @@@@ <<<<<<< Force Finish !!! " & $FinishElapsed & @CRLF )
	EndIf

    ; time to finish
    ActFinish()
    ;$stuckCount = 0
    Return True

EndFunc


;; rebirth
Func ActFinish()

    ; open SM tap
    OpenMenu($eSwordM)

    ; down scroll
    ScrollHeroBottom()

    ; click finish btn
    Local $SMtap_finishbox_y = 820
    MouseClick( "left", $SMtap_box_x  , $SMtap_finishbox_y  )

	Sleep(300)

	; Prestige
	MouseClick("left", 239, 687);

	Sleep(200)
	MouseClick("left", 324, 593) ; confirm

    ; wait some time
    Sleep(20000) ; 20s

	; 20 equipment popup
	MouseClick("left", 324, 593) ; confirm
EndFunc



Func BossStateCheck()
	Local $BossFightOnSC = 1192044391
	; ; BossFight Box co ord : 570, 88 , 600 , 125
	$BossBoxCS = PixelChecksum( 570, 88 , 600 , 125)
	If $BossBoxCS = $BossFightOnSC Then
		; Click to fight boss again
		; 407, 67
		MouseClick("left", 407, 67 )
	EndIf

EndFunc

#comments-start

func AutoLvup()

	While (1)
		ToolTip('Auto Lv Up ing... "', 0,0)
		Sleep(1000)

		UseSkills();

		For $i = 1 To 2
			if $g_autoing  <> True Then Return
			ScreenClicks_main()		; takes 5sec
			ToolTip('Auto Lv Up ing :  ' & $i , 0,0)
			if $g_autoing  <> True Then Return False
		Next

		if $g_autoing  <> True Then Return False
		Sleep(1000)
		UpHeroLv_main()


	WEnd
EndFunc

#comments-end
