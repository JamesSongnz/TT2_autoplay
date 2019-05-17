
; This is configuration file
; you can modify play mode below


Global Enum $eSwordM, $eHeroM, $eEquipM


; screen coodinate
$screen_click_x = 258
$screen_click_y = 395

;; Sowrd Menu
$sword_m_x = 44
$bottom_m_y = 868

$sword_m_lv_btn_x = 365
$sword_m_lv_btn_y = 580


;; Hero Menu
$hero_m_x = 120

$hero_m_sc_init_x = 248
$hero_m_sc_init_y = 544

$hero_m_sc_end_y = 684

$hero_row_h =  70

$hero_m_lv_btn_x = 370

$hero_m_lv_btn1_y = 520
$hero_m_lv_btn2_y = 650
$hero_m_lv_btn3_y = 720
$hero_m_lv_btn4_y = 760

;; btn offset
$menu_exit_x = 400
$menu_exit_y = 470


;; Sk Btn Coord
Global $aSksCoord[6] = [ 22, 100, 180, 260, 340, 420 ]
Global $Skill_btn_y  = 788
 ; 788-795

Global Enum 	$eHS,	$eDS,	$eHM,	$eFS,	$eWC,	$eSC
Global $aSksPixelCoord[6] = [ 30, 155, 270, 395, 510, 633 ]
Global $Skill_btn_pixel_y  = 1175
Global $skill_btn_pixel_w  = 60
Global $skill_btn_pixel_h  = 24
Global $csSkBtnActivated[6] = [ 2233163836, 505859076, 2349001345, 2877753016, 2787870845, 4037236620 ]
Global $csSkBtnDeactivated[6] = [ 2233163836, 1394204771, 1210281817, 490733137, 3225108286, 679225155 ]


;; screen offset
Global  $Scr_Win_x  = 0 ; 2781
Global  $Scr_Win_y  = 0 ;1731
;2781, 1731


;; ========================
;; Play mode :
;; @ HS-BossMM, HS-siphon
Global Enum $eHSBossMM, $eHSSiphon, $eHSPush
Global $PlayMode =  $eHSSiphon

;----- different variables for playmode

Local $ForceFinishDuration[3] = [ 780000,  780000, 960000]
Local $SkillCheckDuration[3] = [17000, 6000 , 10000 ]
Local $FairyCheckDuration[3] = [ 60000, 30000, 25000]
Local $StuckOfHits[3] = [ 6, 7, 7]
Local $EnoughMana[3] = [270 ,  110, 180]
;=======================================================
; Timer functions

Global $DurationFinish =  		500000 ;  10min 11*60*1000
Global $DurationForceFinish = 	$ForceFinishDuration[$PlayMode] ; 14min *6
Global $DurationSkill =   $SkillCheckDuration[$PlayMode]
Global $DurationFairy =    $FairyCheckDuration[$PlayMode]
Global $FairyTimeBase, $SkTimeBase, $FinishTimeBase

;; ===========
;; counting variables
Global $numTotalHShits = 0
Global $numHShits = 0
Global $StuckOfHShits = $StuckOfHits[$PlayMode]

;;============ mana check
Global $enough_m_x = $EnoughMana[$PlayMode] ; check !!! form 0 : coord x of client
