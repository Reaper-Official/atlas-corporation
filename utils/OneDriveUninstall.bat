@echo off
echo Désinstallation de OneDrive

echo Désinstallation de OneDrive en cours...

:: Arrêter le processus OneDrive s'il est en cours d'exécution
echo Arrêt de OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1

:: Désinstaller OneDrive (fonctionne pour les versions 32 et 64 bits)
echo Désinstallation de OneDrive...
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
) else (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
)

:: Supprimer les dossiers restants de OneDrive
echo Suppression des dossiers OneDrive...
rd "%UserProfile%\OneDrive" /s /q >nul 2>&1
rd "%LocalAppData%\Microsoft\OneDrive" /s /q >nul 2>&1
rd "%ProgramData%\Microsoft OneDrive" /s /q >nul 2>&1

:: Supprimer les clés de registre associées
echo Nettoyage des clés de registre...
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1

:: Désactiver l'intégration de OneDrive avec l'explorateur Windows
echo Désactivation de l'intégration de OneDrive avec l'explorateur...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f >nul 2>&1

echo OneDrive a été désinstallé avec succès !

timeout 5 /nobreak