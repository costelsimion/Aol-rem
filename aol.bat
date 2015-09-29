SET LOGFILE=AOLRem.log
call :Logit >> %LOGFILE% 
exit /b 0

:Logit
taskkill /F /IM aolsoftware.exe /T 
taskkill /F /IM aol.exe /T 
taskkill /F /IM waol.exe /T 
taskkill /F /IM AOLacsd.exe /T
sc delete "aol acs" 
Xcopy  /S /I /E %ALLUSERSPROFILE%\AOL %HOMEPATH%\Desktop\aolbackup
move %ALLUSERSPROFILE%\AOL %ALLUSERSPROFILE%\AOLBACKUP
RD /S /Q "%ALLUSERSPROFILE%\AOL Downloads" 
RD /S /Q "%ALLUSERSPROFILE%\AOL OCP" 
RD /S /Q "%ALLUSERSPROFILE%\AOL OCP" 
RD /S /Q "%ALLUSERSPROFILE%\AOL OCP" 

cd %PROGRAMFILES(X86)%
FOR /D /R %%X IN (Aol*) DO RD /S /Q "%%X"
cd %PROGRAMFILES%
FOR /D /R %%X IN (AOL*) DO RD /S /Q "%%X"


RD /S /Q "%LOCALAPPDATA%\AOL" 
RD /S /Q "%APPDATA%\AOL"
reg delete "HKEY_CURRENT_USER\Software\AOL" /f
reg delete "HKEY_CURRENT_USER\Software\America Online" /f

