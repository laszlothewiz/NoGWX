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
echo THIS SCRIPT IS GOING TO PERMANENTLY DISABLE THE WINDOWS 10 PROMOTIONAL
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
taskkill /IM GWX*
takeown /r /d N /f c:\windows\system32\gwx 
icacls c:\windows\system32\gwx\*.*  /c /t /deny everyone:F
icacls c:\windows\system32\gwx  /c /t /deny everyone:F
::just for good measure, add disabling by registry settings
reg add HKLM\Software\Policies\Microsoft\Windows\Gwx /v DisableGwx /t REG_DWORD /d 1 
cls
echo ALL DONE!
echo .
echo Enjoy the peace!
echo .
echo Please restart the computer so that all changes take full effect.
pause
