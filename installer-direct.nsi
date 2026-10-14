Unicode true
!include "MUI2.nsh"
!include "x64.nsh"
Name "privelifeof_reyas"
OutFile "${__FILEDIR__}/release/privelifeof_reyas-Setup-2.0.0.exe"
InstallDir "$LOCALAPPDATA\Programs\privelifeof_reyas"
RequestExecutionLevel user
SetCompressor zlib
Icon "${__FILEDIR__}/assets/icon.ico"
UninstallIcon "${__FILEDIR__}/assets/icon.ico"
BrandingText "privelifeof_reyas — Mon quotidien"
!define MUI_ABORTWARNING
!define MUI_WELCOMEPAGE_TEXT "Cet assistant installe privelifeof_reyas sur votre PC et crée un raccourci sur le bureau.$\r$\n$\r$\nL'application fonctionne hors connexion. Fermez une version déjà ouverte avant de continuer."
!define MUI_FINISHPAGE_RUN "$INSTDIR\privelifeof_reyas.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Ouvrir privelifeof_reyas"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "French"
Function .onInit
 ${IfNot} ${RunningX64}
  MessageBox MB_OK|MB_ICONSTOP "Cette application nécessite Windows 64 bits."
  Abort
 ${EndIf}
 SetShellVarContext current
FunctionEnd
Section "Installer"
 ClearErrors
 SetOutPath "$INSTDIR"
 IfErrors install_directory_error
 SetOverwrite on
 ClearErrors
 File /r /x ".*" "${__FILEDIR__}/release/win-unpacked/*"
 IfErrors install_files_error
 IfFileExists "$INSTDIR\privelifeof_reyas.exe" 0 install_files_error
 IfFileExists "$INSTDIR\resources\app.asar" 0 install_files_error
 ClearErrors
 SetOutPath "$INSTDIR"
 File /oname=privelife.ico "${__FILEDIR__}/assets/icon.ico"
 ClearErrors
 WriteUninstaller "$INSTDIR\Desinstaller.exe"
 CreateShortcut "$DESKTOP\privelifeof_reyas.lnk" "$INSTDIR\privelifeof_reyas.exe" "" "$INSTDIR\privelife.ico"
 CreateDirectory "$SMPROGRAMS\privelifeof_reyas"
 CreateShortcut "$SMPROGRAMS\privelifeof_reyas\privelifeof_reyas.lnk" "$INSTDIR\privelifeof_reyas.exe" "" "$INSTDIR\privelife.ico"
 CreateShortcut "$SMPROGRAMS\privelifeof_reyas\Désinstaller.lnk" "$INSTDIR\Desinstaller.exe"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "DisplayName" "privelifeof_reyas"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "UninstallString" '"$INSTDIR\Desinstaller.exe"'
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "DisplayIcon" "$INSTDIR\privelife.ico"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "DisplayVersion" "2.0.0"
 WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "NoModify" 1
 WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas" "NoRepair" 1
 Goto install_done
 install_directory_error:
  MessageBox MB_OK|MB_ICONSTOP "Impossible de créer le dossier d'installation : $INSTDIR"
  Abort
 install_files_error:
  MessageBox MB_OK|MB_ICONSTOP "Un fichier de l'application n'a pas pu être copié dans $INSTDIR. Consultez les détails de l'installation pour connaître le fichier concerné."
  Abort
 install_done:
SectionEnd
Section "Uninstall"
 SetShellVarContext current
 Delete "$DESKTOP\privelifeof_reyas.lnk"
 Delete "$SMPROGRAMS\privelifeof_reyas\privelifeof_reyas.lnk"
 Delete "$SMPROGRAMS\privelifeof_reyas\Désinstaller.lnk"
 RMDir "$SMPROGRAMS\privelifeof_reyas"
 Delete "$INSTDIR\chrome_200_percent.pak"
 Delete "$INSTDIR\.privelifeof_reyas.exe.pHHXm9"
 Delete "$INSTDIR\d3dcompiler_47.dll"
 Delete "$INSTDIR\icudtl.dat"
 Delete "$INSTDIR\vk_swiftshader.dll"
 Delete "$INSTDIR\vulkan-1.dll"
 Delete "$INSTDIR\LICENSES.chromium.html"
 Delete "$INSTDIR\LICENSE.electron.txt"
 Delete "$INSTDIR\snapshot_blob.bin"
 Delete "$INSTDIR\vk_swiftshader_icd.json"
 Delete "$INSTDIR\resources.pak"
 Delete "$INSTDIR\chrome_100_percent.pak"
 Delete "$INSTDIR\ffmpeg.dll"
 Delete "$INSTDIR\dxcompiler.dll"
 Delete "$INSTDIR\dxil.dll"
 Delete "$INSTDIR\privelifeof_reyas.exe"
 Delete "$INSTDIR\v8_context_snapshot.bin"
 Delete "$INSTDIR\.privelifeof_reyas.exe.5VIxf1"
 Delete "$INSTDIR\resources\app.asar"
 Delete "$INSTDIR\resources\elevate.exe"
 Delete "$INSTDIR\locales\lt.pak"
 Delete "$INSTDIR\locales\fr.pak"
 Delete "$INSTDIR\locales\kn.pak"
 Delete "$INSTDIR\locales\gu.pak"
 Delete "$INSTDIR\locales\hr.pak"
 Delete "$INSTDIR\locales\te.pak"
 Delete "$INSTDIR\locales\es-419.pak"
 Delete "$INSTDIR\locales\vi.pak"
 Delete "$INSTDIR\locales\ru.pak"
 Delete "$INSTDIR\locales\en-GB.pak"
 Delete "$INSTDIR\locales\fi.pak"
 Delete "$INSTDIR\locales\th.pak"
 Delete "$INSTDIR\locales\af.pak"
 Delete "$INSTDIR\locales\ar.pak"
 Delete "$INSTDIR\locales\uk.pak"
 Delete "$INSTDIR\locales\fil.pak"
 Delete "$INSTDIR\locales\sv.pak"
 Delete "$INSTDIR\locales\hi.pak"
 Delete "$INSTDIR\locales\sk.pak"
 Delete "$INSTDIR\locales\ml.pak"
 Delete "$INSTDIR\locales\da.pak"
 Delete "$INSTDIR\locales\nb.pak"
 Delete "$INSTDIR\locales\de.pak"
 Delete "$INSTDIR\locales\tr.pak"
 Delete "$INSTDIR\locales\pl.pak"
 Delete "$INSTDIR\locales\zh-TW.pak"
 Delete "$INSTDIR\locales\cs.pak"
 Delete "$INSTDIR\locales\nl.pak"
 Delete "$INSTDIR\locales\et.pak"
 Delete "$INSTDIR\locales\es.pak"
 Delete "$INSTDIR\locales\sw.pak"
 Delete "$INSTDIR\locales\ur.pak"
 Delete "$INSTDIR\locales\it.pak"
 Delete "$INSTDIR\locales\ms.pak"
 Delete "$INSTDIR\locales\ca.pak"
 Delete "$INSTDIR\locales\bn.pak"
 Delete "$INSTDIR\locales\bg.pak"
 Delete "$INSTDIR\locales\el.pak"
 Delete "$INSTDIR\locales\pt-BR.pak"
 Delete "$INSTDIR\locales\ko.pak"
 Delete "$INSTDIR\locales\am.pak"
 Delete "$INSTDIR\locales\lv.pak"
 Delete "$INSTDIR\locales\ro.pak"
 Delete "$INSTDIR\locales\id.pak"
 Delete "$INSTDIR\locales\ja.pak"
 Delete "$INSTDIR\locales\hu.pak"
 Delete "$INSTDIR\locales\pt-PT.pak"
 Delete "$INSTDIR\locales\ta.pak"
 Delete "$INSTDIR\locales\mr.pak"
 Delete "$INSTDIR\locales\fa.pak"
 Delete "$INSTDIR\locales\en-US.pak"
 Delete "$INSTDIR\locales\zh-CN.pak"
 Delete "$INSTDIR\locales\sl.pak"
 Delete "$INSTDIR\locales\sr.pak"
 Delete "$INSTDIR\locales\he.pak"
 RMDir "$INSTDIR\resources"
 RMDir "$INSTDIR\locales"
 Delete "$INSTDIR\privelife.ico"
 Delete "$INSTDIR\Desinstaller.exe"
 RMDir "$INSTDIR"
 DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\privelifeof_reyas"
 ; Les données personnelles du profil utilisateur sont conservées.
SectionEnd
