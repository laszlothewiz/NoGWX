@echo off
::Checking for administrator rights and restarting the script in elevated mode if needed
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( 
	goto gotPrivileges 
) else ( 
	powershell "saps -filepath '%0' -verb runas" >nul 2>&1
)
exit /b 
:gotPrivileges
echo THIS SCRIPT IS GOING TO RE-ENABLE THE WINDOWS 10 PROMOTIONAL
echo NOTIFICATIONS. IF THIS IS NOT YOUR INTENT THEN CLOSE THIS WINDOW NOW.
echo .
echo .
echo This is a free, Open Source script. Therefore:
echo .
echo The software is provided "as is", without warranty of any kind, express or
echo implied, including but not limited to the warranties of merchantability,
echo fitness for a particular purpose and noninfringement. In no event shall the
echo authors or copyright holders be liable for any claim, damages or other
echo liability, whether in an action of contract, tort or otherwise, arising from,
echo out of or in connection with the software or the use or other dealings in the
echo software.
echo .
echo To see full licensing detail go to: www.github.com/laszlothewiz/NoGWX
pause
takeown /r /d N /f c:\windows\system32\gwx 
icacls c:\windows\system32\gwx  /c /t /remove:d everyone
icacls c:\windows\system32\gwx\*.*  /c /t /remove:d everyone
icacls c:\windows\system32\gwx  /c /t /grant "NT SERVICE\TrustedInstaller":F
reg delete HKLM\Software\Policies\Microsoft\Windows\Gwx /v DisableGwx /f 
pause
cls
echo ALL DONE!
echo .
echo Please restart the computer so that all changes take full effect.
pause
