;NSIS Modern User Interface version 1.67
;Installation script ProgramGrpMgr
;Likely compatible with Windows 8

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  ;include MUI_LANGUE_DISPLAY macro
  !include "${NSISDIR}\Contrib\Modern UI\BB.nsh"
;--------------------------------
;Configuration

 ;General
  Name "Program Group Manager"
  OutFile "InstallPrgGrpMgr.exe"
  
  RequestExecutionLevel admin
  
  ;Windows 8 manifest
  !packhdr "$%TEMP%\exehead.tmp" '"${NSISDIR}\mt.exe" -manifest "${NSISDIR}\app.manifest" -updateresource:"$%TEMP%\exehead.tmp"'

  !define MUI_ICON "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.ico"
  !define MUI_UNICON "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.ico"

  ;Folder selection page
  InstallDir "$PROGRAMFILES\ProgramGrpMgr"

  ;Get install folder from registry if available
  InstallDirRegKey HKCU "Software\SDTP\ProgramGrpMgr" "InstallDir"

  ;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Language Selection Dialog Settings

  ;Remember the installer language
  !define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
  !define MUI_LANGDLL_REGISTRY_KEY "Software\SDTP\ProgramGrpMgr"
  !define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"
  !define MUI_FINISHPAGE_SHOWREADME
  !define MUI_FINISHPAGE_SHOWREADME_TEXT "$(Check_box)"
  !define MUI_FINISHPAGE_SHOWREADME_FUNCTION inst_shortcut

;-----------------------------
;Pages


  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE $(licence)
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "French"

  ;Licence langage file
  LicenseLangString Licence ${LANG_ENGLISH} "C:\Users\Bernard\Delphi\sdtp\Progman\license.txt"
  LicenseLangString Licence ${LANG_FRENCH}  "C:\Users\Bernard\Delphi\sdtp\Progman\licensf.txt"

  ;Language strings for uninstall string
  LangString RemoveStr ${LANG_ENGLISH}  "Program Group Manager (remove only)"
  LangString RemoveStr ${LANG_FRENCH} "Gestionnaire de groupe de programmes (désinstallation seulement)"

  ;Language string for links
  LangString ProgramLnkStr ${LANG_ENGLISH} "Program Group Manager.lnk"
  LangString ProgramLnkStr ${LANG_FRENCH} "Gestionnaire de groupe de programmes.lnk"
  LangString UninstLnkStr ${LANG_ENGLISH} "Program Group Manager uninstall.lnk"
  LangString UninstLnkStr ${LANG_FRENCH} "Désinstallation du Gestionnaire de groupe de programmes.lnk"

  LangString ProgramDescStr ${LANG_ENGLISH} "Program Group Manager"
  LangString ProgramDescStr ${LANG_FRENCH} "Gestionnaire de groupe de programmes"

  ;Language strings for language selection dialog
  LangString LangDialog_Title ${LANG_ENGLISH}" "Installer Language|$(^CancelBtn)"
  LangString LangDialog_Title ${LANG_FRENCH}" "Langue d'installation|$(^CancelBtn)"

  LangString LangDialog_Text ${LANG_ENGLISH}" "Please select the installer language."
  LangString LangDialog_Text ${LANG_FRENCH}" "Choisissez la langue du programme d'installation."

  ;language strings for checkbox
  LangString Check_box ${LANG_ENGLISH}" "Install a shortcut on the desktop"
  LangString Check_box ${LANG_FRENCH}" "Installer un raccourci sur le bureau"



Section "Dummy Section" SecDummy
  SetShellVarContext all
  SetOutPath "$INSTDIR"
; Dans le cas ou on n'aurait pas pu fermer l'application
  Delete /REBOOTOK "$INSTDIR\ProgramGrpMgr.exe"
  File "/oname=ProgramGrpMgr.tmp" "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.exe"
  ; add files / whatever that need to be installed here.
  File "C:\Users\Bernard\Delphi\sdtp\Progman\history.txt"
  File "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.txt"
  File "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.lng"
  ;File "C:\Users\Bernard\Delphi\sdtp\Progman\ProgramGrpMgr.exe"
  Rename /REBOOTOK "$INSTDIR\ProgramGrpMgr.tmp" "$INSTDIR\ProgramGrpMgr.exe"
  File "C:\Users\Bernard\Delphi\sdtp\Progman\FAQ.txt"

  

  ;Write uninstall in register
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "DisplayName" "$(RemoveStr)"
  ;Retrieve exe version
  GetDllVersion "$INSTDIR\ProgramGrpMgr.exe" $R0 $R1
  IntOp $R2 $R0 / 0x00010000
  IntOp $R3 $R0 & 0x0000FFFF
  IntOp $R4 $R1 / 0x00010000
  IntOp $R5 $R1 & 0x0000FFFF
  StrCpy $0 "$R2.$R3.$R4.$R5"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "DisplayVersion" "$0"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "Publisher" "SDTP"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "URLInfoAbout" "www.sdtp.com"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr" "HelpLink" "www.sdtp.com"



  ;Write language to the registry (for the uninstaller)
  ;WriteRegStr HKCU "Software\SDTP\MMTVRecorder" "Installer Language" "$LANGUAGE"

  ;Store install folder
  WriteRegStr HKCU "Software\SDTP\ProgramGrpMgr" "InstallDir" $INSTDIR

  ; write out uninstaller
  WriteUninstaller "$INSTDIR\uninst.exe"
SectionEnd ; end of default section


; Install shortcuts, language dependant

Section "Start Menu Shortcuts"
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\ProgramGrpMgr"
  CreateShortCut  "$SMPROGRAMS\ProgramGrpMgr\$(ProgramLnkStr)" "$INSTDIR\ProgramGrpMgr.exe" "" "$INSTDIR\ProgramGrpMgr.exe" 0 SW_SHOWNORMAL "" "$(ProgramDescStr)"
  ;CreateShortCut  "$SMPROGRAMS\MeuhMeuhTV\$(HelpStr)" "$INSTDIR\MMTVRecorder.chm" "" "$INSTDIR\MMTVRecorder.chm" 0
  CreateShortCut  "$SMPROGRAMS\ProgramGrpMgr\$(UninstLnkStr)" "$INSTDIR\uninst.exe" "" "$INSTDIR\uninst.exe" 0
 
SectionEnd

;Uninstaller Section

Section Uninstall
SetShellVarContext all
; add delete commands to delete whatever files/registry keys/etc you installed here.
Delete /REBOOTOK "$INSTDIR\ProgramGrpMgr.exe"
Delete "$INSTDIR\history.txt"
Delete "$INSTDIR\ProgramGrpMgr.txt"
;Delete "$INSTDIR\ProgramGrpMgr.exe"
Delete "$INSTDIR\ProgramGrpMgr.lng"
Delete "$INSTDIR\FAQ.txt"
Delete "$INSTDIR\uninst.exe"

; remove shortcuts, if any.
  Delete  "$SMPROGRAMS\ProgramGrpMgr\$(ProgramLnkStr)"
  Delete  "$SMPROGRAMS\ProgramGrpMgr\$(UninstLnkStr)"
  Delete  "$DESKTOP\$(ProgramLnkStr)"
;  Delete "$SMPROGRAMS\MeuhMeuhTV\$(HelpStr)"


; remove directories used.
  RMDir "$SMPROGRAMS\ProgramGrpMgr"
  RMDir "$INSTDIR"

DeleteRegKey HKCU "Software\SDTP\ProgramGrpMgr"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ProgramGrpMgr"

SectionEnd ; end of uninstall section


Function .onInit
   !define MUI_LANGDLL_WINDOWTITLE "$(LangDialog_Title)"
  !define MUI_LANGDLL_INFO "$(LangDialog_Text)"
  !insertmacro MUI_LANGDLL_DISPLAY         ;To use the button localization
  !insertmacro Close_App "TFPrgMgr"   ; On ferme l'appli avant d'installer la nouvelle version
  ;FindWindow $0 "TFPrgMgr"
;StrCmp $0 0 notRunning
 ; MessageBox MB_OK|MB_ICONEXCLAMATION "MyApp is running. Please close it first" /SD IDOK
  ;Abort
  ;notRunning:
FunctionEnd


Function un.onInit
 ;Get language from registry
 !insertmacro MUI_UNGETLANGUAGE
 !insertmacro Close_App "TFPrgMgr"    ; On ferme l'appli avant de désinstaller
FunctionEnd

Function inst_shortcut
  CreateShortCut "$DESKTOP\$(ProgramLnkStr)" "$INSTDIR\ProgramGrpMgr.exe"
FunctionEnd
